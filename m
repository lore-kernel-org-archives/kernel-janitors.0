From: Alexander Nyberg <alexn@telia.com>
Date: Tue, 15 Jun 2004 17:12:35 +0000
Subject: [Kernel-janitors] Sparse checks #2
Message-Id: <1087319555.676.47.camel@boxen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96983119161742215=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============96983119161742215==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sparse checks in drivers/block/

Signed-off-by: Alexander Nyberg <alexn@telia.com>

===== drivers/acorn/block/mfmhd.c 1.52 vs edited =====
--- 1.52/drivers/acorn/block/mfmhd.c	2003-08-07 11:25:23 +02:00
+++ edited/drivers/acorn/block/mfmhd.c	2004-06-15 16:18:58 +02:00
@@ -1156,7 +1156,7 @@
 static int mfm_ioctl(struct inode *inode, struct file *file, u_int cmd, u_long arg)
 {
 	struct mfm_info *p = inode->i_bdev->bd_disk->private_data;
-	struct hd_geometry *geo = (struct hd_geometry *) arg;
+	struct hd_geometry __user *geo = (struct hd_geometry __user *) arg;
 	if (cmd != HDIO_GETGEO)
 		return -EINVAL;
 	if (!arg)
===== drivers/block/acsi.c 1.55 vs edited =====
--- 1.55/drivers/block/acsi.c	2003-09-18 06:30:39 +02:00
+++ edited/drivers/block/acsi.c	2004-06-15 16:19:37 +02:00
@@ -1090,7 +1090,7 @@
 	  case HDIO_GETGEO:
 		/* HDIO_GETGEO is supported more for getting the partition's
 		 * start sector... */
-	  { struct hd_geometry *geo = (struct hd_geometry *)arg;
+	  { struct hd_geometry __user *geo = (struct hd_geometry __user *)arg;
 	    /* just fake some geometry here, it's nonsense anyway; to make it
 		 * easy, use Adaptec's usual 64/32 mapping */
 	    put_user( 64, &geo->heads );
@@ -1102,8 +1102,8 @@
 	  case SCSI_IOCTL_GET_IDLUN:
 		/* SCSI compatible GET_IDLUN call to get target's ID and LUN number */
 		put_user( aip->target | (aip->lun << 8),
-				  &((Scsi_Idlun *) arg)->dev_id );
-		put_user( 0, &((Scsi_Idlun *) arg)->host_unique_id );
+				  &((Scsi_Idlun __user *) arg)->dev_id );
+		put_user( 0, &((Scsi_Idlun __user *) arg)->host_unique_id );
 		return 0;
 	  default:
 		return -EINVAL;
===== drivers/block/amiflop.c 1.46 vs edited =====
--- 1.46/drivers/block/amiflop.c	2003-09-03 12:32:10 +02:00
+++ edited/drivers/block/amiflop.c	2004-06-15 13:46:27 +02:00
@@ -1448,7 +1448,7 @@
 		loc.sectors = unit[drive].dtype->sects * unit[drive].type->sect_mult;
 		loc.cylinders = unit[drive].type->tracks;
 		loc.start = 0;
-		if (copy_to_user((void *)param, (void *)&loc,
+		if (copy_to_user((void __user *)param, (void *)&loc,
 				 sizeof(struct hd_geometry)))
 			return -EFAULT;
 		break;
@@ -1496,8 +1496,7 @@
 		getprm.head=unit[drive].type->heads;
 		getprm.sect=unit[drive].dtype->sects * unit[drive].type->sect_mult;
 		getprm.size=unit[drive].blocks;
-		if (copy_to_user((void *)param,
-				 (void *)&getprm,
+		if (copy_to_user((void __user *)param, (void *)&getprm,
 				 sizeof(struct floppy_struct)))
 			return -EFAULT;
 		break;
@@ -1510,7 +1509,7 @@
 		break;
 #ifdef RAW_IOCTL
 	case IOCTL_RAW_TRACK:
-		if (copy_to_user((void *)param, raw_buf,
+		if (copy_to_user((void __user *)param, raw_buf,
 				 unit[drive].type->read_size))
 			return -EFAULT;
 		else
===== drivers/block/ataflop.c 1.44 vs edited =====
--- 1.44/drivers/block/ataflop.c	2003-07-31 00:49:57 +02:00
+++ edited/drivers/block/ataflop.c	2004-06-15 14:22:00 +02:00
@@ -1534,7 +1534,7 @@
 		getprm.head = 2;
 		getprm.track = dtp->blocks/dtp->spt/2;
 		getprm.stretch = dtp->stretch;
-		if (copy_to_user((void *)param, &getprm, sizeof(getprm)))
+		if (copy_to_user((void __user *)param, &getprm, sizeof(getprm)))
 			return -EFAULT;
 		return 0;
 	}
@@ -1553,7 +1553,7 @@
 		/* get the parameters from user space */
 		if (floppy->ref != 1 && floppy->ref != -1)
 			return -EBUSY;
-		if (copy_from_user(&setprm, (void *) param, sizeof(setprm)))
+		if (copy_from_user(&setprm, (void __user *) param, sizeof(setprm)))
 			return -EFAULT;
 		/* 
 		 * first of all: check for floppy change and revalidate, 
@@ -1660,7 +1660,7 @@
 	case FDFMTTRK:
 		if (floppy->ref != 1 && floppy->ref != -1)
 			return -EBUSY;
-		if (copy_from_user(&fmt_desc, (void *) param, sizeof(fmt_desc)))
+		if (copy_from_user(&fmt_desc, (void __user *) param, sizeof(fmt_desc)))
 			return -EFAULT;
 		return do_format(drive, type, &fmt_desc);
 	case FDCLRPRM:
===== drivers/block/swim3.c 1.33 vs edited =====
--- 1.33/drivers/block/swim3.c	2004-05-19 18:02:45 +02:00
+++ edited/drivers/block/swim3.c	2004-06-15 17:41:19 +02:00
@@ -866,7 +866,7 @@
 		err = fd_eject(fs);
 		return err;
 	case FDGETPRM:
-	        if (copy_to_user((void *) param, (void *)&floppy_type,
+	        if (copy_to_user((void __user *) param, (void *)&floppy_type,
 				 sizeof(struct floppy_struct)))
 			return -EFAULT;
 		return 0;
===== drivers/block/swim_iop.c 1.27 vs edited =====
--- 1.27/drivers/block/swim_iop.c	2003-09-18 06:24:55 +02:00
+++ edited/drivers/block/swim_iop.c	2004-06-15 17:42:56 +02:00
@@ -364,7 +364,7 @@
 		err = swimiop_eject(fs);
 		return err;
 	case FDGETPRM:
-	        if (copy_to_user((void *) param, (void *) &floppy_type,
+	        if (copy_to_user((void __user *) param, (void *) &floppy_type,
 				 sizeof(struct floppy_struct)))
 			return -EFAULT;
 		return 0;
===== drivers/block/viodasd.c 1.5 vs edited =====
--- 1.5/drivers/block/viodasd.c	2004-05-25 11:53:02 +02:00
+++ edited/drivers/block/viodasd.c	2004-06-15 17:44:46 +02:00
@@ -253,13 +253,13 @@
 	unsigned char sectors;
 	unsigned char heads;
 	unsigned short cylinders;
-	struct hd_geometry *geo;
+	struct hd_geometry __user *geo;
 	struct gendisk *gendisk;
 	struct viodasd_device *d;
 
 	switch (cmd) {
 	case HDIO_GETGEO:
-		geo = (struct hd_geometry *)arg;
+		geo = (struct hd_geometry __user *)arg;
 		if (geo == NULL)
 			return -EINVAL;
 		err = verify_area(VERIFY_WRITE, geo, sizeof(*geo));
===== drivers/ide/ide-tape.c 1.40 vs edited =====
--- 1.40/drivers/ide/ide-tape.c	2004-04-23 21:09:54 +02:00
+++ edited/drivers/ide/ide-tape.c	2004-06-15 17:49:30 +02:00
@@ -3617,7 +3617,7 @@
 #endif /* IDETAPE_DEBUG_LOG */
 	switch (cmd) {
 		case 0x0340:
-			if (copy_from_user ((char *) &config, (char *) arg, sizeof (idetape_config_t)))
+			if (copy_from_user ((char *) &config, (char __user *) arg, sizeof (idetape_config_t)))
 				return -EFAULT;
 			tape->best_dsc_rw_frequency = config.dsc_rw_frequency;
 			tape->max_stages = config.nr_stages;
@@ -3625,7 +3625,7 @@
 		case 0x0350:
 			config.dsc_rw_frequency = (int) tape->best_dsc_rw_frequency;
 			config.nr_stages = tape->max_stages; 
-			if (copy_to_user((char *) arg, (char *) &config, sizeof (idetape_config_t)))
+			if (copy_to_user((char __user *) arg, (char *) &config, sizeof (idetape_config_t)))
 				return -EFAULT;
 			break;
 		default:
===== drivers/ide/legacy/hd.c 1.23 vs edited =====
--- 1.23/drivers/ide/legacy/hd.c	2003-08-15 03:17:17 +02:00
+++ edited/drivers/ide/legacy/hd.c	2004-06-15 17:50:22 +02:00
@@ -660,7 +660,7 @@
 	unsigned int cmd, unsigned long arg)
 {
 	struct hd_i_struct *disk = inode->i_bdev->bd_disk->private_data;
-	struct hd_geometry *loc = (struct hd_geometry *) arg;
+	struct hd_geometry __user *loc = (struct hd_geometry __user *) arg;
 	struct hd_geometry g; 
 
 	if (cmd != HDIO_GETGEO)
===== drivers/ide/legacy/hd98.c 1.6 vs edited =====
--- 1.6/drivers/ide/legacy/hd98.c	2003-08-07 11:25:25 +02:00
+++ edited/drivers/ide/legacy/hd98.c	2004-06-15 17:50:39 +02:00
@@ -656,7 +656,7 @@
 	unsigned int cmd, unsigned long arg)
 {
 	struct hd_i_struct *disk = inode->i_bdev->bd_disk->private_data;
-	struct hd_geometry *loc = (struct hd_geometry *) arg;
+	struct hd_geometry __user *loc = (struct hd_geometry __user *) arg;
 	struct hd_geometry g; 
 
 	if (cmd != HDIO_GETGEO)
===== drivers/message/i2o/i2o_block.c 1.58 vs edited =====
--- 1.58/drivers/message/i2o/i2o_block.c	2004-05-15 04:00:13 +02:00
+++ edited/drivers/message/i2o/i2o_block.c	2004-06-15 17:53:55 +02:00
@@ -873,13 +873,14 @@
 			i2o_block_biosparam(get_capacity(disk), 
 					&g.cylinders, &g.heads, &g.sectors);
 			g.start = get_start_sect(inode->i_bdev);
-			return copy_to_user((void *)arg,&g, sizeof(g))?-EFAULT:0;
+			return copy_to_user((void __user *)arg,&g, sizeof(g)) ? 
+				-EFAULT : 0;
 		}
 		
 		case BLKI2OGRSTRAT:
-			return put_user(dev->rcache, (int *)arg);
+			return put_user(dev->rcache, (int __user *)arg);
 		case BLKI2OGWSTRAT:
-			return put_user(dev->wcache, (int *)arg);
+			return put_user(dev->wcache, (int __user *)arg);
 		case BLKI2OSRSTRAT:
 			if(arg<0||arg>CACHE_SMARTFETCH)
 				return -EINVAL;
===== drivers/mtd/mtd_blkdevs.c 1.8 vs edited =====
--- 1.8/drivers/mtd/mtd_blkdevs.c	2004-02-26 12:26:02 +01:00
+++ edited/drivers/mtd/mtd_blkdevs.c	2004-06-15 17:54:34 +02:00
@@ -220,7 +220,7 @@
 				return ret;
 
 			g.start = get_start_sect(inode->i_bdev);
-			if (copy_to_user((void *)arg, &g, sizeof(g)))
+			if (copy_to_user((void __user *)arg, &g, sizeof(g)))
 				return -EFAULT;
 			return 0;
 		} /* else */



--===============96983119161742215==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96983119161742215==--
