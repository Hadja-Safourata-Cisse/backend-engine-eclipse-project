package engineBCDUI;


import java.io.IOException;

import de.businesscode.batch.core.Batch;
import de.businesscode.batch.core.Step;
import de.businesscode.batch.steps.SqlFileStep;

public class engineDistanceBCDUI extends Batch {
  

  public static void main(String[] args)
  {
    new engineDistanceBCDUI().doMain(args);
  }
  
  
  @Override
  public void implementMain(String[] arguments) throws Exception {
    
    double step=0.0;
    addStep(new HelloFileStep(),step++);
    addSqlFileStep("tb_distance",step++);
    System.out.println("implement main executed");
    
  }
  
  class HelloFileStep implements Step {
    
    private java.io.File file = new java.io.File(propertyStringValue("helloFileStep.filename"));
    
   // private java.io.File file=new java.io.File("helloFile.txt");
    

    @Override
    public void start() {
     
      System.out.println("start(): create file");
        try {
          
          file.createNewFile();
          
        }catch(IOException e) {
      
          throw new RuntimeException("failed to create a file",e);
      }
      
    }
    
    @Override
    public void kill() {
      
      System.out.println("kill(): delete file");
      file.delete();
    }
    
    @Override
    public String description() {
      return "Create a hello world file";
    }
  
    
  }
 
}

