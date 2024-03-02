
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;

public class Program {
    public static void main(String[] args) {
        if (args.length != 1 ||!args[0].startsWith("--threadsCount=")){
            System.err.println("Incorrect arguments");
            System.exit(-1);
        }
        int threadsCount = Integer.parseInt(args[0].substring(15));
        LinkedBlockingQueue<String> urlsQueue = new LinkedBlockingQueue<>();

        try (BufferedReader reader = new BufferedReader(new FileReader("/Users/utheryde/Java_Bootcamp_s21/train/boot1/src/files_urls.txt"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                urlsQueue.add(line.trim());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        ExecutorService threadPool = Executors.newFixedThreadPool(threadsCount);

        for (int i = 1; i <= threadsCount; i++) {
            threadPool.execute(new ComputingThreads(i, urlsQueue));
        }

        threadPool.shutdown();

    }
}
