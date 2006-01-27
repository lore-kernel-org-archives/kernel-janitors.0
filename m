From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 12:49:06 +0000
Subject: [KJ] [Patch 2/4] BUG_ON() Conversion in ipc/sem.c
Message-Id: <1138366146.15909.6.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============044252738366253652=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============044252738366253652==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/ipc/sem.c.orig	2006-01-27 11:10:37.000000000 +0100
+++ linux-2.6.16-rc1-git4/ipc/sem.c	2006-01-27 11:10:54.000000000 +0100
@@ -227,8 +227,7 @@ asmlinkage long sys_semget (key_t key, i
 		err = -EEXIST;
 	} else {
 		sma = sem_lock(id);
-		if(sma==NULL)
-			BUG();
+		BUG_ON(sma==NULL);
 		if (nsems > sma->sem_nsems)
 			err = -EINVAL;
 		else if (ipcperms(&sma->sem_perm, semflg))
@@ -1182,8 +1181,7 @@ retry_undos:
 
 	sma = sem_lock(semid);
 	if(sma==NULL) {
-		if(queue.prev != NULL)
-			BUG();
+		BUG_ON(queue.prev != NULL);
 		error = -EIDRM;
 		goto out_free;
 	}



--===============044252738366253652==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============044252738366253652==--
