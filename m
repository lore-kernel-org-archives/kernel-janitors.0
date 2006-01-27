From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 12:48:56 +0000
Subject: [KJ] [Patch 1/4] BUG_ON() Conversion in ipc/msg.c
Message-Id: <1138366136.15909.5.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============047765708140264707=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============047765708140264707==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/ipc/msg.c.orig	2006-01-27 11:10:14.000000000 +0100
+++ linux-2.6.16-rc1-git4/ipc/msg.c	2006-01-27 11:10:29.000000000 +0100
@@ -220,8 +220,7 @@ asmlinkage long sys_msgget (key_t key, i
 		ret = -EEXIST;
 	} else {
 		msq = msg_lock(id);
-		if(msq==NULL)
-			BUG();
+		BUG_ON(msq==NULL);
 		if (ipcperms(&msq->q_perm, msgflg))
 			ret = -EACCES;
 		else {



--===============047765708140264707==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============047765708140264707==--
