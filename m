From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 18 Mar 2004 18:56:48 +0000
Subject: Re: [Kernel-janitors] [REDIFF] - drivers/block/floppy.c audit.
Message-Id: <20040318105648.360a26be.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1078867777.28746.11.camel@telecentrolivre>
In-Reply-To: <1078867777.28746.11.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Thu, 18 Mar 2004 14:55:07 -0300 Luiz Fernando Capitulino wrote:

|=20
| Hi Randy,
|=20
| Em Qua, 2004-03-17 =E0s 20:23, Randy.Dunlap escreveu:
|=20
| > |  Other thing to note is that the floppy_init() changed in
| > | 2.6.4-rc2-bk5 (?), so, this patch is also an update.
| > |=20
| > | diff -Nru linux-2.6.4-rc2-bk5/drivers/block/floppy.c linux-2.6.4-rc2-=
bk5~/drivers/block/floppy.c
| > | --- linux-2.6.4-rc2-bk5/drivers/block/floppy.c	2004-03-09 16:09:05.00=
0000000 -0300
| > | +++ linux-2.6.4-rc2-bk5~/drivers/block/floppy.c	2004-03-09 17:52:03.0=
00000000 -0300
| > | @@ -4233,36 +4233,40 @@
| > | =20
| > |  int __init floppy_init(void)
| > |  {
| > | -	int i,unit,drive;
| > | -	int err;
| > | +	unsigned char dr, unit;
| > | +	int i, drive, err;
| >=20
| > What's with the use of <unsigned char> here?
|=20
|  We only need to count until 8 here.

It's just that most cpus work better with <int>s etc. than with
<char>.  IOW, it's not saving CPU time and probably not saving
stack space (I haven't checked the latter, but each one might
be assigned an N-byte aligned address on the stack).
So I think that this isn't a good part of this patch.
However, the rest of it is good, or getting there.

| > |  	raw_cmd =3D NULL;
| > | =20
| > | -	for (i=3D0; i<N_DRIVE; i++) {
| > | -		disks[i] =3D alloc_disk(1);
| > | -		if (!disks[i])
| > | -			goto Enomem;
| > | -
| > | -		disks[i]->major =3D FLOPPY_MAJOR;
| > | -		disks[i]->first_minor =3D TOMINOR(i);
| > | -		disks[i]->fops =3D &floppy_fops;
| > | -		sprintf(disks[i]->disk_name, "fd%d", i);
| > | -
| > | -		init_timer(&motor_off_timer[i]);
| > | -		motor_off_timer[i].data =3D i;
| > | -		motor_off_timer[i].function =3D motor_off_callback;
| > | +	for (dr =3D 0; dr < N_DRIVE; dr++) {
| > | +		disks[dr] =3D alloc_disk(1);
| > | +		if (!disks[dr]) {
| > | +			err =3D -ENOMEM;
| > | +			goto out_put_disk;
| > | +		}
| > | +
| > | +		disks[dr]->major =3D FLOPPY_MAJOR;
| > | +		disks[dr]->first_minor =3D TOMINOR(dr);
| > | +		disks[dr]->fops =3D &floppy_fops;
| > | +		sprintf(disks[dr]->disk_name, "fd%d", dr);
| > | +
| > | +		init_timer(&motor_off_timer[dr]);
| >=20
| > <motor_off_timer> is only deleted at out_del_timer, iff
| > platform_device_register() returns an error.
| > Shouldn't it be deleted in all error paths?
|=20
|  Yes, you right.
|=20
| > | +		motor_off_timer[dr].data =3D dr;
| > | +		motor_off_timer[dr].function =3D motor_off_callback;
| > |  	}
| > | =20
| > |  	devfs_mk_dir ("floppy");
| > | -	if ((err =3D register_blkdev(FLOPPY_MAJOR,"fd")))
| > | -		goto out;
| > | +
| > | +	err =3D register_blkdev(FLOPPY_MAJOR, "fd");
| > | +	if (err)
| > | +		goto out_devfs_remove;
| > | =20
| > |  	floppy_queue =3D blk_init_queue(do_fd_request, &floppy_lock);
| > | -	blk_queue_max_sectors(floppy_queue, 64);
| > |  	if (!floppy_queue) {
| > |  		err =3D -ENOMEM;
| > | -		goto fail_queue;
| > | +		goto out_unreg_blkdev;
| > |  	}
| > | +	blk_queue_max_sectors(floppy_queue, 64);
| > | =20
| > |  	blk_register_region(MKDEV(FLOPPY_MAJOR, 0), 256, THIS_MODULE,
| > |  				floppy_find, NULL, NULL);
| > | @@ -4293,17 +4297,20 @@
| > |  	use_virtual_dma =3D can_use_virtual_dma & 1;
| > |  	fdc_state[0].address =3D FDC1;
| > |  	if (fdc_state[0].address =3D -1) {
| > | +		del_timer(&fd_timeout);
| > |  		err =3D -ENODEV;
| > | -		goto out1;
| > | +		goto out_unreg_region;
| > |  	}
| > |  #if N_FDC > 1
| > |  	fdc_state[1].address =3D FDC2;
| > |  #endif
| > | =20
| > |  	fdc =3D 0; /* reset fdc in case of unexpected interrupt */
| > | -	if (floppy_grab_irq_and_dma()){
| > | +	err =3D floppy_grab_irq_and_dma();
| > | +	if (err) {
| > | +		del_timer(&fd_timeout);
| > |  		err =3D -EBUSY;
| > | -		goto out1;
| > | +		goto out_unreg_region;
| > |  	}
| > | =20
| > |  	/* initialise drive state */
| > | @@ -4360,11 +4367,8 @@
| > |  	initialising=3D0;
| > |  	if (have_no_fdc) {
| > |  		DPRINT("no floppy controllers found\n");
| > | -		flush_scheduled_work();
| > | -		if (usage_count)
| > | -			floppy_release_irq_and_dma();
| > |  		err =3D have_no_fdc;
| > | -		goto out2;
| > | +		goto out_flush_work;
| > |  	}
| > |  =09
| > |  	for (drive =3D 0; drive < N_DRIVE; drive++) {
| > | @@ -4379,26 +4383,30 @@
| > |  		add_disk(disks[drive]);
| > |  	}
| > | =20
| > | -	platform_device_register(&floppy_device);
| > | +	err =3D platform_device_register(&floppy_device);
| > | +	if (err)
| > | +		goto out_del_timer;
| > | +
| >=20
| > If my comment about out_del_timer above is correct, this (above)
| > changes to:	goto out_flush_work;
|=20
| Yes...
|=20
| > |  	return 0;
| > | =20
| > | -out1:
| > | -	del_timer(&fd_timeout);
| > | -out2:
| > | +out_del_timer:
| > | +	for (i =3D 0; i < N_DRIVE; i++)
| > | +		del_timer(&motor_off_timer[i]);
| > | +out_flush_work:
| >=20
| > Does this need something like this:
| > 	for (drive =3D 0; drive < N_DRIVE; drive++) {
| > 		...similar to the add_disk() loop with conditionals...
| > 		del_gendisk(disks[drive]);
| > 	}
|=20
|  Ok, but I think it need to go in the out_put_disk label.

Maybe.  It's a bit too jumbled up for me to read in email.

| > | +	flush_scheduled_work();
| > | +	if (usage_count)
| > | +		floppy_release_irq_and_dma();
| > | +out_unreg_region:
| > |  	blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
| > |  	blk_cleanup_queue(floppy_queue);
| > | -fail_queue:
| > | +out_unreg_blkdev:
| > |  	unregister_blkdev(FLOPPY_MAJOR,"fd");
| > | -out:
| > | -	for (i=3D0; i<N_DRIVE; i++)
| > | -		put_disk(disks[i]);
| > | +out_devfs_remove:
| > |  	devfs_remove("floppy");
| >=20
| > and move the del_timer() loop to here...
|=20
|  In the while() bellow, ok ?

Hm, I thought that the value of 'dr' could be a bit less
than N_DRIVE if there was an early error, whereas the loop
that I suggested would go from [0, N_DRIVE).

| > | +out_put_disk:
| > | +	while (dr--)
| > | +		put_disk(disks[dr]);
| > |  	return err;
| > | -
| > | -Enomem:
| > | -	while (i--)
| > | -		put_disk(disks[i]);
| > | -	return -ENOMEM;
| > |  }
| > | =20
| > |  static spinlock_t floppy_usage_lock =3D SPIN_LOCK_UNLOCKED;
| > |=20
| > | --=20

--
~Randy

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
