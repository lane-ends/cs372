/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package things;

import java.util.*;

/**
 *
 * @author laneysatchwell
 */
public class State {

    private static HashMap<String, Integer> hashMap = new HashMap<>();


    public static Integer get(String m) {
        Integer result = State.hashMap.get(m);

        return result;
    }

    public static void set(String m, Integer location){
        if (hashMap.containsKey(m)){
            State.hashMap.replace(m, location); }
        else {
        hashMap.put(m, location);
        }
    }
}
