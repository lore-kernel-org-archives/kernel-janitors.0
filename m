From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 19 Mar 2004 19:30:57 +0000
Subject: [Kernel-janitors] [REDIFF] - drivers/block/floppy.c audit.
Message-Id: <1079724657.14846.36.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1078867777.28746.11.camel@telecentrolivre>
In-Reply-To: <1078867777.28746.11.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi people,

 This version comes with the Randy suggestions, the changes
are:

- <unsigned char> to <int>;
- del_gendisk() insteed of put_disk();
- del_timer() for all disks.

 Randy, I'm using del_timer in the while() loop. Do you
still believe that is wrong ?

 I'll love to hear comments, because I have no certain of the
correctnes of this version.

diff -Nparu linux-2.6.5-rc1-bk4/drivers/block/floppy.c linux-2.6.5-rc1-bk4~/drivers/block/floppy.c
--- linux-2.6.5-rc1-bk4/drivers/block/floppy.c	2004-03-11 14:20:34.000000000 -0300
+++ linux-2.6.5-rc1-bk4~/drivers/block/floppy.c	2004-03-19 15:25:12.000000000 -0300
@@ -4233,36 +4233,40 @@ static struct kobject *floppy_find(dev_t
 
 int __init floppy_init(void)
 {
-	int i,unit,drive;
-	int err;
+	int dr, unit;
+	int i, drive, err;
 
 	raw_cmd = NULL;
 
-	for (i=0; i<N_DRIVE; i++) {
-		disks[i] = alloc_disk(1);
-		if (!disks[i])
-			goto Enomem;
-
-		disks[i]->major = FLOPPY_MAJOR;
-		disks[i]->first_minor = TOMINOR(i);
-		disks[i]->fops = &floppy_fops;
-		sprintf(disks[i]->disk_name, "fd%d", i);
-
-		init_timer(&motor_off_timer[i]);
-		motor_off_timer[i].data = i;
-		motor_off_timer[i].function = motor_off_callback;
+	for (dr = 0; dr < N_DRIVE; dr++) {
+		disks[dr] = alloc_disk(1);
+		if (!disks[dr]) {
+			err = -ENOMEM;
+			goto out_del_gendisk;
+		}
+
+		disks[dr]->major = FLOPPY_MAJOR;
+		disks[dr]->first_minor = TOMINOR(dr);
+		disks[dr]->fops = &floppy_fops;
+		sprintf(disks[dr]->disk_name, "fd%d", dr);
+
+		init_timer(&motor_off_timer[dr]);
+		motor_off_timer[dr].data = dr;
+		motor_off_timer[dr].function = motor_off_callback;
 	}
 
 	devfs_mk_dir ("floppy");
-	if ((err = register_blkdev(FLOPPY_MAJOR,"fd")))
-		goto out;
+
+	err = register_blkdev(FLOPPY_MAJOR, "fd");
+	if (err)
+		goto out_devfs_remove;
 
 	floppy_queue = blk_init_queue(do_fd_request, &floppy_lock);
-	blk_queue_max_sectors(floppy_queue, 64);
 	if (!floppy_queue) {
 		err = -ENOMEM;
-		goto fail_queue;
+		goto out_unreg_blkdev;
 	}
+	blk_queue_max_sectors(floppy_queue, 64);
 
 	blk_register_region(MKDEV(FLOPPY_MAJOR, 0), 256, THIS_MODULE,
 				floppy_find, NULL, NULL);
@@ -4293,17 +4297,20 @@ int __init floppy_init(void)
 	use_virtual_dma = can_use_virtual_dma & 1;
 	fdc_state[0].address = FDC1;
 	if (fdc_state[0].address = -1) {
+		del_timer(&fd_timeout);
 		err = -ENODEV;
-		goto out1;
+		goto out_unreg_region;
 	}
 #if N_FDC > 1
 	fdc_state[1].address = FDC2;
 #endif
 
 	fdc = 0; /* reset fdc in case of unexpected interrupt */
-	if (floppy_grab_irq_and_dma()){
+	err = floppy_grab_irq_and_dma();
+	if (err) {
+		del_timer(&fd_timeout);
 		err = -EBUSY;
-		goto out1;
+		goto out_unreg_region;
 	}
 
 	/* initialise drive state */
@@ -4360,11 +4367,8 @@ int __init floppy_init(void)
 	initialising=0;
 	if (have_no_fdc) {
 		DPRINT("no floppy controllers found\n");
-		flush_scheduled_work();
-		if (usage_count)
-			floppy_release_irq_and_dma();
 		err = have_no_fdc;
-		goto out2;
+		goto out_flush_work;
 	}
 	
 	for (drive = 0; drive < N_DRIVE; drive++) {
@@ -4379,26 +4383,29 @@ int __init floppy_init(void)
 		add_disk(disks[drive]);
 	}
 
-	platform_device_register(&floppy_device);
+	err = platform_device_register(&floppy_device);
+	if (err)
+		goto out_flush_work;
+
 	return 0;
 
-out1:
-	del_timer(&fd_timeout);
-out2:
+out_flush_work:
+	flush_scheduled_work();
+	if (usage_count)
+		floppy_release_irq_and_dma();
+out_unreg_region:
 	blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
 	blk_cleanup_queue(floppy_queue);
-fail_queue:
+out_unreg_blkdev:
 	unregister_blkdev(FLOPPY_MAJOR,"fd");
-out:
-	for (i=0; i<N_DRIVE; i++)
-		put_disk(disks[i]);
+out_devfs_remove:
 	devfs_remove("floppy");
+out_del_gendisk:
+	while (dr--) {
+		del_timer(&motor_off_timer[dr]);
+		del_gendisk(disks[dr]);
+	}
 	return err;
-
-Enomem:
-	while (i--)
-		put_disk(disks[i]);
-	return -ENOMEM;
 }
 
 static spinlock_t floppy_usage_lock = SPIN_LOCK_UNLOCKED;

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
