From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 17:20:01 +0000
Subject: [KJ] [Patch 1/8] BUG_ON() Conversion in fs/binfmt_elf_fdpic.c
Message-Id: <1138296001.9170.20.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77486563068066472=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============77486563068066472==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/binfmt_elf_fdpic.c.orig	2006-01-26 17:52:26.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/binfmt_elf_fdpic.c	2006-01-26 17:52:43.000000000 +0100
@@ -572,8 +572,7 @@ static int create_elf_fdpic_tables(struc
 	csp -= sizeof(unsigned long);
 	__put_user(bprm->argc, (unsigned long *) csp);
 
-	if (csp != sp)
-		BUG();
+	BUG_ON(csp != sp);
 
 	/* fill in the argv[] array */
 #ifdef CONFIG_MMU



--===============77486563068066472==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77486563068066472==--
