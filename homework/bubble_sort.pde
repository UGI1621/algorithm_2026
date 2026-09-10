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

void swap(int[] arr, int idx1, int idx2)
{
  int tmp; 
  tmp = arr[idx1];
  arr[idx1] = arr[idx2];
  arr[idx2] = tmp;
}

boolean isSorted(int[] arr)
{
  for (int i = 0; i < arr.length - 1; i++)
  {
    if (arr[i] > arr[i + 1])
      return (true);
  }
  return (false);
}

void bubbleSort(int[] arr)
{
  while(isSorted(arr))
  {
    for(int i = 0; i < arr.length - 1; i++)
    {
      if (arr[i] > arr[i + 1])
      {
        swap(arr, i, i + 1);
      }
    }
  }
}

void setup()
{
  int[] arr = initArr(10);
  println("before");
  printArr(arr);
  println();
  bubbleSort(arr);
  println("after");
  printArr(arr);
}
