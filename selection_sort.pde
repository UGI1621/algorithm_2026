int[] arr = {20,12,32,9};

void setup()
{
  int i, idx;
  int max, tmp;
  
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
    tmp = arr[idx];
    arr[idx] = arr[max];
    arr[max] = tmp;
  }
  for(i = 0; i < arr.length; i++)
  {
    print(arr[i], " ");
  }
}

void draw()
{
}
