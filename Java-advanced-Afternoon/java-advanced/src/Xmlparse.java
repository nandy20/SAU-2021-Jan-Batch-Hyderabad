import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class Xmlparse {
    private static String filePath = "assignments.xml";
    private static Assignments assignments;

    public Assignments getAssignments(){
        return this.assignments;
    }

    public static void main(String[] args) {
        try {
            File file = new File(filePath);
            JAXBContext jaxbContext = JAXBContext.newInstance(Assignments.class);
            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
            assignments = (Assignments) jaxbUnmarshaller.unmarshal(file);
            System.out.println("Parsing XML File:");
            
         for(Assignment assign: assignments.getAssignment()){
              Capitalconv.capitalizeString(assign);
              System.out.println(assign.getName()+" "+assign.getProgLang());
             
          }
         System.out.println("Capitalized!!");
        
         try {
        		 Class.forName("com.mysql.jdbc.Driver");
        		 Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/auassign","root", "nandy.2008");

             Xmlparse xmlParse = new Xmlparse();
             xmlParse.createTables(connection);
             xmlParse.insertData(connection, assignments);
             System.out.println("Inserted!!");
            
         } catch (SQLException throwables) {
             throwables.printStackTrace();
         }

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    void createTables(Connection con) {
        try (Statement stmt = con.createStatement()) {
            String sql = "create table assignment(asgmt_id int PRIMARY KEY, name varchar(100), ProgLanguage varchar(100), Status varchar(20))";
            stmt.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    void insertData(Connection con, Assignments assignments) {
        String sql = "insert into assignment(asgmt_id, name, ProgLanguage, Status) values(?, ?, ?, ?)";

        List<Assignment> assignment = assignments.getAssignment();
        for(Assignment assign : assignment) {
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, assign.getId());
                stmt.setString(2, assign.getName());
                stmt.setString(3, assign.getProgLang());
                stmt.setString(4, assign.getStatus());
                stmt.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}