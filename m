From: "Luiz Fernando N. Capitulino" <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 15 Apr 2004 21:12:37 +0000
Subject: [Kernel-janitors] [PATCH 1/2] - last floppy merges: audit.
Message-Id: <20040415181237.2a59b39c.lcapitulino@prefeitura.sp.gov.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66830482471703645=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============66830482471703645==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit



floppy_audit_v3.patch: Adds a better audit for floppy_init().


 drivers/block/floppy.c |   92 ++++++++++++++++++++++++++++---------------------
 1 files changed, 54 insertions(+), 38 deletions(-)


diff -X dontdiff -Nparu a/drivers/block/floppy.c a~/drivers/block/floppy.c
--- a/drivers/block/floppy.c	2004-04-14 15:48:15.000000000 -0300
+++ a~/drivers/block/floppy.c	2004-04-14 19:43:34.000000000 -0300
@@ -4247,35 +4247,40 @@ static struct kobject *floppy_find(dev_t
 int __init floppy_init(void)
 {
 	int i, unit, drive;
-	int err;
+	int err, dr;
 
 	raw_cmd = NULL;
+	i = 0;
 
-	for (i = 0; i < N_DRIVE; i++) {
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
+			goto out_put_disk;
+		}
+
+		disks[dr]->major = FLOPPY_MAJOR;
+		disks[dr]->first_minor = TOMINOR(i);
+		disks[dr]->fops = &floppy_fops;
+		sprintf(disks[dr]->disk_name, "fd%d", dr);
+
+		init_timer(&motor_off_timer[dr]);
+		motor_off_timer[dr].data = dr;
+		motor_off_timer[dr].function = motor_off_callback;
 	}
 
 	devfs_mk_dir("floppy");
-	if ((err = register_blkdev(FLOPPY_MAJOR, "fd")))
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
@@ -4306,17 +4311,20 @@ int __init floppy_init(void)
 	use_virtual_dma = can_use_virtual_dma & 1;
 	fdc_state[0].address = FDC1;
 	if (fdc_state[0].address == -1) {
+		del_timer(&fd_timeout);
 		err = -ENODEV;
-		goto out1;
+		goto out_unreg_region;
 	}
 #if N_FDC > 1
 	fdc_state[1].address = FDC2;
 #endif
 
 	fdc = 0;		/* reset fdc in case of unexpected interrupt */
-	if (floppy_grab_irq_and_dma()) {
+	err = floppy_grab_irq_and_dma();
+	if (err) {
+		del_timer(&fd_timeout);
 		err = -EBUSY;
-		goto out1;
+		goto out_unreg_region;
 	}
 
 	/* initialise drive state */
@@ -4373,11 +4381,8 @@ int __init floppy_init(void)
 	initialising = 0;
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
@@ -4392,26 +4397,37 @@ int __init floppy_init(void)
 		add_disk(disks[drive]);
 	}
 
-	platform_device_register(&floppy_device);
+	err = platform_device_register(&floppy_device);
+	if (err)
+		goto out_del_disk;
+
 	return 0;
 
-out1:
-	del_timer(&fd_timeout);
-out2:
+out_del_disk:
+	for (drive = 0; drive < N_DRIVE; drive++) {
+		if (!(allowed_drive_mask & (1 << drive)))
+			continue;
+		if (fdc_state[FDC(drive)].version == FDC_NONE)
+			continue;
+		del_gendisk(disks[drive]);
+	}
+out_flush_work:
+	flush_scheduled_work();
+	if (usage_count)
+		floppy_release_irq_and_dma();
+out_unreg_region:
 	blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
 	blk_cleanup_queue(floppy_queue);
-fail_queue:
+out_unreg_blkdev:
 	unregister_blkdev(FLOPPY_MAJOR, "fd");
-out:
-	for (i = 0; i < N_DRIVE; i++)
-		put_disk(disks[i]);
+out_devfs_remove:
 	devfs_remove("floppy");
+out_put_disk:
+	while (dr--) {
+		del_timer(&motor_off_timer[dr]);
+		put_disk(disks[dr]);
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

--===============66830482471703645==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66830482471703645==--
