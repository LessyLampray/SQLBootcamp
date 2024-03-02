import java.sql.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Program {
    public static void main(String[] args) {
        if (args.length != 2 || !args[0].startsWith("--arraySize=") || !args[1].startsWith("--threadsCount=")){
            System.err.println("Incorrect arguments");
            System.exit(-1);
        }
        int arraySize = Integer.parseInt(args[0].substring(12));
        int threadsCount = Integer.parseInt(args[1].substring(15));
        if (arraySize > 2000000) {
            System.err.println("Incorrect array size");
            System.exit(-1);
        }
        int[] arrayInt = new int[arraySize];
        int fullSumOfMainThread = 0;
        Random random = new Random();
        for (int i = 0; i < arraySize; i++) {
            int randomNumber = random.nextInt(1001);
            arrayInt[i] = randomNumber;
            fullSumOfMainThread += randomNumber;
        }
        System.out.println("Sum: " + fullSumOfMainThread);
        int segmentSize = arraySize / threadsCount;
        int startIndex = 0;
        int endIndex = segmentSize - 1;

        ComputingThreads[] threads = new ComputingThreads[threadsCount];

        for (int i = 0; i < threadsCount; i++) {
            threads[i] = new ComputingThreads(arrayInt, startIndex, endIndex);
            threads[i].start();
            startIndex = endIndex + 1;
            endIndex = i == threadsCount - 2 ? arraySize - 1 : endIndex + segmentSize;
        }
        int fullSumOfNotMainThreads = 0;
        for (int i = 0; i < threadsCount; i++) {
            try {
                threads[i].join();
                fullSumOfNotMainThreads += threads[i].getSum();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        System.out.println("Sum by threads: " + fullSumOfNotMainThreads);


    }
}
