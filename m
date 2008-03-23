From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 23 Mar 2008 16:59:37 +0000
Subject: [PATCH] Add "const" qualifier to first arg of list_splice()
Message-Id: <alpine.LFD.1.00.0803231256520.27678@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Since neither the list_splice() nor __list_splice() routines modify
their first argument, might as well declare them "const".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  compile-tested on x86 with "make defconfig".

diff --git a/include/linux/list.h b/include/linux/list.h
index 75ce2cb..57ad73e 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -319,7 +319,7 @@ static inline int list_empty_careful(const struct list_head *head)
 	return (next = head) && (next = head->prev);
 }

-static inline void __list_splice(struct list_head *list,
+static inline void __list_splice(const struct list_head *list,
 				 struct list_head *head)
 {
 	struct list_head *first = list->next;
@@ -338,7 +338,7 @@ static inline void __list_splice(struct list_head *list,
  * @list: the new list to add.
  * @head: the place to add it in the first list.
  */
-static inline void list_splice(struct list_head *list, struct list_head *head)
+static inline void list_splice(const struct list_head *list, struct list_head *head)
 {
 	if (!list_empty(list))
 		__list_splice(list, head);

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
