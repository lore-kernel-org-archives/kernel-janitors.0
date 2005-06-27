From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Mon, 27 Jun 2005 20:59:13 +0000
Subject: [KJ] [PATCH] fs/reiserfs/journal.c: replace direct assignment with
Message-Id: <200506272059.13667.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_hiGwC419gS6BH/q"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_hiGwC419gS6BH/q
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--Boundary-00=_hiGwC419gS6BH/q
Content-Type: text/x-diff; charset="us-ascii";
	name="reiserfs_journal_set_current_state.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfs_journal_set_current_state.patch"

diff -Nru linux-2.6.12/fs/reiserfs/journal.c linux-2.6.12-devel/fs/reiserfs/journal.c
--- linux-2.6.12/fs/reiserfs/journal.c	2005-06-17 19:48:29.000000000 +0000
+++ linux-2.6.12-devel/fs/reiserfs/journal.c	2005-06-27 14:13:59.000000000 +0000
@@ -2584,7 +2584,7 @@
     set_current_state(TASK_UNINTERRUPTIBLE);
     if (test_bit(J_WRITERS_QUEUED, &journal->j_state))
         schedule();
-    current->state = TASK_RUNNING;
+    set_current_state(TASK_RUNNING);
     remove_wait_queue(&journal->j_join_wait, &wait);
 }
 

--Boundary-00=_hiGwC419gS6BH/q
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_hiGwC419gS6BH/q--
