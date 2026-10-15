class Node 
{
  int val;
  float x,y;
  Node left;
  Node right;
  
  Node(int v)
  {
    this.val = v;
  }
  
  Node(int v, Node l, Node r)
  {
    this.val = v;
    this.left = l;
    this.right = r;
  }
  
  public String toString()
  {
    if (left == null && right == null)
      return "N(" + val + ")";
     return "N" + val + ", " + left + ", " + right + ")";
  }
  
}
