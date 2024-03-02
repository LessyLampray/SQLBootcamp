import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.concurrent.LinkedBlockingQueue;

public class ComputingThreads extends Thread {
    private final int threadNumber;
    private final LinkedBlockingQueue<String> urlsQueue;
    int filePath = 1;

    public ComputingThreads(int threadNumber, LinkedBlockingQueue<String> urlsQueue) {
        this.threadNumber = threadNumber;
        this.urlsQueue = urlsQueue;
    }

    @Override
    public void run() {
        while (true) {
            try {
                String url = urlsQueue.poll();
                if (url == null) {
                    break;
                }
                System.out.println("Thread-" + threadNumber + " start download file number " + url);
                downloadFile(url, filePath+".jpg");
                System.out.println("Thread-" + threadNumber + " finish download file number " + url);
                filePath++;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void downloadFile(String fileUrl, String savePath) throws Exception {
        URL url = new URL(fileUrl);
        URLConnection connection = url.openConnection();

        try (InputStream in = connection.getInputStream();
             FileOutputStream out = new FileOutputStream(savePath)) {

            byte[] buffer = new byte[1024];
            int bytesRead;

            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}
