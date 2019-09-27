package things;

import java.io.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author laneysatchwell
 */
public class Main {
    
public static void main(String[] args) throws FileNotFoundException, IOException, Exception {
           
File file = new File("./src/things/lang.txt");
Reader reader = new FileReader(file);
Parser parser = new Parser(new Scanner(reader));
parser.parse();
}
}
