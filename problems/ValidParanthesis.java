import java.util.ArrayList;
import java.util.Scanner;

class ValidParanthesis {
  public static void main(String args[]) {
    Scanner sc = new Scanner(System.in);
    String s = sc.next();
    ArrayList<Character> al1 = new ArrayList<>();
    boolean exists = true;
    if (s.length() % 2 != 0) {
        exists = false;
    }
    else{
        for (int i = 0; i < s.length(); i++) {
      char c = s.charAt(i);
      if (c == '{' || c == '[' || c == '(') {
        al1.add(c);
      } else {
        if (c == '}') {
          if (al1.contains('{') && al1.get(al1.size() - 1) == '{') {
            al1.remove(al1.size() - 1);
          } else {
            exists = false;
            break;
          }
        }
        else if (c == ']') {
          if (al1.contains('[') && al1.get(al1.size() - 1) == '[') {
            al1.remove(al1.size() - 1);
          } else {
            exists = false;
            break;
          }
        }
        else if (c == ')') {
          if (al1.contains('(') && al1.get(al1.size() - 1) == '(') {
            al1.remove(al1.size() - 1);
          } else {
            exists = false;
            break;
          }
        }
      }
    }
    }
    System.out.println(exists);
  }
}