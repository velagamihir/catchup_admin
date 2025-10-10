import java.util.Arrays;
import java.util.Scanner;
class ReverseGroups{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the size of the array: ");
        int lengthOfInpArray = sc.nextInt();
        int[] inpArray = new int[lengthOfInpArray];
        System.out.println("Enter the elements of the array: ");
        for (int i = 0; i < lengthOfInpArray; i++) {
            inpArray[i] = sc.nextInt();
        }
        int[] resultantArray = new int[lengthOfInpArray];
        System.out.print("Enter the size of the group: ");
        int sizeOfGroup=sc.nextInt();
        for (int i = 0; i < lengthOfInpArray; i += sizeOfGroup) {
            for (int j = 0; j < sizeOfGroup + i - 1; j++) {
                resultantArray[j] = inpArray[sizeOfGroup + i - 1 - j];
            }
        }
        if (resultantArray.length < inpArray.length) {
            for (int i = inpArray.length - 1; i >= resultantArray.length; i--) {
                resultantArray[resultantArray.length-1] = inpArray[i];
            }
        }
        System.out.println(Arrays.toString(resultantArray));
    }
}