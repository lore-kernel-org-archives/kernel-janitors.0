From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 17:58:50 +0000
Subject: [KJ] [Patch 2/5] BUG_ON() Conversion in
Message-Id: <1138730330.13327.14.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27537268086381905=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27537268086381905==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/s390/block/dasd_devmap.c.orig	2006-01-31 16:25:48.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/s390/block/dasd_devmap.c	2006-01-31 16:26:43.000000000 +0100
@@ -435,8 +435,7 @@ dasd_forget_ranges(void)
 	spin_lock(&dasd_devmap_lock);
 	for (i = 0; i < 256; i++) {
 		list_for_each_entry_safe(devmap, n, &dasd_hashlists[i], list) {
-			if (devmap->device != NULL)
-				BUG();
+			BUG_ON(devmap->device != NULL);
 			list_del(&devmap->list);
 			kfree(devmap);
 		}
@@ -545,8 +544,7 @@ dasd_delete_device(struct dasd_device *d
 
 	/* First remove device pointer from devmap. */
 	devmap = dasd_find_busid(device->cdev->dev.bus_id);
-	if (IS_ERR(devmap))
-		BUG();
+	BUG_ON(IS_ERR(devmap));
 	spin_lock(&dasd_devmap_lock);
 	if (devmap->device != device) {
 		spin_unlock(&dasd_devmap_lock);



--===============27537268086381905==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27537268086381905==--
