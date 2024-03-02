public class ComputingThreads extends Thread {
    private int start;
    private int end;
    private int sum;
    private int[] array;

   public ComputingThreads(int [] newArray, int newStart, int newEnd) {
       start = newStart;
       end = newEnd;
       sum = 0;
       array = newArray;
   }

   public int getSum() {
       return sum;
   }

    @Override
    public void run() {
        for (int i = start; i <= end; i++) {
            sum += array[i];
        }
        System.out.println(Thread.currentThread().getName() + ": from " + start + " to" + end + " sum is: " + sum);
    }


}
