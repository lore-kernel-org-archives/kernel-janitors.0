From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 21 Jun 2005 09:43:36 +0000
Subject: [KJ] [PATCH] printk : drivers/block/pktcdvd.c
Message-Id: <20050621094336.GD4880@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="V0207lvV8h4k8FAm"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-printk-drivers_block_pktcdvd.c"

diff -urpNX dontdiff 2.6.12-orig/drivers/block/pktcdvd.c 2.6.12/drivers/block/pktcdvd.c
--- 2.6.12-orig/drivers/block/pktcdvd.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/block/pktcdvd.c	2005-06-21 10:38:51.219590232 +0200
@@ -399,7 +399,7 @@ static void pkt_dump_sense(struct packet
 	int i;
 	struct request_sense *sense = cgc->sense;
 
-	printk("pktcdvd:");
+	printk(KERN_INFO "pktcdvd:");
 	for (i = 0; i < CDROM_PACKET_SIZE; i++)
 		printk(" %02x", cgc->cmd[i]);
 	printk(" - ");
@@ -409,7 +409,7 @@ static void pkt_dump_sense(struct packet
 		return;
 	}
 
-	printk("sense %02x.%02x.%02x", sense->sense_key, sense->asc, sense->ascq);
+	printk(KERN_INFO "sense %02x.%02x.%02x", sense->sense_key, sense->asc, sense->ascq);
 
 	if (sense->sense_key > 8) {
 		printk(" (INVALID)\n");
@@ -598,7 +598,7 @@ static int pkt_set_segment_merging(struc
 		set_bit(PACKET_MERGE_SEGS, &pd->flags);
 		return 0;
 	} else {
-		printk("pktcdvd: cdrom max_phys_segments too small\n");
+		printk(KERN_WARNING "pktcdvd: cdrom max_phys_segments too small\n");
 		return -EIO;
 	}
 }
@@ -1296,7 +1296,7 @@ work_to_do:
 
 static void pkt_print_settings(struct pktcdvd_device *pd)
 {
-	printk("pktcdvd: %s packets, ", pd->settings.fp ? "Fixed" : "Variable");
+	printk(KERN_INFO "pktcdvd: %s packets, ", pd->settings.fp ? "Fixed" : "Variable");
 	printk("%u blocks, ", pd->settings.size >> 2);
 	printk("Mode-%c disc\n", pd->settings.block_mode == 8 ? '1' : '2');
 }
@@ -1481,7 +1481,7 @@ static int pkt_set_write_settings(struct
 		/*
 		 * paranoia
 		 */
-		printk("pktcdvd: write mode wrong %d\n", wp->data_block_type);
+		printk(KERN_WARNING "pktcdvd: write mode wrong %d\n", wp->data_block_type);
 		return 1;
 	}
 	wp->packet_size = cpu_to_be32(pd->settings.size >> 2);
@@ -1523,7 +1523,7 @@ static int pkt_good_track(track_informat
 	if (ti->rt == 1 && ti->blank == 0 && ti->packet == 1)
 		return 0;
 
-	printk("pktcdvd: bad state %d-%d-%d\n", ti->rt, ti->blank, ti->packet);
+	printk(KERN_WARNING "pktcdvd: bad state %d-%d-%d\n", ti->rt, ti->blank, ti->packet);
 	return 1;
 }
 
@@ -1541,7 +1541,7 @@ static int pkt_good_disc(struct pktcdvd_
 		case 0x12: /* DVD-RAM */
 			return 0;
 		default:
-			printk("pktcdvd: Wrong disc profile (%x)\n", pd->mmc3_profile);
+			printk(KERN_INFO "pktcdvd: Wrong disc profile (%x)\n", pd->mmc3_profile);
 			return 1;
 	}
 
@@ -1550,22 +1550,22 @@ static int pkt_good_disc(struct pktcdvd_
 	 * but i'm not sure, should we leave this to user apps? probably.
 	 */
 	if (di->disc_type == 0xff) {
-		printk("pktcdvd: Unknown disc. No track?\n");
+		printk(KERN_INFO "pktcdvd: Unknown disc. No track?\n");
 		return 1;
 	}
 
 	if (di->disc_type != 0x20 && di->disc_type != 0) {
-		printk("pktcdvd: Wrong disc type (%x)\n", di->disc_type);
+		printk(KERN_INFO "pktcdvd: Wrong disc type (%x)\n", di->disc_type);
 		return 1;
 	}
 
 	if (di->erasable == 0) {
-		printk("pktcdvd: Disc not erasable\n");
+		printk(KERN_INFO "pktcdvd: Disc not erasable\n");
 		return 1;
 	}
 
 	if (di->border_status == PACKET_SESSION_RESERVED) {
-		printk("pktcdvd: Can't write to last track (reserved)\n");
+		printk(KERN_INFO "pktcdvd: Can't write to last track (reserved)\n");
 		return 1;
 	}
 
@@ -1590,7 +1590,7 @@ static int pkt_probe_settings(struct pkt
 	memset(&ti, 0, sizeof(track_information));
 
 	if ((ret = pkt_get_disc_info(pd, &di))) {
-		printk("failed get_disc\n");
+		printk(KERN_INFO "failed get_disc\n");
 		return ret;
 	}
 
@@ -1599,28 +1599,28 @@ static int pkt_probe_settings(struct pkt
 
 	switch (pd->mmc3_profile) {
 		case 0x1a: /* DVD+RW */
-			printk("pktcdvd: inserted media is DVD+RW\n");
+			printk(KERN_INFO "pktcdvd: inserted media is DVD+RW\n");
 			break;
 		case 0x13: /* DVD-RW */
-			printk("pktcdvd: inserted media is DVD-RW\n");
+			printk(KERN_INFO "pktcdvd: inserted media is DVD-RW\n");
 			break;
 		case 0x12: /* DVD-RAM */
-			printk("pktcdvd: inserted media is DVD-RAM\n");
+			printk(KERN_INFO "pktcdvd: inserted media is DVD-RAM\n");
 			break;
 		default:
-			printk("pktcdvd: inserted media is CD-R%s\n", di.erasable ? "W" : "");
+			printk(KERN_INFO "pktcdvd: inserted media is CD-R%s\n", di.erasable ? "W" : "");
 			break;
 	}
 	pd->type = di.erasable ? PACKET_CDRW : PACKET_CDR;
 
 	track = 1; /* (di.last_track_msb << 8) | di.last_track_lsb; */
 	if ((ret = pkt_get_track_info(pd, track, 1, &ti))) {
-		printk("pktcdvd: failed get_track\n");
+		printk(KERN_INFO "pktcdvd: failed get_track\n");
 		return ret;
 	}
 
 	if (pkt_good_track(&ti)) {
-		printk("pktcdvd: can't write to this track\n");
+		printk(KERN_WARNING "pktcdvd: can't write to this track\n");
 		return -ENXIO;
 	}
 
@@ -1630,7 +1630,7 @@ static int pkt_probe_settings(struct pkt
 	 */
 	pd->settings.size = be32_to_cpu(ti.fixed_packet_size) << 2;
 	if (pd->settings.size == 0) {
-		printk("pktcdvd: detected zero packet size!\n");
+		printk(KERN_INFO "pktcdvd: detected zero packet size!\n");
 		pd->settings.size = 128;
 	}
 	pd->settings.fp = ti.fp;
@@ -1672,7 +1672,7 @@ static int pkt_probe_settings(struct pkt
 			pd->settings.block_mode = PACKET_BLOCK_MODE2;
 			break;
 		default:
-			printk("pktcdvd: unknown data mode\n");
+			printk(KERN_WARNING "pktcdvd: unknown data mode\n");
 			return 1;
 	}
 	return 0;
@@ -1706,10 +1706,10 @@ static int pkt_write_caching(struct pktc
 	cgc.buflen = cgc.cmd[8] = 2 + ((buf[0] << 8) | (buf[1] & 0xff));
 	ret = pkt_mode_select(pd, &cgc);
 	if (ret) {
-		printk("pktcdvd: write caching control failed\n");
+		printk(KERN_INFO "pktcdvd: write caching control failed\n");
 		pkt_dump_sense(&cgc);
 	} else if (!ret && set)
-		printk("pktcdvd: enabled write caching on %s\n", pd->name);
+		printk(KERN_INFO "pktcdvd: enabled write caching on %s\n", pd->name);
 	return ret;
 }
 
@@ -1823,11 +1823,11 @@ static int pkt_media_speed(struct pktcdv
 	}
 
 	if (!buf[6] & 0x40) {
-		printk("pktcdvd: Disc type is not CD-RW\n");
+		printk(KERN_INFO "pktcdvd: Disc type is not CD-RW\n");
 		return 1;
 	}
 	if (!buf[6] & 0x4) {
-		printk("pktcdvd: A1 values on media are not valid, maybe not CDRW?\n");
+		printk(KERN_INFO "pktcdvd: A1 values on media are not valid, maybe not CDRW?\n");
 		return 1;
 	}
 
@@ -1847,14 +1847,14 @@ static int pkt_media_speed(struct pktcdv
 			*speed = us_clv_to_speed[sp];
 			break;
 		default:
-			printk("pktcdvd: Unknown disc sub-type %d\n",st);
+			printk(KERN_INFO "pktcdvd: Unknown disc sub-type %d\n",st);
 			return 1;
 	}
 	if (*speed) {
-		printk("pktcdvd: Max. media speed: %d\n",*speed);
+		printk(KERN_INFO "pktcdvd: Max. media speed: %d\n",*speed);
 		return 0;
 	} else {
-		printk("pktcdvd: Unknown speed %d for sub-type %d\n",sp,st);
+		printk(KERN_INFO "pktcdvd: Unknown speed %d for sub-type %d\n",sp,st);
 		return 1;
 	}
 }
@@ -1944,7 +1944,7 @@ static int pkt_open_dev(struct pktcdvd_d
 		goto out;
 
 	if ((ret = pkt_get_last_written(pd, &lba))) {
-		printk("pktcdvd: pkt_get_last_written failed\n");
+		printk(KERN_WARNING "pktcdvd: pkt_get_last_written failed\n");
 		goto out_putdev;
 	}
 
@@ -1973,7 +1973,7 @@ static int pkt_open_dev(struct pktcdvd_d
 		goto out_putdev;
 
 	if (write)
-		printk("pktcdvd: %lukB available on disc\n", lba << 1);
+		printk(KERN_INFO "pktcdvd: %lukB available on disc\n", lba << 1);
 
 	return 0;
 
@@ -2103,7 +2103,7 @@ static int pkt_make_request(request_queu
 
 	pd = q->queuedata;
 	if (!pd) {
-		printk("pktcdvd: %s incorrect request queue\n", bdevname(bio->bi_bdev, b));
+		printk(KERN_WARNING "pktcdvd: %s incorrect request queue\n", bdevname(bio->bi_bdev, b));
 		goto end_io;
 	}
 
@@ -2125,13 +2125,13 @@ static int pkt_make_request(request_queu
 	}
 
 	if (!test_bit(PACKET_WRITABLE, &pd->flags)) {
-		printk("pktcdvd: WRITE for ro device %s (%llu)\n",
+		printk(KERN_INFO "pktcdvd: WRITE for ro device %s (%llu)\n",
 			pd->name, (unsigned long long)bio->bi_sector);
 		goto end_io;
 	}
 
 	if (!bio->bi_size || (bio->bi_size % CD_FRAMESIZE)) {
-		printk("pktcdvd: wrong bio size\n");
+		printk(KERN_WARNING "pktcdvd: wrong bio size\n");
 		goto end_io;
 	}
 
@@ -2335,7 +2335,7 @@ static int pkt_new_dev(struct pktcdvd_de
 	struct block_device *bdev;
 
 	if (pd->pkt_dev == dev) {
-		printk("pktcdvd: Recursive setup not allowed\n");
+		printk(KERN_INFO "pktcdvd: Recursive setup not allowed\n");
 		return -EBUSY;
 	}
 	for (i = 0; i < MAX_WRITERS; i++) {
@@ -2343,11 +2343,11 @@ static int pkt_new_dev(struct pktcdvd_de
 		if (!pd2)
 			continue;
 		if (pd2->bdev->bd_dev == dev) {
-			printk("pktcdvd: %s already setup\n", bdevname(pd2->bdev, b));
+			printk(KERN_INFO "pktcdvd: %s already setup\n", bdevname(pd2->bdev, b));
 			return -EBUSY;
 		}
 		if (pd2->pkt_dev == dev) {
-			printk("pktcdvd: Can't chain pktcdvd devices\n");
+			printk(KERN_INFO "pktcdvd: Can't chain pktcdvd devices\n");
 			return -EBUSY;
 		}
 	}
@@ -2363,7 +2363,7 @@ static int pkt_new_dev(struct pktcdvd_de
 	__module_get(THIS_MODULE);
 
 	if (!pkt_grow_pktlist(pd, CONFIG_CDROM_PKTCDVD_BUFFERS)) {
-		printk("pktcdvd: not enough memory for buffers\n");
+		printk(KERN_WARNING "pktcdvd: not enough memory for buffers\n");
 		ret = -ENOMEM;
 		goto out_mem;
 	}
@@ -2376,7 +2376,7 @@ static int pkt_new_dev(struct pktcdvd_de
 	atomic_set(&pd->cdrw.pending_bios, 0);
 	pd->cdrw.thread = kthread_run(kcdrwd, pd, "%s", pd->name);
 	if (IS_ERR(pd->cdrw.thread)) {
-		printk("pktcdvd: can't start kernel thread\n");
+		printk(KERN_ERR "pktcdvd: can't start kernel thread\n");
 		ret = -ENOMEM;
 		goto out_thread;
 	}
@@ -2425,7 +2425,7 @@ static int pkt_ioctl(struct inode *inode
 		return blkdev_ioctl(pd->bdev->bd_inode, file, cmd, arg);
 
 	default:
-		printk("pktcdvd: Unknown ioctl for %s (%x)\n", pd->name, cmd);
+		printk(KERN_WARNING "pktcdvd: Unknown ioctl for %s (%x)\n", pd->name, cmd);
 		return -ENOTTY;
 	}
 
@@ -2470,7 +2470,7 @@ static int pkt_setup_dev(struct pkt_ctrl
 		if (!pkt_devs[idx])
 			break;
 	if (idx == MAX_WRITERS) {
-		printk("pktcdvd: max %d writers supported\n", MAX_WRITERS);
+		printk(KERN_INFO "pktcdvd: max %d writers supported\n", MAX_WRITERS);
 		return -EBUSY;
 	}
 
@@ -2647,7 +2647,7 @@ static int __init pkt_init(void)
 
 	ret = register_blkdev(pkt_major, "pktcdvd");
 	if (ret < 0) {
-		printk("pktcdvd: Unable to register block device\n");
+		printk(KERN_WARNING "pktcdvd: Unable to register block device\n");
 		goto out2;
 	}
 	if (!pkt_major)
@@ -2655,7 +2655,7 @@ static int __init pkt_init(void)
 
 	ret = misc_register(&pkt_misc);
 	if (ret) {
-		printk("pktcdvd: Unable to register misc device\n");
+		printk(KERN_WARNING "pktcdvd: Unable to register misc device\n");
 		goto out;
 	}
 

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--V0207lvV8h4k8FAm--
