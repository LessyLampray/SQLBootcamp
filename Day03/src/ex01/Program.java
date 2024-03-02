
public class Program {
    private static Object lock = new Object();
    private static boolean isEggTurn = true;

    public static void main(String[] args) {
        try {
            if (args.length != 1 || !args[0].startsWith("--count=")) {
            throw new InsufficientNumberOfArguments("Insufficient number of arguments.");
            }
            int count = Integer.parseInt(args[0].substring("--count=".length()));

            if (count <= 0) {
                throw new IncorrectNumberOfRepetitions("Incorrect number of repetitions.");
            }
            Egg egg = new Egg(count);
            Hen hen = new Hen(count);
            egg.start();
            hen.start();
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (InsufficientNumberOfArguments | IncorrectNumberOfRepetitions e) {
            throw new RuntimeException(e);
        }
    }

    public static void printEgg() {
        synchronized (lock) {
            while (!isEggTurn) {
                try {
                    lock.wait();
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
            System.out.println("Egg");
            isEggTurn = false;
            lock.notify();
        }
    }

    public static void printHen() {
        synchronized (lock) {
            while (isEggTurn) {
                try {
                    lock.wait();
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
            System.out.println("Hen");
            isEggTurn = true;
            lock.notify();
        }
    }
}