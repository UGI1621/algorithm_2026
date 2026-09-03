int[] list = new int [100];
for (int idx = 0; idx < list.length; idx++)
{
  list[idx] = (int)random(100);
}

println(list.length);

int i, j;

for(i = 0;  i < list.length; i++)
{
  for (j = 0; j < list.length; j++)
  {
    if (list[i] < list[j])
    {
      int temp;
      temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
  }
  
  for (int c = 0; c < list.length - j; c++)
  {
    if (list[c] < list[c + 1])
    {
      i = 0;
      j = 0;
    }
  }
}

for (int idx = 0; idx < list.length; idx++)
{
  print(list[idx], " ");
}
