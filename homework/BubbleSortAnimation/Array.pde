class Array
{
  int len, w, max;
  int cmpA = -1, cmpB = -1;
  int doneIdx = -1;
  int arr[];
  
  Array(int len)
  {
    max = 100;
    this.len = len;
    this.arr = new int[len];
    this.w = (int)(width-4)/len;
    initArr();
  }
  
  Array(int[] other, int cmpA, int cmpB, int fixedIdx)
  {
    this.cmpA = cmpA;
    this.cmpB = cmpB;
    this.len = other.length;
    doneIdx = fixedIdx;
    w = (int)(width-4)/this.len;
    copyArr(other);
  }
  
  void initArr()
  {
    for (int i = 0; i < this.len; i++)
    {
      this.arr[i] = (int)random(max);
    }
  }
  
  void printArr()
  {
    for(int i = 0; i < this.len; i++)
    {
      print(this.arr[i] + " ");
    }
    println();
  }
  
  void copyArr(int[] other)
  {
    this.arr = new int[other.length];
    for (int i = 0 ; i < other.length; i++)
    {
      this.arr[i] = other[i];
    }
  }
  
  void draw()
  {
    int x, y, h;
    for (int i=0; i<len; i++) 
    {
      if (i >= this.doneIdx) fill(80, 120, 255);
      else if (i == this.cmpA) fill(0,200,0);
      else if (i == this.cmpB) fill(255,0,0);
      else fill(128);
      
      x = i*w+2;
      h = arr[i];
      y = height-5*h-60;
      rect(x, y, w, 5*h);
   }
  }
}
