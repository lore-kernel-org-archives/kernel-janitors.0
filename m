From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 30 Jan 2006 21:15:43 +0000
Subject: [KJ] [Patch 2/6] BUG_ON() Conversion in kernel/fork.c
Message-Id: <1138655743.4007.11.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84620090212428689=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84620090212428689==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/kernel/fork.c.orig	2006-01-27 11:48:25.000000000 +0100
+++ linux-2.6.16-rc1-git4/kernel/fork.c	2006-01-27 11:48:35.000000000 +0100
@@ -726,8 +726,7 @@ int unshare_files(void)
 	struct files_struct *files  = current->files;
 	int rc;
 
-	if(!files)
-		BUG();
+	BUG_ON(!files);
 
 	/* This can race but the race causes us to copy when we don't
 	   need to and drop the copy */



--===============84620090212428689==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84620090212428689==--
