From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Wed, 03 Mar 2004 19:41:13 +0000
Subject: [Kernel-janitors] [PATCH] - Audit for drivers/block/floppy.c.
Message-Id: <1078342465.14557.44.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi all,

Better audit for floppy_init() in drivers/block/floppy.c.

I tested it.

diff -Nparu linux-2.6.4-rc1-bk2/drivers/block/floppy.c linux-2.6.4-rc1-bk2~/drivers/block/floppy.c
--- linux-2.6.4-rc1-bk2/drivers/block/floppy.c	2004-03-02 18:42:54.000000000 -0300
+++ linux-2.6.4-rc1-bk2~/drivers/block/floppy.c	2004-03-02 18:38:09.000000000 -0300
@@ -4233,27 +4233,31 @@ static struct kobject *floppy_find(dev_t
 
 int __init floppy_init(void)
 {
-	int i,unit,drive;
-	int err;
+	unsigned char dr, unit;
+	int i, drive, err;
 
 	raw_cmd = NULL;
 
-	for (i=0; i<N_DRIVE; i++) {
-		disks[i] = alloc_disk(1);
-		if (!disks[i])
-			goto Enomem;
+	for (dr = 0; dr < N_DRIVE; dr++) {
+		disks[dr] = alloc_disk(1);
+		if (!disks[dr]) {
+			err = -ENOMEM;
+			goto out;
+		}
 	}
 
 	devfs_mk_dir ("floppy");
-	if ((err = register_blkdev(FLOPPY_MAJOR,"fd")))
-		goto out;
+
+	err = register_blkdev(FLOPPY_MAJOR, "fd");
+	if (err)
+		goto out1;
 
 	floppy_queue = blk_init_queue(do_fd_request, &floppy_lock);
-	blk_queue_max_sectors(floppy_queue, 64);
 	if (!floppy_queue) {
 		err = -ENOMEM;
-		goto fail_queue;
+		goto out2;
 	}
+	blk_queue_max_sectors(floppy_queue, 64);
 
 	for (i=0; i<N_DRIVE; i++) {
 		disks[i]->major = FLOPPY_MAJOR;
@@ -4291,17 +4295,20 @@ int __init floppy_init(void)
 	use_virtual_dma = can_use_virtual_dma & 1;
 	fdc_state[0].address = FDC1;
 	if (fdc_state[0].address = -1) {
+		del_timer(&fd_timeout);
 		err = -ENODEV;
-		goto out1;
+		goto out3;
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
+		goto out3;
 	}
 
 	/* initialise drive state */
@@ -4358,11 +4365,8 @@ int __init floppy_init(void)
 	initialising=0;
 	if (have_no_fdc) {
 		DPRINT("no floppy controllers found\n");
-		flush_scheduled_work();
-		if (usage_count)
-			floppy_release_irq_and_dma();
 		err = have_no_fdc;
-		goto out2;
+		goto out4;
 	}
 	
 	for (drive = 0; drive < N_DRIVE; drive++) {
@@ -4380,26 +4384,30 @@ int __init floppy_init(void)
 		add_disk(disks[drive]);
 	}
 
-	platform_device_register(&floppy_device);
+	err = platform_device_register(&floppy_device);
+	if (err)
+		goto out5;
+	
 	return 0;
 
-out1:
-	del_timer(&fd_timeout);
-out2:
+out5:
+	for (i = 0; i < N_DRIVE; i++)
+		del_timer(&motor_off_timer[i]);
+out4:
+	flush_scheduled_work();
+	if (usage_count)
+		floppy_release_irq_and_dma();
+out3:
 	blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
 	blk_cleanup_queue(floppy_queue);
-fail_queue:
+out2:
 	unregister_blkdev(FLOPPY_MAJOR,"fd");
-out:
-	for (i=0; i<N_DRIVE; i++)
-		put_disk(disks[i]);
+out1:
 	devfs_remove("floppy");
+out:
+	while (dr--)
+		put_disk(disks[dr]);
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
