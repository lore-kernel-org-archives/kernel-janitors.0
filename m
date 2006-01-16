From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 16 Jan 2006 20:45:43 +0000
Subject: [KJ] [Patch] BUG_ON() in kernel/exit.c
Message-Id: <1137444343.2402.1.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21161871310324543=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============21161871310324543==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this replaces two if() BUG(); statements
with BUG_ON in kernel/exit.c

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git11/kernel/exit.c.orig	2006-01-16 21:42:48.000000000 +0100
+++ linux-2.6.15-git11/kernel/exit.c	2006-01-16 21:44:00.000000000 +0100
@@ -523,7 +523,7 @@ static void exit_mm(struct task_struct *
 		down_read(&mm->mmap_sem);
 	}
 	atomic_inc(&mm->mm_count);
-	if (mm != tsk->active_mm) BUG();
+	BUG_ON(mm != tsk->active_mm);
 	/* more a memory barrier than a real lock */
 	task_lock(tsk);
 	tsk->mm = NULL;
@@ -1477,8 +1477,7 @@ check_continued:
 		if (options & __WNOTHREAD)
 			break;
 		tsk = next_thread(tsk);
-		if (tsk->signal != current->signal)
-			BUG();
+		BUG_ON(tsk->signal != current->signal);
 	} while (tsk != current);
 
 	read_unlock(&tasklist_lock);



--===============21161871310324543==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21161871310324543==--
