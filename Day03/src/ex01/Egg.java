public class Egg extends Thread {

    private final int countOfPrint;

    public Egg(int count) {
        countOfPrint = count;
    }
    @Override
    public void run() {
        for (int i = 0; i < countOfPrint; ++i) {
            Program.printEgg();
        }
    }

}
