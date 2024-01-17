class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class ButtonData {
  final void Function() onPressed;
  final String title;
  ButtonData(this.title, this.onPressed);
}
