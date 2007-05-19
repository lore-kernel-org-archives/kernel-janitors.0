From: Aaron Cripps <acripps@gmail.com>
Date: Sat, 19 May 2007 01:09:38 +0000
Subject: [KJ] driverfs_dev to sysfs_dev [Patch]
Message-Id: <464E5122.1040901@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030709000103010203000900"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030709000103010203000900
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------030709000103010203000900
Content-Type: text/plain;
 name="sysfsPatch.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="sysfsPatch.txt"

Just a quick patch to change driverfs_dev to sysfs_dev.
This is to fit with the rest of the kernel changes where
driverfs has switched to sysfs

Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>

---

diff --git a/block/genhd.c b/block/genhd.c
index 93a2cf6..02aa366 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -242,10 +242,10 @@ void __init printk_all_partitions(void)
 			sgp->major, sgp->first_minor,
 			(unsigned long long)get_capacity(sgp) >> 1,
 			disk_name(sgp, 0, buf));
-		if (sgp->driverfs_dev != NULL &&
-		    sgp->driverfs_dev->driver != NULL)
+		if (sgp->sysfs_dev != NULL &&
+		    sgp->sysfs_dev->driver != NULL)
 			printk(" driver: %s\n",
-				sgp->driverfs_dev->driver->name);
+				sgp->sysfs_dev->driver->name);
 		else
 			printk(" (driver?)\n");
 
@@ -563,7 +563,7 @@ static int block_uevent(struct kset *kset, struct kobject *kobj, char **envp,
 		       "MAJOR=%u", disk->major);
 
 	/* add physical device, backing this device  */
-	physdev = disk->driverfs_dev;
+	physdev = disk->sysfs_dev;
 	if (physdev) {
 		char *path = kobject_get_path(&physdev->kobj, GFP_KERNEL);
 
diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
index 370dfe1..f843ab3 100644
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -3421,7 +3421,7 @@ static int __devinit cciss_init_one(struct pci_dev *pdev,
 		disk->fops = &cciss_fops;
 		disk->queue = q;
 		disk->private_data = drv;
-		disk->driverfs_dev = &pdev->dev;
+		disk->sysfs_dev = &pdev->dev;
 		/* we must register the controller even if no disks exist */
 		/* this is for the online array utilities */
 		if (!drv->heads && j)
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 3587cb4..1c6525d 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4342,7 +4342,7 @@ static int __init floppy_init(void)
 		disks[drive]->private_data = (void *)(long)drive;
 		disks[drive]->queue = floppy_queue;
 		disks[drive]->flags |= GENHD_FL_REMOVABLE;
-		disks[drive]->driverfs_dev = &floppy_device[drive].dev;
+		disks[drive]->sysfs_dev = &floppy_device[drive].dev;
 		add_disk(disks[drive]);
 	}
 
diff --git a/drivers/block/ub.c b/drivers/block/ub.c
index 746a118..59f4629 100644
--- a/drivers/block/ub.c
+++ b/drivers/block/ub.c
@@ -2199,7 +2199,7 @@ static int ub_probe(struct usb_interface *intf,
 	usb_get_dev(sc->dev);
 	/*
 	 * Since we give the interface struct to the block level through
-	 * disk->driverfs_dev, we have to pin it. Otherwise, block_uevent
+	 * disk->sysfs_dev, we have to pin it. Otherwise, block_uevent
 	 * oopses on close after a disconnect (kernels 2.6.16 and up).
 	 */
 	usb_get_intf(sc->intf);
@@ -2308,7 +2308,7 @@ static int ub_probe_lun(struct ub_dev *sc, int lnum)
 	disk->first_minor = lun->id * UB_PARTS_PER_LUN;
 	disk->fops = &ub_bd_fops;
 	disk->private_data = lun;
-	disk->driverfs_dev = &sc->intf->dev;
+	disk->sysfs_dev = &sc->intf->dev;
 
 	rc = -ENOMEM;
 	if ((q = blk_init_queue(ub_request_fn, sc->lock)) == NULL)
diff --git a/drivers/ide/ide-cd.c b/drivers/ide/ide-cd.c
index 252ab82..e1d970b 100644
--- a/drivers/ide/ide-cd.c
+++ b/drivers/ide/ide-cd.c
@@ -3534,7 +3534,7 @@ static int ide_cd_probe(ide_drive_t *drive)
 	drive->driver_data = info;
 
 	g->minors = 1;
-	g->driverfs_dev = &drive->gendev;
+	g->sysfs_dev = &drive->gendev;
 	g->flags = GENHD_FL_CD | GENHD_FL_REMOVABLE;
 	if (ide_cdrom_setup(drive)) {
 		struct cdrom_device_info *devinfo = &info->devinfo;
diff --git a/drivers/ide/ide-disk.c b/drivers/ide/ide-disk.c
index 7fff773..5f43fdc 100644
--- a/drivers/ide/ide-disk.c
+++ b/drivers/ide/ide-disk.c
@@ -1278,7 +1278,7 @@ static int ide_disk_probe(ide_drive_t *drive)
 		drive->attach = 1;
 
 	g->minors = 1 << PARTN_BITS;
-	g->driverfs_dev = &drive->gendev;
+	g->sysfs_dev = &drive->gendev;
 	g->flags = drive->removable ? GENHD_FL_REMOVABLE : 0;
 	set_capacity(g, idedisk_capacity(drive));
 	g->fops = &idedisk_ops;
diff --git a/drivers/ide/ide-floppy.c b/drivers/ide/ide-floppy.c
index f429be8..3abf46d 100644
--- a/drivers/ide/ide-floppy.c
+++ b/drivers/ide/ide-floppy.c
@@ -2174,7 +2174,7 @@ static int ide_floppy_probe(ide_drive_t *drive)
 	idefloppy_setup (drive, floppy);
 
 	g->minors = 1 << PARTN_BITS;
-	g->driverfs_dev = &drive->gendev;
+	g->sysfs_dev = &drive->gendev;
 	g->flags = drive->removable ? GENHD_FL_REMOVABLE : 0;
 	g->fops = &idefloppy_ops;
 	drive->attach = 1;
diff --git a/drivers/message/i2o/i2o_block.c b/drivers/message/i2o/i2o_block.c
index b17c4b2..931b9a5 100644
--- a/drivers/message/i2o/i2o_block.c
+++ b/drivers/message/i2o/i2o_block.c
@@ -1090,7 +1090,7 @@ static int i2o_block_probe(struct device *dev)
 	gd = i2o_blk_dev->gd;
 	gd->first_minor = unit << 4;
 	sprintf(gd->disk_name, "i2o/hd%c", 'a' + unit);
-	gd->driverfs_dev = &i2o_dev->device;
+	gd->sysfs_dev = &i2o_dev->device;
 
 	/* setup request queue */
 	queue = gd->queue;
diff --git a/drivers/mmc/card/block.c b/drivers/mmc/card/block.c
index a7562f7..bd548cd 100644
--- a/drivers/mmc/card/block.c
+++ b/drivers/mmc/card/block.c
@@ -469,7 +469,7 @@ static struct mmc_blk_data *mmc_blk_alloc(struct mmc_card *card)
 	md->disk->fops = &mmc_bdops;
 	md->disk->private_data = md;
 	md->disk->queue = md->queue.queue;
-	md->disk->driverfs_dev = &card->dev;
+	md->disk->sysfs_dev = &card->dev;
 
 	/*
 	 * As discussed on lkml, GENHD_FL_REMOVABLE should:
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 00e4666..0185be6 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1663,7 +1663,7 @@ static int sd_probe(struct device *dev)
 
 	sd_revalidate_disk(gd);
 
-	gd->driverfs_dev = &sdp->sdev_gendev;
+	gd->sysfs_dev = &sdp->sdev_gendev;
 	gd->flags = GENHD_FL_DRIVERFS;
 	if (sdp->removable)
 		gd->flags |= GENHD_FL_REMOVABLE;
diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index f9a52af..d78edc3 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -592,7 +592,7 @@ static int sr_probe(struct device *dev)
 	get_capabilities(cd);
 	sr_vendor_init(cd);
 
-	disk->driverfs_dev = &sdev->sdev_gendev;
+	disk->sysfs_dev = &sdev->sdev_gendev;
 	set_capacity(disk, cd->capacity);
 	disk->private_data = &cd->driver;
 	disk->queue = sdev->request_queue;
diff --git a/fs/partitions/check.c b/fs/partitions/check.c
index 9a3a058..34d7c71 100644
--- a/fs/partitions/check.c
+++ b/fs/partitions/check.c
@@ -428,7 +428,7 @@ static char *make_block_name(struct gendisk *disk)
 
 static int disk_sysfs_symlinks(struct gendisk *disk)
 {
-	struct device *target = get_device(disk->driverfs_dev);
+	struct device *target = get_device(disk->sysfs_dev);
 	int err;
 	char *disk_name = NULL;
 
@@ -605,15 +605,15 @@ void del_gendisk(struct gendisk *disk)
 	kobject_uevent(&disk->kobj, KOBJ_REMOVE);
 	kobject_unregister(disk->holder_dir);
 	kobject_unregister(disk->slave_dir);
-	if (disk->driverfs_dev) {
+	if (disk->sysfs_dev) {
 		char *disk_name = make_block_name(disk);
 		sysfs_remove_link(&disk->kobj, "device");
 		if (disk_name) {
-			sysfs_remove_link(&disk->driverfs_dev->kobj, disk_name);
+			sysfs_remove_link(&disk->sysfs_dev->kobj, disk_name);
 			kfree(disk_name);
 		}
-		put_device(disk->driverfs_dev);
-		disk->driverfs_dev = NULL;
+		put_device(disk->sysfs_dev);
+		disk->sysfs_dev = NULL;
 	}
 	sysfs_remove_link(&disk->kobj, "subsystem");
 	kobject_del(&disk->kobj);
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 4c03ee3..91556db 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -122,7 +122,7 @@ struct gendisk {
 	sector_t capacity;
 
 	int flags;
-	struct device *driverfs_dev;
+	struct device *sysfs_dev;
 	struct kobject kobj;
 	struct kobject *holder_dir;
 	struct kobject *slave_dir;

--------------030709000103010203000900
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--------------030709000103010203000900--
