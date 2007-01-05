From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 05 Jan 2007 05:45:17 +0000
Subject: [KJ] [PATCH] Replace remaining references to "driverfs" with
Message-Id: <Pine.LNX.4.64.0701050038010.20767@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  Globally, s/driverfs/sysfs/g.

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  Given that driverfs is long dead, might as well just mindlessly
replace all references to it.  The result still appears to build
properly.  The majority of changes are just in comments, anyway.


 Documentation/pnp.txt            |    4 +--
 Documentation/s390/cds.txt       |    2 -
 arch/i386/kernel/time.c          |    2 -
 arch/i386/kernel/topology.c      |    2 -
 arch/i386/oprofile/nmi_int.c     |   14 +++++-----
 arch/parisc/kernel/topology.c    |    2 -
 arch/x86_64/kernel/time.c        |    2 -
 drivers/base/cpu.c               |    2 -
 drivers/base/node.c              |    2 -
 drivers/i2c/busses/i2c-ali1535.c |    2 -
 drivers/i2c/busses/i2c-ali15x3.c |    2 -
 drivers/i2c/busses/i2c-amd756.c  |    2 -
 drivers/i2c/busses/i2c-amd8111.c |    2 -
 drivers/i2c/busses/i2c-i801.c    |    2 -
 drivers/i2c/busses/i2c-piix4.c   |    2 -
 drivers/i2c/busses/i2c-sis5595.c |    2 -
 drivers/i2c/busses/i2c-sis630.c  |    2 -
 drivers/i2c/busses/i2c-sis96x.c  |    2 -
 drivers/i2c/busses/i2c-via.c     |    2 -
 drivers/pci/pci-sysfs.c          |    2 -
 drivers/scsi/osst.c              |   12 ++++-----
 drivers/scsi/scsi_scan.c         |    2 -
 drivers/scsi/st.c                |   38 ++++++++++++++---------------
 drivers/usb/host/ehci-dbg.c      |    2 -
 fs/lockd/svc.c                   |    2 -
 include/linux/device.h           |    4 +--
 include/linux/moduleparam.h      |    2 -
 include/linux/node.h             |    2 -
 28 files changed, 59 insertions(+), 59 deletions(-)

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
