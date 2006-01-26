From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 17:20:38 +0000
Subject: [KJ] [Patch 6/8] BUG_ON() Conversion in fs/exec.c
Message-Id: <1138296038.9170.25.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23186307851154098=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23186307851154098==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/exec.c.orig	2006-01-26 17:56:45.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/exec.c	2006-01-26 17:56:58.000000000 +0100
@@ -561,7 +561,7 @@ static int exec_mmap(struct mm_struct *m
 	arch_pick_mmap_layout(mm);
 	if (old_mm) {
 		up_read(&old_mm->mmap_sem);
-		if (active_mm != old_mm) BUG();
+		BUG_ON(active_mm != old_mm);
 		mmput(old_mm);
 		return 0;
 	}



--===============23186307851154098==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23186307851154098==--
