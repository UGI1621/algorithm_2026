int xstep = 400;
int ystep = 50;
int radius = 30;
int traversal = 0;
int textcolor = 0;

class BTree 
{
  Node root;
  int x, y, value, index;
  
  void clear() 
  {
    root = null;
  }
  
  // 중복되는 숫자가 있는지 체크
  boolean contains(int in)
  {
    return (contains(in, root));
  }
  
  boolean contains(int in, Node curr)
  {
    if (curr == null) return false;
    if (in < curr.val) return contains(in, curr.left);
    else if (in > curr.val) return contains(in, curr.right);
    else return true;
  }
 
  // 최대값 찾기
  int findMax()
  {
    if (isEmpty())
    {
      println("The tree was empty");
      return 0;
    }
    else return findMax(this.root).val;
  }
  
  Node findMax(Node curr)
  {
    if (curr == null) return null;
    else if (curr.right == null) return curr;
    return findMax(curr.right);
  }
  
  // 최솟값 찾기
  int findMin()
  {
    if (isEmpty())
    {
      println("The tree was empty");
      return (0);
    }
    else return findMin(this.root).val;
  }
  
  Node findMin(Node curr)
  {
    if (curr == null) return null;
    else if (curr.left == null) return curr;
    return findMin(curr.left);
    
  }
  
  // 깊이 계산
  int treeHeight()
  {
    return treeHeight(root);
  }
  
  int treeHeight(Node curr)
  {
    if (curr == null) return -1;
    else return 1+max(treeHeight(curr.left), treeHeight(curr.right));
  }
  
  boolean isEmpty()
  {
    return root == null;
  }
  
  boolean insert(int in)
  {
    Node r = insert(in, root);
    if (r == null) return false;
    root = r;
    return true;
  }
  
  Node insert(int in, Node curr)
  {
    if (curr == null) return new Node(in);
    Node res = null;
    if (in < curr.val)
    {
      res = insert(in, curr.left);
      if (res != null)
        curr.left = res;
    }
    else if (in > curr.val)
    {
      res = insert(in, curr.right);
      if (res != null)
        curr.right = res;
    }
    return res == null ? null : curr;
  }
  
  void remove(int in)
  {
    root = remove(in, root);
  }
  
  Node remove(int in, Node curr)
  {
    if (curr == null) return curr;
    if (in < curr.val) curr.left = remove(in, curr.left);
    else if (in > curr.val) curr.right = remove(in, curr.right);
    else if (curr.left != null && curr.right != null)
    {
      curr.val = findMin(curr.right).val;
      curr.right = remove(curr.val, curr.right);
    }
    else curr = (curr.left != null) ? curr.left:curr.right;
    return curr;
  }
  
  // 자식노드 좌표 계산하기
  void assignPosition()
  {
    if (!isEmpty()) assignPosition(root, 0, 0);
  }
  
  void assignPosition(Node curr, float dx, float dy)
  {
    if (curr != null)
    {
      assignPosition(curr.left, dx-1./pow(2.,(dy+1)), dy+1);
      curr.x = dx;
      curr.y = dy;
      assignPosition(curr.right, dx+1./pow(2.,(dy+1)), dy+1);
    }
  }
  
  void printTree()
  {
    fill(0,0,255);
    index=0;
    if (isEmpty()) println ("The tree is empty");
    else printTree(root);
  }
  
  void printTree(Node curr)
  {
    if (curr != null)
    {
      if (traversal == 0)
      {
        printTree(curr.left);
        println(curr.val+ " " + index + " (" + curr.x + "," + curr.y + ")");
        text(index, (int)(curr.x * xstep + width/2 - radius/2 - 2),
          (int)(curr.y * ystep + radius - radius / 2 - 2));
        index++;
        printTree(curr.right);
      }
      else if(traversal == 1)
      {
        printTree(curr.left);
        
        printTree(curr.right);
      }
      else if (traversal == 2)
      {
        // 채워야함
      }
    }
  }
  
  void visit(Node curr)
  {
    println(curr.val+ " " + index + " (" + curr.x + "," + curr.y + ")");
        text(index, (int)(curr.x * xstep + width/2 - radius/2 - 2),
          (int)(curr.y * ystep + radius - radius / 2 - 2));
        index++;
  }
  
  void findNode()
  {
    x = y = value = -1;
    if (isEmpty()) return;
    else findNode(root);
  }
  
  void findNode(Node curr) {
    if (curr != null) {
      findNode(curr.left);
      int dx=mouseX-(int)(curr.x*xstep+width/2);
      int dy=mouseY-(int)(curr.y*ystep+radius);
      if((dx*dx+dy*dy)<radius*radius/4) {
        x=(int)(curr.x*xstep+width/2);
        y=(int)(curr.y*ystep+radius);
        value=curr.val;
        return;
      }  
      findNode(curr.right);
    }
  }

  void drawTree() {
    if (isEmpty()) println("The tree is empty");
    else {
      drawTreeLine(root);
      drawTree(root);
    }    
  }

  void drawTreeLine(Node curr) {
    if (curr != null) {
      drawTreeLine(curr.left);
      if(curr.left != null) line((int)(curr.x*xstep+width/2), (int)(curr.y*ystep+radius),
        (int)(curr.left.x*xstep+width/2), (int)(curr.left.y*ystep+radius));
      if(curr.right != null) line((int)(curr.x*xstep+width/2), (int)(curr.y*ystep+radius),
        (int)(curr.right.x*xstep+width/2), (int)(curr.right.y*ystep+radius));
      drawTreeLine(curr.right);
    }
  }

  void drawTree(Node curr) {
    if (curr != null) {
      drawTree(curr.left);
      fill(255);
      ellipse(curr.x*xstep+width/2, curr.y*ystep+radius, radius, radius);
      if(textcolor==0) fill(0);
      else fill(255);
      text(curr.val, (int)(curr.x*xstep+width/2), (int)(curr.y*ystep+radius));
      drawTree(curr.right);
    }
  }
}
