public class Hen extends Thread {

    private final int countOfPrint;

    public Hen(int count) {
        countOfPrint = count;
    }

    @Override
    public void run() {
        for (int i = 0; i < countOfPrint; ++i) {
            Program.printHen();
        }
    }

}
