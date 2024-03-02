
public class Program {
    public static void main(String[] args) {
        try {
        if (args.length != 1 || !args[0].startsWith("--count=")){
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
            egg.join();
            hen.join();
            for (int i = 0; i < count; i++) {
                System.out.println("Human");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        } catch (InsufficientNumberOfArguments e) {
            throw new RuntimeException(e);
        } catch (IncorrectNumberOfRepetitions e) {
            throw new RuntimeException(e);
        }
    }
}