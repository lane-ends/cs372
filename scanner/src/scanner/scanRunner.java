package scanner;

import java.io.*;
import scanner.FirstScanner.Symbol;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author laneysatchwell
 */
public class scanRunner {
    
    
public static void main(String[] args) throws FileNotFoundException, IOException {
           
File file = new File("lang.txt");
Reader reader = new FileReader(file);
FirstScanner scanner = new FirstScanner(reader);
Symbol token;

do {
    token = scanner.next_token();
} 
while (!token.VALUE.equals("ENDFILE"));

}
}
