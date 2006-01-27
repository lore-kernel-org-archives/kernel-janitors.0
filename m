From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 09:33:07 +0000
Subject: [KJ] [Patch 11/12] BUG_ON() Conversion in fs/udf/
Message-Id: <1138354387.7391.64.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84236017498460625=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84236017498460625==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/udf/inode.c.orig	2006-01-27 01:51:46.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/udf/inode.c	2006-01-27 01:52:02.000000000 +0100
@@ -312,12 +312,10 @@ static int udf_get_block(struct inode *i
 	err = 0;
 
 	bh = inode_getblk(inode, block, &err, &phys, &new);
-	if (bh)
-		BUG();
+	BUG_ON(bh);
 	if (err)
 		goto abort;
-	if (!phys)
-		BUG();
+	BUG_ON(!phys);
 
 	if (new)
 		set_buffer_new(bh_result);



--===============84236017498460625==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84236017498460625==--
