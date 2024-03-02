public class Hen extends Thread {

    private int countOfPrint;

    public Hen(int count) {
        countOfPrint = count;
    }

    @Override
    public void run() {
        for (int i = 0; i < countOfPrint; ++i) {
            System.out.println("Hen");
        }
    }

}