void setup()
{
  int arrLen = 10;
  int[] arr = initArr(arrLen);
  println("before");
  printArr(arr);
  println();
  quickSort(arr, 0, arrLen - 1);
  println("after");
  printArr(arr);
  println();
}

void quickSort(int[] arr, int left, int right)
{
  int pivot = left;
  int low = left + 1;
  int high = right;
  
  if (low >= high)
    return ;
  
  while (!(low >= high))
  {
    if (arr[low] > arr[high])
      swap(arr, low, high);
    low++;
    high--;
  }
  if (arr[high] <= arr[pivot])
    swap(arr, pivot, high);
  quickSort(arr, left, pivot - 1);
  quickSort(arr, pivot + 1, right);
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
