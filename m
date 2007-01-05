From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 05 Jan 2007 13:18:31 +0000
Subject: [KJ] [PATCH] Replace all references to "driverfs" with "sysfs".
Message-Id: <Pine.LNX.4.64.0701050809020.3825@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  Globally replace all references to "driverfs" with "sysfs."

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  Given that driverfs is long since deceased, this patch is simply a
global replacement of "driverfs" with "sysfs".  Whether the final
result makes semantic sense remains to be seen, but an "allyesconfig"
build is building as we speak and is progressing nicely.

  Given how many files this touches, I get the feeling this might have
to be applied in phases.  Thoughts?


 Documentation/pnp.txt            |    4 -
 Documentation/s390/cds.txt       |    2
 arch/arm/oprofile/common.c       |   12 ++--
 arch/i386/kernel/time.c          |    2
 arch/i386/kernel/topology.c      |    2
 arch/i386/oprofile/nmi_int.c     |   14 ++--
 arch/parisc/kernel/topology.c    |    2
 arch/um/drivers/ubd_kern.c       |    2
 arch/x86_64/kernel/time.c        |    2
 block/genhd.c                    |    2
 drivers/base/cpu.c               |    2
 drivers/base/node.c              |    2
 drivers/block/cciss.c            |    2
 drivers/block/floppy.c           |    2
 drivers/block/ub.c               |    4 -
 drivers/block/viodasd.c          |    2
 drivers/cdrom/viocd.c            |    2
 drivers/i2c/busses/i2c-ali1535.c |    2
 drivers/i2c/busses/i2c-ali15x3.c |    2
 drivers/i2c/busses/i2c-amd756.c  |    2
 drivers/i2c/busses/i2c-amd8111.c |    2
 drivers/i2c/busses/i2c-i801.c    |    2
 drivers/i2c/busses/i2c-piix4.c   |    2
 drivers/i2c/busses/i2c-sis5595.c |    2
 drivers/i2c/busses/i2c-sis630.c  |    2
 drivers/i2c/busses/i2c-sis96x.c  |    2
 drivers/i2c/busses/i2c-via.c     |    2
 drivers/ide/ide-cd.c             |    2
 drivers/ide/ide-disk.c           |    2
 drivers/ide/ide-floppy.c         |    2
 drivers/message/i2o/i2o_block.c  |    2
 drivers/mmc/mmc_block.c          |    2
 drivers/pci/pci-sysfs.c          |    2
 drivers/s390/block/dasd_genhd.c  |    2
 drivers/s390/block/dcssblk.c     |    2
 drivers/scsi/ide-scsi.c          |    2
 drivers/scsi/osst.c              |   12 ++--
 drivers/scsi/scsi_debug.c        |   82 ++++++++++++++---------------
 drivers/scsi/scsi_scan.c         |    2
 drivers/scsi/sd.c                |    2
 drivers/scsi/sr.c                |    2
 drivers/scsi/st.c                |   38 ++++++-------
 drivers/usb/host/ehci-dbg.c      |    2
 fs/lockd/svc.c                   |    2
 fs/partitions/check.c            |   10 +--
 include/linux/device.h           |    4 -
 include/linux/genhd.h            |    2
 include/linux/moduleparam.h      |    2
 include/linux/node.h             |    2
 49 files changed, 130 insertions(+), 130 deletions(-)


diff --git a/Documentation/pnp.txt b/Documentation/pnp.txt
index 28037aa..27b2509 100644
--- a/Documentation/pnp.txt
+++ b/Documentation/pnp.txt
@@ -17,9 +17,9 @@ The User Interface
 ------------------
 	The Linux Plug and Play user interface provides a means to activate PnP devices
 for legacy and user level drivers that do not support Linux Plug and Play.  The
-user interface is integrated into driverfs.
+user interface is integrated into sysfs.

-In addition to the standard driverfs file the following are created in each
+In addition to the standard sysfs file the following are created in each
 device's directory:
 id - displays a list of support EISA IDs
 options - displays possible resource configurations
diff --git a/Documentation/s390/cds.txt b/Documentation/s390/cds.txt
index 05a2b4f..7e3afa2 100644
--- a/Documentation/s390/cds.txt
+++ b/Documentation/s390/cds.txt
@@ -143,7 +143,7 @@ During its startup the Linux/390 system checks for peripheral devices. Each
 of those devices is uniquely defined by a so called subchannel by the ESA/390
 channel subsystem. While the subchannel numbers are system generated, each
 subchannel also takes a user defined attribute, the so called device number.
-Both subchannel number and device number cannot exceed 65535. During driverfs
+Both subchannel number and device number cannot exceed 65535. During sysfs
 initialisation, the information about control unit type and device types that
 imply specific I/O commands (channel command words - CCWs) in order to operate
 the device are gathered. Device drivers can retrieve this set of hardware
diff --git a/arch/arm/oprofile/common.c b/arch/arm/oprofile/common.c
index 6f83335..b6817ca 100644
--- a/arch/arm/oprofile/common.c
+++ b/arch/arm/oprofile/common.c
@@ -106,7 +106,7 @@ static struct sys_device device_oprofile = {
 	.cls		= &oprofile_sysclass,
 };

-static int __init init_driverfs(void)
+static int __init init_sysfs(void)
 {
 	int ret;

@@ -116,14 +116,14 @@ static int __init init_driverfs(void)
 	return ret;
 }

-static void  exit_driverfs(void)
+static void  exit_sysfs(void)
 {
 	sysdev_unregister(&device_oprofile);
 	sysdev_class_unregister(&oprofile_sysclass);
 }
 #else
-#define init_driverfs()	do { } while (0)
-#define exit_driverfs() do { } while (0)
+#define init_sysfs()	do { } while (0)
+#define exit_sysfs() do { } while (0)
 #endif /* CONFIG_PM */

 int __init oprofile_arch_init(struct oprofile_operations *ops)
@@ -146,7 +146,7 @@ int __init oprofile_arch_init(struct oprofile_operations *ops)
 			return -ENOMEM;

 		op_arm_model = spec;
-		init_driverfs();
+		init_sysfs();
 		ops->create_files = op_arm_create_files;
 		ops->setup = op_arm_setup;
 		ops->shutdown = op_arm_stop;
@@ -163,7 +163,7 @@ int __init oprofile_arch_init(struct oprofile_operations *ops)
 void oprofile_arch_exit(void)
 {
 	if (op_arm_model) {
-		exit_driverfs();
+		exit_sysfs();
 		op_arm_model = NULL;
 	}
 	kfree(counter_config);
diff --git a/arch/i386/kernel/time.c b/arch/i386/kernel/time.c
index c505b16..7ea6b05 100644
--- a/arch/i386/kernel/time.c
+++ b/arch/i386/kernel/time.c
@@ -334,7 +334,7 @@ static struct sysdev_class timer_sysclass = {
 };


-/* XXX this driverfs stuff should probably go elsewhere later -john */
+/* XXX this sysfs stuff should probably go elsewhere later -john */
 static struct sys_device device_timer = {
 	.id	= 0,
 	.cls	= &timer_sysclass,
diff --git a/arch/i386/kernel/topology.c b/arch/i386/kernel/topology.c
index 79cf608..4578235 100644
--- a/arch/i386/kernel/topology.c
+++ b/arch/i386/kernel/topology.c
@@ -1,5 +1,5 @@
 /*
- * arch/i386/kernel/topology.c - Populate driverfs with topology information
+ * arch/i386/kernel/topology.c - Populate sysfs with topology information
  *
  * Written by: Matthew Dobson, IBM Corporation
  * Original Code: Paul Dorwin, IBM Corporation, Patrick Mochel, OSDL
diff --git a/arch/i386/oprofile/nmi_int.c b/arch/i386/oprofile/nmi_int.c
index 3700eef..8fda7be 100644
--- a/arch/i386/oprofile/nmi_int.c
+++ b/arch/i386/oprofile/nmi_int.c
@@ -63,7 +63,7 @@ static struct sys_device device_oprofile = {
 };


-static int __init init_driverfs(void)
+static int __init init_sysfs(void)
 {
 	int error;
 	if (!(error = sysdev_class_register(&oprofile_sysclass)))
@@ -72,15 +72,15 @@ static int __init init_driverfs(void)
 }


-static void exit_driverfs(void)
+static void exit_sysfs(void)
 {
 	sysdev_unregister(&device_oprofile);
 	sysdev_class_unregister(&oprofile_sysclass);
 }

 #else
-#define init_driverfs() do { } while (0)
-#define exit_driverfs() do { } while (0)
+#define init_sysfs() do { } while (0)
+#define exit_sysfs() do { } while (0)
 #endif /* CONFIG_PM */

 static int profile_exceptions_notify(struct notifier_block *self,
@@ -385,7 +385,7 @@ static int __init ppro_init(char ** cpu_type)
 	return 1;
 }

-/* in order to get driverfs right */
+/* in order to get sysfs right */
 static int using_nmi;

 int __init op_nmi_init(struct oprofile_operations *ops)
@@ -440,7 +440,7 @@ int __init op_nmi_init(struct oprofile_operations *ops)
 			return -ENODEV;
 	}

-	init_driverfs();
+	init_sysfs();
 	using_nmi = 1;
 	ops->create_files = nmi_create_files;
 	ops->setup = nmi_setup;
@@ -456,5 +456,5 @@ int __init op_nmi_init(struct oprofile_operations *ops)
 void op_nmi_exit(void)
 {
 	if (using_nmi)
-		exit_driverfs();
+		exit_sysfs();
 }
diff --git a/arch/parisc/kernel/topology.c b/arch/parisc/kernel/topology.c
index 068b20d..d71cb01 100644
--- a/arch/parisc/kernel/topology.c
+++ b/arch/parisc/kernel/topology.c
@@ -1,5 +1,5 @@
 /*
- * arch/parisc/kernel/topology.c - Populate driverfs with topology information
+ * arch/parisc/kernel/topology.c - Populate sysfs with topology information
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index 49c047b..9f772d5 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -655,7 +655,7 @@ static int ubd_disk_register(int major, u64 size, int unit,
 		ubd_devs[unit].pdev.id   = unit;
 		ubd_devs[unit].pdev.name = DRIVER_NAME;
 		platform_device_register(&ubd_devs[unit].pdev);
-		disk->driverfs_dev = &ubd_devs[unit].pdev.dev;
+		disk->sysfs_dev = &ubd_devs[unit].pdev.dev;
 	}

 	disk->private_data = &ubd_devs[unit];
diff --git a/arch/x86_64/kernel/time.c b/arch/x86_64/kernel/time.c
index 9f05bc9..552f5ae 100644
--- a/arch/x86_64/kernel/time.c
+++ b/arch/x86_64/kernel/time.c
@@ -1066,7 +1066,7 @@ static struct sysdev_class timer_sysclass = {
 	set_kset_name("timer"),
 };

-/* XXX this driverfs stuff should probably go elsewhere later -john */
+/* XXX this sysfs stuff should probably go elsewhere later -john */
 static struct sys_device device_timer = {
 	.id	= 0,
 	.cls	= &timer_sysclass,
diff --git a/block/genhd.c b/block/genhd.c
index 457fdac..21d88ad 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -509,7 +509,7 @@ static int block_uevent(struct kset *kset, struct kobject *kobj, char **envp,
 		       "MAJOR=%u", disk->major);

 	/* add physical device, backing this device  */
-	physdev = disk->driverfs_dev;
+	physdev = disk->sysfs_dev;
 	if (physdev) {
 		char *path = kobject_get_path(&physdev->kobj, GFP_KERNEL);

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 7fd095e..fe7ef33 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -103,7 +103,7 @@ static SYSDEV_ATTR(crash_notes, 0400, show_crash_notes, NULL);
 #endif

 /*
- * register_cpu - Setup a driverfs device for a CPU.
+ * register_cpu - Setup a sysfs device for a CPU.
  * @cpu - cpu->hotpluggable field set to 1 will generate a control file in
  *	  sysfs for this CPU.
  * @num - CPU number to use when creating the device.
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 001e6f6..808422f 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -138,7 +138,7 @@ static SYSDEV_ATTR(distance, S_IRUGO, node_read_distance, NULL);


 /*
- * register_node - Setup a driverfs device for a node.
+ * register_node - Setup a sysfs device for a node.
  * @num - Node number to use when creating the device.
  *
  * Initialize and register the node device.
diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
index 05dfe35..7f60089 100644
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -3347,7 +3347,7 @@ static int __devinit cciss_init_one(struct pci_dev *pdev,
 		disk->fops = &cciss_fops;
 		disk->queue = q;
 		disk->private_data = drv;
-		disk->driverfs_dev = &pdev->dev;
+		disk->sysfs_dev = &pdev->dev;
 		/* we must register the controller even if no disks exist */
 		/* this is for the online array utilities */
 		if (!drv->heads && j)
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 3f1b382..bf1deef 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4339,7 +4339,7 @@ static int __init floppy_init(void)
 		disks[drive]->private_data = (void *)(long)drive;
 		disks[drive]->queue = floppy_queue;
 		disks[drive]->flags |= GENHD_FL_REMOVABLE;
-		disks[drive]->driverfs_dev = &floppy_device[drive].dev;
+		disks[drive]->sysfs_dev = &floppy_device[drive].dev;
 		add_disk(disks[drive]);
 	}

diff --git a/drivers/block/ub.c b/drivers/block/ub.c
index 2098eff..ede86c2 100644
--- a/drivers/block/ub.c
+++ b/drivers/block/ub.c
@@ -2196,7 +2196,7 @@ static int ub_probe(struct usb_interface *intf,
 	usb_get_dev(sc->dev);
 	/*
 	 * Since we give the interface struct to the block level through
-	 * disk->driverfs_dev, we have to pin it. Otherwise, block_uevent
+	 * disk->sysfs_dev, we have to pin it. Otherwise, block_uevent
 	 * oopses on close after a disconnect (kernels 2.6.16 and up).
 	 */
 	usb_get_intf(sc->intf);
@@ -2305,7 +2305,7 @@ static int ub_probe_lun(struct ub_dev *sc, int lnum)
 	disk->first_minor = lun->id * UB_PARTS_PER_LUN;
 	disk->fops = &ub_bd_fops;
 	disk->private_data = lun;
-	disk->driverfs_dev = &sc->intf->dev;
+	disk->sysfs_dev = &sc->intf->dev;

 	rc = -ENOMEM;
 	if ((q = blk_init_queue(ub_request_fn, sc->lock)) = NULL)
diff --git a/drivers/block/viodasd.c b/drivers/block/viodasd.c
index 68592c3..c33ba22 100644
--- a/drivers/block/viodasd.c
+++ b/drivers/block/viodasd.c
@@ -526,7 +526,7 @@ retry:
 	g->fops = &viodasd_fops;
 	g->queue = q;
 	g->private_data = d;
-	g->driverfs_dev = d->dev;
+	g->sysfs_dev = d->dev;
 	set_capacity(g, d->size >> 9);

 	printk(VIOD_KERN_INFO "disk %d: %lu sectors (%lu MB) "
diff --git a/drivers/cdrom/viocd.c b/drivers/cdrom/viocd.c
index 93fbf84..2894ab6 100644
--- a/drivers/cdrom/viocd.c
+++ b/drivers/cdrom/viocd.c
@@ -698,7 +698,7 @@ static int viocd_probe(struct vio_dev *vdev, const struct vio_device_id *id)
 	gendisk->private_data = d;
 	d->viocd_disk = gendisk;
 	d->dev = &vdev->dev;
-	gendisk->driverfs_dev = d->dev;
+	gendisk->sysfs_dev = d->dev;
 	add_disk(gendisk);
 	return 0;

diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index e75d339..1886a4c 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -494,7 +494,7 @@ static int __devinit ali1535_probe(struct pci_dev *dev, const struct pci_device_
 		return -ENODEV;
 	}

-	/* set up the driverfs linkage to our parent device */
+	/* set up the sysfs linkage to our parent device */
 	ali1535_adapter.dev.parent = &dev->dev;

 	snprintf(ali1535_adapter.name, I2C_NAME_SIZE,
diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 3f11b6e..139f26e 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -489,7 +489,7 @@ static int __devinit ali15x3_probe(struct pci_dev *dev, const struct pci_device_
 		return -ENODEV;
 	}

-	/* set up the driverfs linkage to our parent device */
+	/* set up the sysfs linkage to our parent device */
 	ali15x3_adapter.dev.parent = &dev->dev;

 	snprintf(ali15x3_adapter.name, I2C_NAME_SIZE,
diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index 2d21afd..f1735e9 100644
--- a/drivers/i2c/busses/i2c-amd756.c
+++ b/drivers/i2c/busses/i2c-amd756.c
@@ -374,7 +374,7 @@ static int __devinit amd756_probe(struct pci_dev *pdev,
 	dev_dbg(&pdev->dev, "SMBREV = 0x%X\n", temp);
 	dev_dbg(&pdev->dev, "AMD756_smba = 0x%X\n", amd756_ioport);

-	/* set up the driverfs linkage to our parent device */
+	/* set up the sysfs linkage to our parent device */
 	amd756_smbus.dev.parent = &pdev->dev;

 	sprintf(amd756_smbus.name, "SMBus %s adapter at %04x",
diff --git a/drivers/i2c/busses/i2c-amd8111.c b/drivers/i2c/busses/i2c-amd8111.c
index 0fbc718..8b38dae 100644
--- a/drivers/i2c/busses/i2c-amd8111.c
+++ b/drivers/i2c/busses/i2c-amd8111.c
@@ -355,7 +355,7 @@ static int __devinit amd8111_probe(struct pci_dev *dev, const struct pci_device_
 	smbus->adapter.algo = &smbus_algorithm;
 	smbus->adapter.algo_data = smbus;

-	/* set up the driverfs linkage to our parent device */
+	/* set up the sysfs linkage to our parent device */
 	smbus->adapter.dev.parent = &dev->dev;

 	error = i2c_add_adapter(&smbus->adapter);
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ae625b8..2c09b5b 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -522,7 +522,7 @@ static int __devinit i801_probe(struct pci_dev *dev, const struct pci_device_id
 	else
 		dev_dbg(&dev->dev, "SMBus using PCI Interrupt\n");

-	/* set up the driverfs linkage to our parent device */
+	/* set up the sysfs linkage to our parent device */
 	i801_adapter.dev.parent = &dev->dev;

 	snprintf(i801_adapter.name, I2C_NAME_SIZE,
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 30c7a1b..cce546d 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -422,7 +422,7 @@ static int __devinit piix4_probe(struct pci_dev *dev,
 	if (retval)
 		return retval;

-	/* set up the driverfs linkage to our parent device */
+	/* set up the sysfs linkage to our parent device */
 	piix4_adapter.dev.parent = &dev->dev;

 	snprintf(piix4_adapter.name, I2C_NAME_SIZE,
diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
index 38bbfd8..cbf0e27 100644
--- a/drivers/i2c/busses/i2c-sis5595.c
+++ b/drivers/i2c/busses/i2c-sis5595.c
@@ -383,7 +383,7 @@ static int __devinit sis5595_probe(struct pci_dev *dev, const struct pci_device_
 		return -ENODEV;
 	}

-	/* set up the driverfs linkage to our parent device */
+	/* set up the sysfs linkage to our parent device */
 	sis5595_adapter.dev.parent = &dev->dev;

 	sprintf(sis5595_adapter.name, "SMBus SIS5595 adapter at %04x",
diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
index dec0baf..7249486 100644
--- a/drivers/i2c/busses/i2c-sis630.c
+++ b/drivers/i2c/busses/i2c-sis630.c
@@ -476,7 +476,7 @@ static int __devinit sis630_probe(struct pci_dev *dev, const struct pci_device_i
 		return -ENODEV;
 	}

-	/* set up the driverfs linkage to our parent device */
+	/* set up the sysfs linkage to our parent device */
 	sis630_adapter.dev.parent = &dev->dev;

 	sprintf(sis630_adapter.name, "SMBus SIS630 adapter at %04x",
diff --git a/drivers/i2c/busses/i2c-sis96x.c b/drivers/i2c/busses/i2c-sis96x.c
index 7fd07fb..37ea77f 100644
--- a/drivers/i2c/busses/i2c-sis96x.c
+++ b/drivers/i2c/busses/i2c-sis96x.c
@@ -297,7 +297,7 @@ static int __devinit sis96x_probe(struct pci_dev *dev,
 		return -EINVAL;
 	}

-	/* set up the driverfs linkage to our parent device */
+	/* set up the sysfs linkage to our parent device */
 	sis96x_adapter.dev.parent = &dev->dev;

 	snprintf(sis96x_adapter.name, I2C_NAME_SIZE,
diff --git a/drivers/i2c/busses/i2c-via.c b/drivers/i2c/busses/i2c-via.c
index 15d7e00..3ffb786 100644
--- a/drivers/i2c/busses/i2c-via.c
+++ b/drivers/i2c/busses/i2c-via.c
@@ -137,7 +137,7 @@ static int __devinit vt586b_probe(struct pci_dev *dev, const struct pci_device_i
 	outb(inb(I2C_DIR) & ~(I2C_SDA | I2C_SCL), I2C_DIR);
 	outb(inb(I2C_OUT) & ~(I2C_SDA | I2C_SCL), I2C_OUT);

-	/* set up the driverfs linkage to our parent device */
+	/* set up the sysfs linkage to our parent device */
 	vt586b_adapter.dev.parent = &dev->dev;

 	res = i2c_bit_add_bus(&vt586b_adapter);
diff --git a/drivers/ide/ide-cd.c b/drivers/ide/ide-cd.c
index 5969cec..c9510ef 100644
--- a/drivers/ide/ide-cd.c
+++ b/drivers/ide/ide-cd.c
@@ -3535,7 +3535,7 @@ static int ide_cd_probe(ide_drive_t *drive)
 	drive->driver_data = info;

 	g->minors = 1;
-	g->driverfs_dev = &drive->gendev;
+	g->sysfs_dev = &drive->gendev;
 	g->flags = GENHD_FL_CD | GENHD_FL_REMOVABLE;
 	if (ide_cdrom_setup(drive)) {
 		struct cdrom_device_info *devinfo = &info->devinfo;
diff --git a/drivers/ide/ide-disk.c b/drivers/ide/ide-disk.c
index 0a05a37..bf7ae03 100644
--- a/drivers/ide/ide-disk.c
+++ b/drivers/ide/ide-disk.c
@@ -1221,7 +1221,7 @@ static int ide_disk_probe(ide_drive_t *drive)
 		drive->attach = 1;

 	g->minors = 1 << PARTN_BITS;
-	g->driverfs_dev = &drive->gendev;
+	g->sysfs_dev = &drive->gendev;
 	g->flags = drive->removable ? GENHD_FL_REMOVABLE : 0;
 	set_capacity(g, idedisk_capacity(drive));
 	g->fops = &idedisk_ops;
diff --git a/drivers/ide/ide-floppy.c b/drivers/ide/ide-floppy.c
index d33717c..1355862 100644
--- a/drivers/ide/ide-floppy.c
+++ b/drivers/ide/ide-floppy.c
@@ -2173,7 +2173,7 @@ static int ide_floppy_probe(ide_drive_t *drive)
 	idefloppy_setup (drive, floppy);

 	g->minors = 1 << PARTN_BITS;
-	g->driverfs_dev = &drive->gendev;
+	g->sysfs_dev = &drive->gendev;
 	g->flags = drive->removable ? GENHD_FL_REMOVABLE : 0;
 	g->fops = &idefloppy_ops;
 	drive->attach = 1;
diff --git a/drivers/message/i2o/i2o_block.c b/drivers/message/i2o/i2o_block.c
index da9859f..2346491 100644
--- a/drivers/message/i2o/i2o_block.c
+++ b/drivers/message/i2o/i2o_block.c
@@ -1100,7 +1100,7 @@ static int i2o_block_probe(struct device *dev)
 	gd = i2o_blk_dev->gd;
 	gd->first_minor = unit << 4;
 	sprintf(gd->disk_name, "i2o/hd%c", 'a' + unit);
-	gd->driverfs_dev = &i2o_dev->device;
+	gd->sysfs_dev = &i2o_dev->device;

 	/* setup request queue */
 	queue = gd->queue;
diff --git a/drivers/mmc/mmc_block.c b/drivers/mmc/mmc_block.c
index 8771357..2c2ae65 100644
--- a/drivers/mmc/mmc_block.c
+++ b/drivers/mmc/mmc_block.c
@@ -455,7 +455,7 @@ static struct mmc_blk_data *mmc_blk_alloc(struct mmc_card *card)
 	md->disk->fops = &mmc_bdops;
 	md->disk->private_data = md;
 	md->disk->queue = md->queue.queue;
-	md->disk->driverfs_dev = &card->dev;
+	md->disk->sysfs_dev = &card->dev;

 	/*
 	 * As discussed on lkml, GENHD_FL_REMOVABLE should:
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 7a94076..db25918 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -10,7 +10,7 @@
  *
  * File attributes for PCI devices
  *
- * Modeled after usb's driverfs.c
+ * Modeled after usb's sysfs.c
  *
  */

diff --git a/drivers/s390/block/dasd_genhd.c b/drivers/s390/block/dasd_genhd.c
index d163632..9231a05 100644
--- a/drivers/s390/block/dasd_genhd.c
+++ b/drivers/s390/block/dasd_genhd.c
@@ -43,7 +43,7 @@ dasd_gendisk_alloc(struct dasd_device *device)
 	gdp->major = DASD_MAJOR;
 	gdp->first_minor = device->devindex << DASD_PARTN_BITS;
 	gdp->fops = &dasd_device_operations;
-	gdp->driverfs_dev = &device->cdev->dev;
+	gdp->sysfs_dev = &device->cdev->dev;

 	/*
 	 * Set device name.
diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index be9b053..986379e 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -409,7 +409,7 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
 	dev_info->dcssblk_queue = blk_alloc_queue(GFP_KERNEL);
 	dev_info->gd->queue = dev_info->dcssblk_queue;
 	dev_info->gd->private_data = dev_info;
-	dev_info->gd->driverfs_dev = &dev_info->dev;
+	dev_info->gd->sysfs_dev = &dev_info->dev;
 	/*
 	 * load the segment
 	 */
diff --git a/drivers/scsi/ide-scsi.c b/drivers/scsi/ide-scsi.c
index 8f6b5bf..32a5c27 100644
--- a/drivers/scsi/ide-scsi.c
+++ b/drivers/scsi/ide-scsi.c
@@ -879,7 +879,7 @@ static inline int should_transform(ide_drive_t *drive, struct scsi_cmnd *cmd)

 	if (disk) {
 		struct struct scsi_device_Template **p = disk->private_data;
-		if (strcmp((*p)->scsi_driverfs_driver.name, "sg") = 0)
+		if (strcmp((*p)->scsi_sysfs_driver.name, "sg") = 0)
 			return test_bit(IDESCSI_SG_TRANSFORM, &scsi->transform);
 	}
 #endif
diff --git a/drivers/scsi/osst.c b/drivers/scsi/osst.c
index 7d23110..0f49969 100644
--- a/drivers/scsi/osst.c
+++ b/drivers/scsi/osst.c
@@ -5574,14 +5574,14 @@ static ssize_t osst_version_show(struct device_driver *ddd, char *buf)

 static DRIVER_ATTR(version, S_IRUGO, osst_version_show, NULL);

-static int osst_create_driverfs_files(struct device_driver *driverfs)
+static int osst_create_sysfs_files(struct device_driver *sysfs)
 {
-	return driver_create_file(driverfs, &driver_attr_version);
+	return driver_create_file(sysfs, &driver_attr_version);
 }

-static void osst_remove_driverfs_files(struct device_driver *driverfs)
+static void osst_remove_sysfs_files(struct device_driver *sysfs)
 {
-	driver_remove_file(driverfs, &driver_attr_version);
+	driver_remove_file(sysfs, &driver_attr_version);
 }

 /*
@@ -5953,7 +5953,7 @@ static int __init init_osst(void)
 	if (err)
 		goto err_out_chrdev;

-	err = osst_create_driverfs_files(&osst_template.gendrv);
+	err = osst_create_sysfs_files(&osst_template.gendrv);
 	if (err)
 		goto err_out_scsidrv;

@@ -5973,7 +5973,7 @@ static void __exit exit_osst (void)
 	int i;
 	struct osst_tape * STp;

-	osst_remove_driverfs_files(&osst_template.gendrv);
+	osst_remove_sysfs_files(&osst_template.gendrv);
 	scsi_unregister_driver(&osst_template.gendrv);
 	unregister_chrdev(OSST_MAJOR, "osst");
 	osst_sysfs_cleanup();
diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 30ee3d7..6512559 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -234,7 +234,7 @@ static int sdebug_driver_probe(struct device *);
 static int sdebug_driver_remove(struct device *);
 static struct bus_type pseudo_lld_bus;

-static struct device_driver sdebug_driverfs_driver = {
+static struct device_driver sdebug_sysfs_driver = {
 	.name 		= sdebug_proc_name,
 	.bus		= &pseudo_lld_bus,
 };
@@ -293,8 +293,8 @@ static int inquiry_evpd_83(unsigned char * arr, int port_group_id,
 			   int target_dev_id, int dev_id_num,
 			   const char * dev_id_str, int dev_id_str_len);
 static int inquiry_evpd_88(unsigned char * arr, int target_dev_id);
-static int do_create_driverfs_files(void);
-static void do_remove_driverfs_files(void);
+static int do_create_sysfs_files(void);
+static void do_remove_sysfs_files(void);

 static int sdebug_add_adapter(void);
 static void sdebug_remove_adapter(void);
@@ -2740,45 +2740,45 @@ DRIVER_ATTR(vpd_use_hostno, S_IRUGO | S_IWUSR, sdebug_vpd_use_hostno_show,
    directory) is that auxiliary actions can be triggered when an attribute
    is changed. For example see: sdebug_add_host_store() above.
  */
-static int do_create_driverfs_files(void)
+static int do_create_sysfs_files(void)
 {
 	int ret;

-	ret = driver_create_file(&sdebug_driverfs_driver, &driver_attr_add_host);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_delay);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_dev_size_mb);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_dsense);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_every_nth);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_fake_rw);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_max_luns);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_no_lun_0);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_num_parts);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_num_tgts);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_ptype);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_opts);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_scsi_level);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_virtual_gb);
-	ret |= driver_create_file(&sdebug_driverfs_driver, &driver_attr_vpd_use_hostno);
+	ret = driver_create_file(&sdebug_sysfs_driver, &driver_attr_add_host);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_delay);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_dev_size_mb);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_dsense);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_every_nth);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_fake_rw);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_max_luns);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_no_lun_0);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_num_parts);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_num_tgts);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_ptype);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_opts);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_scsi_level);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_virtual_gb);
+	ret |= driver_create_file(&sdebug_sysfs_driver, &driver_attr_vpd_use_hostno);
 	return ret;
 }

-static void do_remove_driverfs_files(void)
+static void do_remove_sysfs_files(void)
 {
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_vpd_use_hostno);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_virtual_gb);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_scsi_level);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_opts);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_ptype);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_num_tgts);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_num_parts);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_no_lun_0);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_max_luns);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_fake_rw);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_every_nth);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_dsense);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_dev_size_mb);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_delay);
-	driver_remove_file(&sdebug_driverfs_driver, &driver_attr_add_host);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_vpd_use_hostno);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_virtual_gb);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_scsi_level);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_opts);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_ptype);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_num_tgts);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_num_parts);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_no_lun_0);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_max_luns);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_fake_rw);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_every_nth);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_dsense);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_dev_size_mb);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_delay);
+	driver_remove_file(&sdebug_sysfs_driver, &driver_attr_add_host);
 }

 static int __init scsi_debug_init(void)
@@ -2837,13 +2837,13 @@ static int __init scsi_debug_init(void)
 			ret);
 		goto dev_unreg;
 	}
-	ret = driver_register(&sdebug_driverfs_driver);
+	ret = driver_register(&sdebug_sysfs_driver);
 	if (ret < 0) {
 		printk(KERN_WARNING "scsi_debug: driver_register error: %d\n",
 			ret);
 		goto bus_unreg;
 	}
-	ret = do_create_driverfs_files();
+	ret = do_create_sysfs_files();
 	if (ret < 0) {
 		printk(KERN_WARNING "scsi_debug: driver_create_file error: %d\n",
 			ret);
@@ -2872,8 +2872,8 @@ static int __init scsi_debug_init(void)
 	return 0;

 del_files:
-	do_remove_driverfs_files();
-	driver_unregister(&sdebug_driverfs_driver);
+	do_remove_sysfs_files();
+	driver_unregister(&sdebug_sysfs_driver);
 bus_unreg:
 	bus_unregister(&pseudo_lld_bus);
 dev_unreg:
@@ -2891,8 +2891,8 @@ static void __exit scsi_debug_exit(void)
 	stop_all_queued();
 	for (; k; k--)
 		sdebug_remove_adapter();
-	do_remove_driverfs_files();
-	driver_unregister(&sdebug_driverfs_driver);
+	do_remove_sysfs_files();
+	driver_unregister(&sdebug_sysfs_driver);
 	bus_unregister(&pseudo_lld_bus);
 	device_unregister(&pseudo_primary);

diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index 14e635a..fc58ee0 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -54,7 +54,7 @@
 #define SCSI_TIMEOUT (2*HZ)

 /*
- * Prefix values for the SCSI id's (stored in driverfs name field)
+ * Prefix values for the SCSI id's (stored in sysfs name field)
  */
 #define SCSI_UID_SER_NUM 'S'
 #define SCSI_UID_UNKNOWN 'Z'
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 978bfc1..ff8928d 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1693,7 +1693,7 @@ static int sd_probe(struct device *dev)

 	sd_revalidate_disk(gd);

-	gd->driverfs_dev = &sdp->sdev_gendev;
+	gd->sysfs_dev = &sdp->sdev_gendev;
 	gd->flags = GENHD_FL_DRIVERFS;
 	if (sdp->removable)
 		gd->flags |= GENHD_FL_REMOVABLE;
diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index fae6e95..fe59fef 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -591,7 +591,7 @@ static int sr_probe(struct device *dev)
 	get_capabilities(cd);
 	sr_vendor_init(cd);

-	disk->driverfs_dev = &sdev->sdev_gendev;
+	disk->sysfs_dev = &sdev->sdev_gendev;
 	set_capacity(disk, cd->capacity);
 	disk->private_data = &cd->driver;
 	disk->queue = sdev->request_queue;
diff --git a/drivers/scsi/st.c b/drivers/scsi/st.c
index e016e09..0b39e0c 100644
--- a/drivers/scsi/st.c
+++ b/drivers/scsi/st.c
@@ -195,8 +195,8 @@ static int sgl_unmap_user_pages(struct scatterlist *, const unsigned int, int);
 static int st_probe(struct device *);
 static int st_remove(struct device *);

-static int do_create_driverfs_files(void);
-static void do_remove_driverfs_files(void);
+static int do_create_sysfs_files(void);
+static void do_remove_sysfs_files(void);
 static int do_create_class_files(struct scsi_tape *, int, int);

 static struct scsi_driver st_template = {
@@ -4187,7 +4187,7 @@ static int __init init_st(void)
 	if (err)
 		goto err_chrdev;

-	err = do_create_driverfs_files();
+	err = do_create_sysfs_files();
 	if (err)
 		goto err_scsidrv;

@@ -4205,7 +4205,7 @@ err_class:

 static void __exit exit_st(void)
 {
-	do_remove_driverfs_files();
+	do_remove_sysfs_files();
 	scsi_unregister_driver(&st_template.gendrv);
 	unregister_chrdev_region(MKDEV(SCSI_TAPE_MAJOR, 0),
 				 ST_MAX_TAPE_ENTRIES);
@@ -4243,43 +4243,43 @@ static ssize_t st_version_show(struct device_driver *ddd, char *buf)
 }
 static DRIVER_ATTR(version, S_IRUGO, st_version_show, NULL);

-static int do_create_driverfs_files(void)
+static int do_create_sysfs_files(void)
 {
-	struct device_driver *driverfs = &st_template.gendrv;
+	struct device_driver *sysfs = &st_template.gendrv;
 	int err;

-	err = driver_create_file(driverfs, &driver_attr_try_direct_io);
+	err = driver_create_file(sysfs, &driver_attr_try_direct_io);
 	if (err)
 		return err;
-	err = driver_create_file(driverfs, &driver_attr_fixed_buffer_size);
+	err = driver_create_file(sysfs, &driver_attr_fixed_buffer_size);
 	if (err)
 		goto err_try_direct_io;
-	err = driver_create_file(driverfs, &driver_attr_max_sg_segs);
+	err = driver_create_file(sysfs, &driver_attr_max_sg_segs);
 	if (err)
 		goto err_attr_fixed_buf;
-	err = driver_create_file(driverfs, &driver_attr_version);
+	err = driver_create_file(sysfs, &driver_attr_version);
 	if (err)
 		goto err_attr_max_sg;

 	return 0;

 err_attr_max_sg:
-	driver_remove_file(driverfs, &driver_attr_max_sg_segs);
+	driver_remove_file(sysfs, &driver_attr_max_sg_segs);
 err_attr_fixed_buf:
-	driver_remove_file(driverfs, &driver_attr_fixed_buffer_size);
+	driver_remove_file(sysfs, &driver_attr_fixed_buffer_size);
 err_try_direct_io:
-	driver_remove_file(driverfs, &driver_attr_try_direct_io);
+	driver_remove_file(sysfs, &driver_attr_try_direct_io);
 	return err;
 }

-static void do_remove_driverfs_files(void)
+static void do_remove_sysfs_files(void)
 {
-	struct device_driver *driverfs = &st_template.gendrv;
+	struct device_driver *sysfs = &st_template.gendrv;

-	driver_remove_file(driverfs, &driver_attr_version);
-	driver_remove_file(driverfs, &driver_attr_max_sg_segs);
-	driver_remove_file(driverfs, &driver_attr_fixed_buffer_size);
-	driver_remove_file(driverfs, &driver_attr_try_direct_io);
+	driver_remove_file(sysfs, &driver_attr_version);
+	driver_remove_file(sysfs, &driver_attr_max_sg_segs);
+	driver_remove_file(sysfs, &driver_attr_fixed_buffer_size);
+	driver_remove_file(sysfs, &driver_attr_try_direct_io);
 }


diff --git a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
index 56349d2..9bada98 100644
--- a/drivers/usb/host/ehci-dbg.c
+++ b/drivers/usb/host/ehci-dbg.c
@@ -322,7 +322,7 @@ static inline void remove_debug_files (struct ehci_hcd *bus) { }

 #else

-/* troubleshooting help: expose state in driverfs */
+/* troubleshooting help: expose state in sysfs */

 #define speed_char(info1) ({ char tmp; \
 		switch (info1 & (3 << 12)) { \
diff --git a/fs/lockd/svc.c b/fs/lockd/svc.c
index 8ca1808..251e1aa 100644
--- a/fs/lockd/svc.c
+++ b/fs/lockd/svc.c
@@ -434,7 +434,7 @@ static ctl_table nlm_sysctl_root[] = {
 };

 /*
- * Module (and driverfs) parameters.
+ * Module (and sysfs) parameters.
  */

 #define param_set_min_max(name, type, which_strtol, min, max)		\
diff --git a/fs/partitions/check.c b/fs/partitions/check.c
index 3d73d94..7ba546b 100644
--- a/fs/partitions/check.c
+++ b/fs/partitions/check.c
@@ -416,7 +416,7 @@ static char *make_block_name(struct gendisk *disk)

 static int disk_sysfs_symlinks(struct gendisk *disk)
 {
-	struct device *target = get_device(disk->driverfs_dev);
+	struct device *target = get_device(disk->sysfs_dev);
 	int err;
 	char *disk_name = NULL;

@@ -598,15 +598,15 @@ void del_gendisk(struct gendisk *disk)
 		kobject_unregister(disk->holder_dir);
 	if (disk->slave_dir)
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
diff --git a/include/linux/device.h b/include/linux/device.h
index f44247f..7691989 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -101,7 +101,7 @@ extern int bus_unregister_notifier(struct bus_type *bus,
 #define BUS_NOTIFY_UNBIND_DRIVER	0x00000004 /* driver about to be
 						      unbound */

-/* driverfs interface for exporting bus attributes */
+/* sysfs interface for exporting bus attributes */

 struct bus_attribute {
 	struct attribute	attr;
@@ -145,7 +145,7 @@ extern void put_driver(struct device_driver * drv);
 extern struct device_driver *driver_find(const char *name, struct bus_type *bus);
 extern int driver_probe_done(void);

-/* driverfs interface for exporting driver attributes */
+/* sysfs interface for exporting driver attributes */

 struct driver_attribute {
 	struct attribute	attr;
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 0a022b2..0778242 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -118,7 +118,7 @@ struct gendisk {
 	sector_t capacity;

 	int flags;
-	struct device *driverfs_dev;
+	struct device *sysfs_dev;
 	struct kobject kobj;
 	struct kobject *holder_dir;
 	struct kobject *slave_dir;
diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 4a189da..bb151bc 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -59,7 +59,7 @@ struct kparam_array
 };

 /* This is the fundamental function for registering boot/module
-   parameters.  perm sets the visibility in driverfs: 000 means it's
+   parameters.  perm sets the visibility in sysfs: 000 means it's
    not there, read bits mean it's readable, write bits mean it's
    writable. */
 #define __module_param_call(prefix, name, set, get, arg, perm)		\
diff --git a/include/linux/node.h b/include/linux/node.h
index bc001bc..13e425b 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -8,7 +8,7 @@
  * Basic handling of the devices is done in drivers/base/node.c
  * and system devices are handled in drivers/base/sys.c.
  *
- * Nodes are exported via driverfs in the class/node/devices/
+ * Nodes are exported via sysfs in the class/node/devices/
  * directory.
  *
  * Per-node interfaces can be implemented using a struct device_interface.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
