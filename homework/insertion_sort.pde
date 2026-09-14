void setup()
{
  int[] arr = initArr(10);
  
  println("before");
  printArr(arr);
  insertionSort(arr);
  println();
  println("after");
  printArr(arr);
  
}

void insertionSort(int[] arr)
{
  for(int pick = 1; pick < arr.length; pick++)
  {
    for (int cmp = pick - 1; cmp > -1; cmp--)
    {
      if (arr[cmp] > arr[pick])
      {
        swap(arr, cmp, pick);
        pick--;
      }
      else
      {
        break ;
      }
    }
  }
}

void swap(int[] arr, int idx1, int idx2)
{
  int temp = arr[idx1];
  arr[idx1] = arr[idx2];
  arr[idx2] = temp;
}

int[] initArr(int n)
{
  int[] res = new int[n];
  
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
