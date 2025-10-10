import java.util.*;

class MirrorJump {
  public static void main(String[] args) throws java.lang.Exception {
    Scanner sc = new Scanner(System.in);
    int t = sc.nextInt();
    int n, k;
    while (t-- > 0) {
      n = sc.nextInt();
      k = sc.nextInt();
      int count = 0;
      while (k != n) {
        if (n + 1 - k <= n && n+1-k>k) {
          k = n + 1 - k;
        } else if (k + 1 <= n) {
          k += 1;
        } else if (k - 1 <= n) {
          k -= 1;
        }
        count += 1;
      }
      System.out.println(count);
    }
  }
}