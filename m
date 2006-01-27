From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 09:32:58 +0000
Subject: [KJ] [Patch 9/12] BUG_ON() Conversion in fs/sysfs/
Message-Id: <1138354378.7391.60.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============022691563125574632=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============022691563125574632==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/sysfs/inode.c.orig	2006-01-27 01:50:24.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/sysfs/inode.c	2006-01-27 01:50:31.000000000 +0100
@@ -176,8 +176,7 @@ const unsigned char * sysfs_get_name(str
 	struct bin_attribute * bin_attr;
 	struct sysfs_symlink  * sl;
 
-	if (!sd || !sd->s_element)
-		BUG();
+	BUG_ON(!sd || !sd->s_element);
 
 	switch (sd->s_type) {
 		case SYSFS_DIR:



--===============022691563125574632==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============022691563125574632==--
