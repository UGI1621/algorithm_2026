

void setup()
{
  int[] arr = initArr(10);
  println("before");
  printArr(arr);
  println();
  selectionSort(arr);
  println("after");
  printArr(arr);
}

int[] initArr(int n)
{
   int[]res = new int[n];
   for(int i = 0; i < n; i++)
   {
     res[i] = (int)random(100);
   }
   return res;
}

void printArr(int[] arr)
{
  for(int i = 0; i < arr.length; i++)
  {
    print(arr[i], " ");
  }
}

void selectionSort(int[] arr)
{
  int idx, i, max;
  
  for (idx = arr.length - 1; idx > -1; idx--)
  {
    max = 0;
    for (i = 0; i <= idx; i++)
    {
      if (arr[i] > arr[max])
      {
        max = i;
      }
    }
    swap(arr, max, idx);
  }
}

void swap(int[] arr, int idx1, int idx2)
{
  int tmp; 
  tmp = arr[idx1];
  arr[idx1] = arr[idx2];
  arr[idx2] = tmp;
}

void draw()
{
}
