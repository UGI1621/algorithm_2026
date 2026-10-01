void setup()
{
  int arrLen = 10;
  int[] arr = initArr(arrLen);
  
  println("before");
  printArr(arr);
  MergeSort(arr, 0, arrLen - 1);
  println();
  println("after");
  printArr(arr);
  
}

void MergeSort(int[] arr, int left, int right)
{
  if (left < right)
  {
    int mid = (left + right) / 2;
    MergeSort(arr, left, mid);
    MergeSort(arr, mid + 1, right);
    MergeArr(arr, left, mid, right);
  }
}

void MergeArr(int[] arr, int left, int mid, int right)
{
  int[] tmp = new int[arr.length];
  int i = left;
  int j = mid + 1;
  int k = left;
  
  while (i <= mid && j <= right)
  {
    if (arr[i] <= arr[j])
    {
      tmp[k] = arr[i];
      i++;
    }
    else
    {
      tmp[k] = arr[j];
      j++;
    }
    k++;
  }
  
  if (i > mid)
  {
    for (int l = j; l <=right; l++)
    {
      tmp[k] = arr[l];
      k++;
    }
  }
  else
  {
    for (int l = i; l <= mid; l++)
    {
      tmp[k] = arr[l];
      k++;
    }
  }
  for (int l = left; l <= right; l++)
  {
    arr[l] = tmp[l];
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
