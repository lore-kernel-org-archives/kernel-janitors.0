From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 17:59:09 +0000
Subject: [KJ] [Patch 4/5] BUG_ON() Conversion in
Message-Id: <1138730350.13327.16.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42898912513023912=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42898912513023912==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,   

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/s390/char/tape_block.c.orig	2006-01-31 16:27:31.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/s390/char/tape_block.c	2006-01-31 16:28:06.000000000 +0100
@@ -198,9 +198,7 @@ tapeblock_request_fn(request_queue_t *qu
 
 	device = (struct tape_device *) queue->queuedata;
 	DBF_LH(6, "tapeblock_request_fn(device=%p)\n", device);
-	if (device == NULL)
-		BUG();
-
+	BUG_ON(device == NULL);
 	tapeblock_trigger_requeue(device);
 }
 
@@ -307,8 +305,7 @@ tapeblock_revalidate_disk(struct gendisk
 	int			rc;
 
 	device = (struct tape_device *) disk->private_data;
-	if (!device)
-		BUG();
+	BUG_ON(!device);
 
 	if (!device->blk_data.medium_changed)
 		return 0;
@@ -440,11 +437,9 @@ tapeblock_ioctl(
 
 	rc     = 0;
 	disk   = inode->i_bdev->bd_disk;
-	if (!disk)
-		BUG();
+	BUG_ON(!disk);
 	device = disk->private_data;
-	if (!device)
-		BUG();
+	BUG_ON(!device);
 	minor  = iminor(inode);
 
 	DBF_LH(6, "tapeblock_ioctl(0x%0x)\n", command);



--===============42898912513023912==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42898912513023912==--
