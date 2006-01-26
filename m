From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 00:00:21 +0000
Subject: [KJ] [Patch 4/9] BUG_ON() Conversion in md/dm-table.c
Message-Id: <1138233621.7232.40.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13910640236841898=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============13910640236841898==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/md/dm-table.c.orig	2006-01-26 00:38:13.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/md/dm-table.c	2006-01-26 00:38:31.000000000 +0100
@@ -352,8 +352,7 @@ static int open_dev(struct dm_dev *d, de
 
 	int r;
 
-	if (d->bdev)
-		BUG();
+	BUG_ON(d->bdev);
 
 	bdev = open_by_devnum(dev, d->mode);
 	if (IS_ERR(bdev))
@@ -427,8 +426,7 @@ static int __table_get_device(struct dm_
 	struct dm_dev *dd;
 	unsigned int major, minor;
 
-	if (!t)
-		BUG();
+	BUG_ON(!t);
 
 	if (sscanf(path, "%u:%u", &major, &minor) == 2) {
 		/* Extract the major/minor numbers */



--===============13910640236841898==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13910640236841898==--
