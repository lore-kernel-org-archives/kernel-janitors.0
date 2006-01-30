From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 30 Jan 2006 21:15:48 +0000
Subject: [KJ] [Patch 4/6] BUG_ON() Conversion in kernel/ptrace.c
Message-Id: <1138655748.4007.13.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============038541165161615876=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============038541165161615876==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/kernel/ptrace.c.orig	2006-01-27 11:50:10.000000000 +0100
+++ linux-2.6.16-rc1-git4/kernel/ptrace.c	2006-01-27 11:50:28.000000000 +0100
@@ -30,8 +30,7 @@
  */
 void __ptrace_link(task_t *child, task_t *new_parent)
 {
-	if (!list_empty(&child->ptrace_list))
-		BUG();
+	BUG_ON(!list_empty(&child->ptrace_list));
 	if (child->parent == new_parent)
 		return;
 	list_add(&child->ptrace_list, &child->parent->ptrace_children);
@@ -72,8 +71,7 @@ void ptrace_untrace(task_t *child)
  */
 void __ptrace_unlink(task_t *child)
 {
-	if (!child->ptrace)
-		BUG();
+	BUG_ON(!child->ptrace);
 	child->ptrace = 0;
 	if (!list_empty(&child->ptrace_list)) {
 		list_del_init(&child->ptrace_list);



--===============038541165161615876==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============038541165161615876==--
