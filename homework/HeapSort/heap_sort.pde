void setup()
{
  int arrLen = 10;
  int[] arr = initArr(arrLen);
  
  println("before");
  printArr(arr);
  println();
  heapSort(arr, arrLen);
  println("after");
  printArr(arr);
}

void heapSort(int[] arr, int size)
{
  for (int i = size / 2 - 1; i >= 0; i--)
  {
    heapify(arr, size, i);
  }
  
  for (int i = size - 1; i > 0; i--)
  {
    swap(arr, 0, i);
    heapify(arr, i, 0);
  }
}

void heapify(int[] arr, int size, int root)
{
  int left = root * 2 + 1;
  int right = root * 2 + 2;
  int largest = root;
  
  if (left < size && (arr[left] > arr[largest]))
  {
    largest = left;
  }
  if (right < size && (arr[right] > arr[largest]))
  {
    largest = right;
  }
  if (largest != root)
  {
    swap(arr, root, largest);
    heapify(arr, size, largest);
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
