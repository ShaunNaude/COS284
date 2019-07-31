import java.io.FileWriter;
import java.io.IOException;

public class hello_world {

    public static void main(String[] args) {
       
        long total =0;
            for(int j =0;j<1000;j++ ){
            long startTime = System.nanoTime();
            Hello();
            long endTime = System.nanoTime();
            
          long result = endTime-startTime;
            
            total = result + total;  


            //writing to textfile 
            
            
        }
        total = total / 1000;
        String Num = Long.toString(total);

        try
            {
            FileWriter writer = new FileWriter("JavaTimes.txt", true);
            writer.write(Num);
            writer.write("\r\n"); 
            writer.close();
            }
            catch(IOException e)
            {

            }
    

    }


    public static void Hello()
    {
        System.out.println("The quick brown fox jumps over the lazy dog");
    }



}