ArrayList<Array> lists;
int len = 20;
int time, loop;
boolean autoFlag = true;
int napTime = 100;
int lastTime = 0;

void setup()
{
  size(800,800);
  lists = new ArrayList<Array>();
  lists.add(new Array(len));
  bubbleSort();
  loop = lists.size();
  printList();
}

void draw()
{
  background(255);
  lists.get(time).draw();
  if (autoFlag) nextStep();
}

void nextStep()
{
  int wait = (time == lists.size() - 1) ? napTime * 10 : napTime;  
  if (millis() - lastTime >= wait)
  {
    time = (time + 1) % lists.size();
    lastTime = millis();
  }
}

/* void nextStep()
{
  delay(napTime);
  if (time < loop - 1) time++;
  else
  {
    time = 0;
    delay(napTime * 10);
  }
}*/

void bubbleSort()
{
  int[] work = lists.get(0).arr.clone();
  int n = work.length;
  
  for (int i = 0; i < n - 1; i++)
  {
    int fixedIdx = n - i;
    for (int j = 0; j <n - i - 1; j++)
    {
      lists.add(new Array(work, j, j + 1, fixedIdx));
      if (work[j] > work[j + 1])
      {
        swap(work, j, j + 1);
        lists.add(new Array(work, j + 1, j, fixedIdx));
      }
    }
  }
  lists.add(new Array(work, -1, -1, 0));
}

void swap(int[] arr, int i, int j)
{
  int tmp = arr[i];
  arr[i] = arr[j];
  arr[j] = tmp;
}

void printList()
{
  for(int i = 0; i < lists.size() ; i++)
  {
    lists.get(i).printArr();
  }
}
