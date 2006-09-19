From: Amol Lad <amol@verismonetworks.com>
Date: Tue, 19 Sep 2006 10:09:22 +0000
Subject: [KJ] [PATCH 3/6] create_proc_entry error handling: drivers
Message-Id: <1158659842.28299.77.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Added appropriate KERN_ERR/KERN_WARNING messages whenever
create_proc_entry fails.

Tested using allmodconfig configuration and also by changing
Makefiles/Kconfig to make sure all files are compiled

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
 macintosh/via-pmu.c          |    3 -
 md/md.c                      |    2
 media/dvb/ttpci/av7110_ir.c  |    3 -
 media/video/cpia.c           |    4 +
 media/video/usbvideo/vicam.c |    6 +-
 message/fusion/mptbase.c     |   11 +++
 message/i2o/i2o_proc.c       |    4 +
 misc/hdpuftrs/hdpu_nexus.c   |   15 +++--
 mtd/mtdcore.c                |    3 +
 net/pppoe.c                  |    4 +
 net/wireless/airo.c          |  120 ++++++++++++++++++++++++++-----------------
 net/wireless/ray_cs.c        |    3 -
 nubus/proc.c                 |    5 +
 parisc/ccio-dma.c            |    4 +
 parisc/led.c                 |   10 ++-
 parisc/sba_iommu.c           |    4 +
 pci/proc.c                   |    7 ++
 pnp/isapnp/proc.c            |    4 +
 pnp/pnpbios/proc.c           |    6 +-
 rtc/rtc-proc.c               |    4 +
 s390/block/dasd_proc.c       |    8 ++
 s390/cio/blacklist.c         |    4 +
 s390/net/qeth_proc.c         |    4 +
 scsi/scsi_devinfo.c          |    1
 scsi/scsi_proc.c             |    4 +
 scsi/sg.c                    |    3 -
 usb/gadget/at91_udc.c        |    4 +
 usb/gadget/omap_udc.c        |    2
 usb/host/sl811-hcd.c         |    4 +
 zorro/proc.c                 |    4 +
 30 files changed, 185 insertions(+), 75 deletions(-)
---
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/md/md.c linux-2.6.18-rc7/drivers/md/md.c
--- linux-2.6.18-rc7-orig/drivers/md/md.c	2006-09-15 15:28:39.000000000 +0530
+++ linux-2.6.18-rc7/drivers/md/md.c	2006-09-18 15:13:15.000000000 +0530
@@ -5552,6 +5552,8 @@ static void md_geninit(void)
 	p = create_proc_entry("mdstat", S_IRUGO, NULL);
 	if (p)
 		p->proc_fops = &md_seq_fops;
+	else
+		printk(KERN_WARNING "Unable to create 'mdstat' proc entry.\n");
 }
 
 static int __init md_init(void)
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/message/fusion/mptbase.c linux-2.6.18-rc7/drivers/message/fusion/mptbase.c
--- linux-2.6.18-rc7-orig/drivers/message/fusion/mptbase.c	2006-09-15 15:28:40.000000000 +0530
+++ linux-2.6.18-rc7/drivers/message/fusion/mptbase.c	2006-09-18 15:27:51.000000000 +0530
@@ -1405,12 +1405,15 @@ mpt_attach(struct pci_dev *pdev, const s
 		if (ent) {
 			ent->read_proc = procmpt_iocinfo_read;
 			ent->data = ioc;
-		}
+		} else
+			printk(KERN_WARNING "Unable to create 'info' proc entry.\n");
+		
 		ent = create_proc_entry("summary", S_IFREG|S_IRUGO, dent);
 		if (ent) {
 			ent->read_proc = procmpt_summary_read;
 			ent->data = ioc;
-		}
+		} else
+			printk(KERN_WARNING "Unable to create 'summary' proc entry.\n");
 	}
 #endif
 
@@ -5289,10 +5292,14 @@ procmpt_create(void)
 	ent = create_proc_entry("summary", S_IFREG|S_IRUGO, mpt_proc_root_dir);
 	if (ent)
 		ent->read_proc = procmpt_summary_read;
+	else
+		printk(KERN_WARNING "Unable to create 'summary' proc entry.\n");
 
 	ent = create_proc_entry("version", S_IFREG|S_IRUGO, mpt_proc_root_dir);
 	if (ent)
 		ent->read_proc = procmpt_version_read;
+	else
+		printk(KERN_WARNING "Unable to create 'version' proc entry.\n");
 
 	return 0;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/message/i2o/i2o_proc.c linux-2.6.18-rc7/drivers/message/i2o/i2o_proc.c
--- linux-2.6.18-rc7-orig/drivers/message/i2o/i2o_proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/message/i2o/i2o_proc.c	2006-09-18 15:29:10.000000000 +0530
@@ -1894,8 +1894,10 @@ static int i2o_proc_create_entries(struc
 
 	while (i2o_pe->name) {
 		tmp = create_proc_entry(i2o_pe->name, i2o_pe->mode, dir);
-		if (!tmp)
+		if (!tmp) {
+			printk(KERN_ERR "Unable to create '%s' proc entry.\n", i2o_pe->name);
 			return -1;
+		}
 
 		tmp->data = data;
 		tmp->proc_fops = i2o_pe->fops;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/mtd/mtdcore.c linux-2.6.18-rc7/drivers/mtd/mtdcore.c
--- linux-2.6.18-rc7-orig/drivers/mtd/mtdcore.c	2006-09-15 15:28:40.000000000 +0530
+++ linux-2.6.18-rc7/drivers/mtd/mtdcore.c	2006-09-18 15:32:46.000000000 +0530
@@ -318,6 +318,9 @@ static int __init init_mtd(void)
 {
 	if ((proc_mtd = create_proc_entry( "mtd", 0, NULL )))
 		proc_mtd->read_proc = mtd_read_proc;
+	else
+		printk(KERN_WARNING "Unable to create 'mtd' proc entry.\n");
+
 	return 0;
 }
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/nubus/proc.c linux-2.6.18-rc7/drivers/nubus/proc.c
--- linux-2.6.18-rc7-orig/drivers/nubus/proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/nubus/proc.c	2006-09-18 15:48:24.000000000 +0530
@@ -74,7 +74,10 @@ static void nubus_proc_subdir(struct nub
 		sprintf(name, "%x", ent.type);
 		e = create_proc_entry(name, S_IFREG | S_IRUGO |
 				      S_IWUSR, parent);
-		if (!e) return;
+		if (!e) {
+			printk(KERN_ERR "Unable to create '%s' proc entry.\n", name);
+			return;
+		}
 	}
 }
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/pci/proc.c linux-2.6.18-rc7/drivers/pci/proc.c
--- linux-2.6.18-rc7-orig/drivers/pci/proc.c	2006-09-15 15:28:43.000000000 +0530
+++ linux-2.6.18-rc7/drivers/pci/proc.c	2006-09-18 15:53:46.000000000 +0530
@@ -402,8 +402,10 @@ int pci_proc_attach_device(struct pci_de
 
 	sprintf(name, "%02x.%x", PCI_SLOT(dev->devfn), PCI_FUNC(dev->devfn));
 	e = create_proc_entry(name, S_IFREG | S_IRUGO | S_IWUSR, bus->procdir);
-	if (!e)
+	if (!e) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", name);
 		return -ENOMEM;
+	}
 	e->proc_fops = &proc_bus_pci_operations;
 	e->data = dev;
 	e->size = dev->cfg_size;
@@ -471,6 +473,9 @@ static int __init pci_proc_init(void)
 	entry = create_proc_entry("devices", 0, proc_bus_pci_dir);
 	if (entry)
 		entry->proc_fops = &proc_bus_pci_dev_operations;
+	else
+		printk(KERN_WARNING "Unable to create 'devices' proc entry.\n");
+	
 	proc_initialized = 1;
 	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		pci_proc_attach_device(dev);
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/rtc/rtc-proc.c linux-2.6.18-rc7/drivers/rtc/rtc-proc.c
--- linux-2.6.18-rc7-orig/drivers/rtc/rtc-proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/rtc/rtc-proc.c	2006-09-18 15:58:34.000000000 +0530
@@ -122,8 +122,10 @@ static int rtc_proc_add_device(struct cl
 
 			dev_info(class_dev->dev, "rtc intf: proc\n");
 		}
-		else
+		else {
+			printk(KERN_WARNING "Unable to create 'driver/rtc' proc entry.\n");
 			rtc_dev = NULL;
+		}
 	}
 	mutex_unlock(&rtc_lock);
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/scsi/scsi_devinfo.c linux-2.6.18-rc7/drivers/scsi/scsi_devinfo.c
--- linux-2.6.18-rc7-orig/drivers/scsi/scsi_devinfo.c	2006-09-15 15:28:45.000000000 +0530
+++ linux-2.6.18-rc7/drivers/scsi/scsi_devinfo.c	2006-09-18 16:04:24.000000000 +0530
@@ -561,6 +561,7 @@ int __init scsi_init_devinfo(void)
 #ifdef CONFIG_SCSI_PROC_FS
 	p = create_proc_entry("scsi/device_info", 0, NULL);
 	if (!p) {
+		printk(KERN_ERR "Unable to create 'scsi/device_info' proc entry.\n");
 		error = -ENOMEM;
 		goto out;
 	}
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/scsi/scsi_proc.c linux-2.6.18-rc7/drivers/scsi/scsi_proc.c
--- linux-2.6.18-rc7-orig/drivers/scsi/scsi_proc.c	2006-09-15 15:28:45.000000000 +0530
+++ linux-2.6.18-rc7/drivers/scsi/scsi_proc.c	2006-09-18 16:05:03.000000000 +0530
@@ -327,8 +327,10 @@ int __init scsi_init_procfs(void)
 		goto err1;
 
 	pde = create_proc_entry("scsi/scsi", 0, NULL);
-	if (!pde)
+	if (!pde) {
+		printk(KERN_ERR "Unable to create 'scsi/scsi' proc entry.\n");
 		goto err2;
+	}
 	pde->proc_fops = &proc_scsi_operations;
 
 	return 0;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/scsi/sg.c linux-2.6.18-rc7/drivers/scsi/sg.c
--- linux-2.6.18-rc7-orig/drivers/scsi/sg.c	2006-09-15 15:28:45.000000000 +0530
+++ linux-2.6.18-rc7/drivers/scsi/sg.c	2006-09-18 16:05:43.000000000 +0530
@@ -2658,7 +2658,8 @@ sg_proc_init(void)
 			leaf->fops->read = seq_read,
 			leaf->fops->llseek = seq_lseek,
 			pdep->proc_fops = leaf->fops;
-		}
+		} else
+			printk(KERN_WARNING "Unable to create '%s' proc entry.\n", leaf->name);
 	}
 	return 0;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/zorro/proc.c linux-2.6.18-rc7/drivers/zorro/proc.c
--- linux-2.6.18-rc7-orig/drivers/zorro/proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/zorro/proc.c	2006-09-18 16:10:04.000000000 +0530
@@ -114,8 +114,10 @@ static int __init zorro_proc_attach_devi
 
 	sprintf(name, "%02x", slot);
 	entry = create_proc_entry(name, 0, proc_bus_zorro_dir);
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", name);
 		return -ENOMEM;
+	}
 	entry->proc_fops = &proc_bus_zorro_operations;
 	entry->data = &zorro_autocon[slot];
 	entry->size = sizeof(struct zorro_dev);
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/macintosh/via-pmu.c linux-2.6.18-rc7/drivers/macintosh/via-pmu.c
--- linux-2.6.18-rc7-orig/drivers/macintosh/via-pmu.c	2006-09-15 15:28:39.000000000 +0530
+++ linux-2.6.18-rc7/drivers/macintosh/via-pmu.c	2006-09-18 15:12:34.000000000 +0530
@@ -513,7 +513,8 @@ static int __init via_pmu_dev_init(void)
 			proc_pmu_options->nlink = 1;
 			proc_pmu_options->read_proc = proc_read_options;
 			proc_pmu_options->write_proc = proc_write_options;
-		}
+		} else
+			printk(KERN_WARNING "Unable to create 'options' proc entry.\n");
 	}
 	return 0;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/media/dvb/ttpci/av7110_ir.c linux-2.6.18-rc7/drivers/media/dvb/ttpci/av7110_ir.c
--- linux-2.6.18-rc7-orig/drivers/media/dvb/ttpci/av7110_ir.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/media/dvb/ttpci/av7110_ir.c	2006-09-18 15:14:01.000000000 +0530
@@ -238,7 +238,8 @@ int __devinit av7110_ir_init(struct av71
 		if (e) {
 			e->write_proc = av7110_ir_write_proc;
 			e->size = 4 + 256 * sizeof(u16);
-		}
+		} else
+			printk(KERN_WARNING "Unable to create 'av7110_ir' proc entry.\n");
 	}
 
 	tasklet_init(&av7110->ir_tasklet, av7110_emit_key, (unsigned long) av7110);
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/media/video/cpia.c linux-2.6.18-rc7/drivers/media/video/cpia.c
--- linux-2.6.18-rc7-orig/drivers/media/video/cpia.c	2006-09-15 15:28:39.000000000 +0530
+++ linux-2.6.18-rc7/drivers/media/video/cpia.c	2006-09-18 15:14:36.000000000 +0530
@@ -1359,8 +1359,10 @@ static void create_proc_cpia_cam(struct 
 	sprintf(name, "video%d", cam->vdev.minor);
 
 	ent = create_proc_entry(name, S_IFREG|S_IRUGO|S_IWUSR, cpia_proc_root);
-	if (!ent)
+	if (!ent) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", name);
 		return;
+	}
 
 	ent->data = cam;
 	ent->read_proc = cpia_read_proc;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/media/video/usbvideo/vicam.c linux-2.6.18-rc7/drivers/media/video/usbvideo/vicam.c
--- linux-2.6.18-rc7-orig/drivers/media/video/usbvideo/vicam.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/media/video/usbvideo/vicam.c	2006-09-18 15:15:51.000000000 +0530
@@ -1195,7 +1195,8 @@ vicam_create_proc_entry(struct vicam_cam
 		ent->read_proc = vicam_read_proc_shutter;
 		ent->write_proc = vicam_write_proc_shutter;
 		ent->size = 64;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create 'shutter' proc entry.\n");
 
 	ent = create_proc_entry("gain", S_IFREG | S_IRUGO | S_IWUSR,
 				cam->proc_dir);
@@ -1204,7 +1205,8 @@ vicam_create_proc_entry(struct vicam_cam
 		ent->read_proc = vicam_read_proc_gain;
 		ent->write_proc = vicam_write_proc_gain;
 		ent->size = 64;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create 'gain' proc entry.\n");
 }
 
 static void
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/misc/hdpuftrs/hdpu_nexus.c linux-2.6.18-rc7/drivers/misc/hdpuftrs/hdpu_nexus.c
--- linux-2.6.18-rc7-orig/drivers/misc/hdpuftrs/hdpu_nexus.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/misc/hdpuftrs/hdpu_nexus.c	2006-09-18 15:31:39.000000000 +0530
@@ -71,12 +71,19 @@ static int hdpu_nexus_probe(struct platf
 	} else
 		printk("Could not map slot id\n");
 	hdpu_slot_id = create_proc_entry("sky_slot_id", 0666, &proc_root);
-	hdpu_slot_id->read_proc = hdpu_slot_id_read;
-	hdpu_slot_id->nlink = 1;
+	if (hdpu_slot_id) {
+		hdpu_slot_id->read_proc = hdpu_slot_id_read;
+		hdpu_slot_id->nlink = 1;
+	} else
+		printk(KERN_WARNING "Unable to create 'sky_slot_id' proc entry.\n");
 
 	hdpu_chassis_id = create_proc_entry("sky_chassis_id", 0666, &proc_root);
-	hdpu_chassis_id->read_proc = hdpu_chassis_id_read;
-	hdpu_chassis_id->nlink = 1;
+	if (hdpu_chassis_id) {
+		hdpu_chassis_id->read_proc = hdpu_chassis_id_read;
+		hdpu_chassis_id->nlink = 1;
+	} else
+		printk(KERN_WARNING "Unable to create 'sky_chassis_id' proc entry.\n");
+
 	return 0;
 }
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/net/pppoe.c linux-2.6.18-rc7/drivers/net/pppoe.c
--- linux-2.6.18-rc7-orig/drivers/net/pppoe.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/net/pppoe.c	2006-09-18 15:34:30.000000000 +0530
@@ -1055,8 +1055,10 @@ static int __init pppoe_proc_init(void)
 	struct proc_dir_entry *p;
 
 	p = create_proc_entry("net/pppoe", S_IRUGO, NULL);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'net/pppoe' proc entry.\n");
 		return -ENOMEM;
+	}
 
 	p->proc_fops = &pppoe_seq_fops;
 	return 0;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/net/wireless/airo.c linux-2.6.18-rc7/drivers/net/wireless/airo.c
--- linux-2.6.18-rc7-orig/drivers/net/wireless/airo.c	2006-09-15 15:28:42.000000000 +0530
+++ linux-2.6.18-rc7/drivers/net/wireless/airo.c	2006-09-19 11:59:44.000000000 +0530
@@ -4504,89 +4504,116 @@ static int setup_proc_entry( struct net_
 	apriv->proc_entry = create_proc_entry(apriv->proc_name,
 					      S_IFDIR|airo_perm,
 					      airo_entry);
-        apriv->proc_entry->uid = proc_uid;
-        apriv->proc_entry->gid = proc_gid;
-        apriv->proc_entry->owner = THIS_MODULE;
+	if (apriv->proc_entry) {
+		apriv->proc_entry->uid = proc_uid;
+		apriv->proc_entry->gid = proc_gid;
+		apriv->proc_entry->owner = THIS_MODULE;
+	} else
+		airo_print_warn("","Unable to create '%s' proc entry.\n", apriv->proc_name);
 
 	/* Setup the StatsDelta */
 	entry = create_proc_entry("StatsDelta",
 				  S_IFREG | (S_IRUGO&proc_perm),
 				  apriv->proc_entry);
-        entry->uid = proc_uid;
-        entry->gid = proc_gid;
-	entry->data = dev;
-        entry->owner = THIS_MODULE;
-	SETPROC_OPS(entry, proc_statsdelta_ops);
+	if (entry) {
+		entry->uid = proc_uid;
+		entry->gid = proc_gid;
+		entry->data = dev;
+		entry->owner = THIS_MODULE;
+		SETPROC_OPS(entry, proc_statsdelta_ops);
+	} else
+		airo_print_warn("","Unable to create 'StatsDelta' proc entry.\n");
 
 	/* Setup the Stats */
 	entry = create_proc_entry("Stats",
 				  S_IFREG | (S_IRUGO&proc_perm),
 				  apriv->proc_entry);
-        entry->uid = proc_uid;
-        entry->gid = proc_gid;
-	entry->data = dev;
-        entry->owner = THIS_MODULE;
-	SETPROC_OPS(entry, proc_stats_ops);
+	if (entry) {
+		entry->uid = proc_uid;
+		entry->gid = proc_gid;
+		entry->data = dev;
+		entry->owner = THIS_MODULE;
+		SETPROC_OPS(entry, proc_stats_ops);
+	} else
+		airo_print_warn("","Unable to create 'Stats' proc entry.\n");
 
 	/* Setup the Status */
 	entry = create_proc_entry("Status",
 				  S_IFREG | (S_IRUGO&proc_perm),
 				  apriv->proc_entry);
-        entry->uid = proc_uid;
-        entry->gid = proc_gid;
-	entry->data = dev;
-        entry->owner = THIS_MODULE;
-	SETPROC_OPS(entry, proc_status_ops);
+	if (entry) {
+		entry->uid = proc_uid;
+		entry->gid = proc_gid;
+		entry->data = dev;
+		entry->owner = THIS_MODULE;
+		SETPROC_OPS(entry, proc_status_ops);
+	} else
+		airo_print_warn("","Unable to create 'Status' proc entry.\n");
 
 	/* Setup the Config */
 	entry = create_proc_entry("Config",
 				  S_IFREG | proc_perm,
 				  apriv->proc_entry);
-        entry->uid = proc_uid;
-        entry->gid = proc_gid;
-	entry->data = dev;
-        entry->owner = THIS_MODULE;
-	SETPROC_OPS(entry, proc_config_ops);
+	if (entry) {
+		entry->uid = proc_uid;
+		entry->gid = proc_gid;
+		entry->data = dev;
+		entry->owner = THIS_MODULE;
+		SETPROC_OPS(entry, proc_config_ops);
+	} else
+		airo_print_warn("","Unable to create 'Config' proc entry.\n");
 
 	/* Setup the SSID */
 	entry = create_proc_entry("SSID",
 				  S_IFREG | proc_perm,
 				  apriv->proc_entry);
-        entry->uid = proc_uid;
-        entry->gid = proc_gid;
-	entry->data = dev;
-        entry->owner = THIS_MODULE;
-	SETPROC_OPS(entry, proc_SSID_ops);
+	if (entry) {
+		entry->uid = proc_uid;
+		entry->gid = proc_gid;
+		entry->data = dev;
+		entry->owner = THIS_MODULE;
+		SETPROC_OPS(entry, proc_SSID_ops);
+	} else
+		airo_print_warn("","Unable to create 'SSID' proc entry.\n");
 
 	/* Setup the APList */
 	entry = create_proc_entry("APList",
 				  S_IFREG | proc_perm,
 				  apriv->proc_entry);
-        entry->uid = proc_uid;
-        entry->gid = proc_gid;
-	entry->data = dev;
-        entry->owner = THIS_MODULE;
-	SETPROC_OPS(entry, proc_APList_ops);
+	if (entry) {
+		entry->uid = proc_uid;
+		entry->gid = proc_gid;
+		entry->data = dev;
+		entry->owner = THIS_MODULE;
+		SETPROC_OPS(entry, proc_APList_ops);
+	} else
+		airo_print_warn("","Unable to create 'APList' proc entry.\n");
 
 	/* Setup the BSSList */
 	entry = create_proc_entry("BSSList",
 				  S_IFREG | proc_perm,
 				  apriv->proc_entry);
-	entry->uid = proc_uid;
-	entry->gid = proc_gid;
-	entry->data = dev;
-        entry->owner = THIS_MODULE;
-	SETPROC_OPS(entry, proc_BSSList_ops);
+	if (entry) {
+		entry->uid = proc_uid;
+		entry->gid = proc_gid;
+		entry->data = dev;
+		entry->owner = THIS_MODULE;
+		SETPROC_OPS(entry, proc_BSSList_ops);
+	} else
+		airo_print_warn("","Unable to create 'BSSList' proc entry.\n");
 
 	/* Setup the WepKey */
 	entry = create_proc_entry("WepKey",
 				  S_IFREG | proc_perm,
 				  apriv->proc_entry);
-        entry->uid = proc_uid;
-        entry->gid = proc_gid;
-	entry->data = dev;
-        entry->owner = THIS_MODULE;
-	SETPROC_OPS(entry, proc_wepkey_ops);
+	if (entry) {
+		entry->uid = proc_uid;
+		entry->gid = proc_gid;
+		entry->data = dev;
+		entry->owner = THIS_MODULE;
+		SETPROC_OPS(entry, proc_wepkey_ops);
+	} else
+		airo_print_warn("","Unable to create 'WepKey' proc entry.\n");
 
 	return 0;
 }
@@ -5672,8 +5699,11 @@ static int __init airo_init_module( void
 	airo_entry = create_proc_entry("aironet",
 				       S_IFDIR | airo_perm,
 				       proc_root_driver);
-        airo_entry->uid = proc_uid;
-        airo_entry->gid = proc_gid;
+	if (airo_entry) {
+		airo_entry->uid = proc_uid;
+		airo_entry->gid = proc_gid;
+	} else
+		airo_print_warn("","Unable to create 'aironet' proc entry.\n");
 
 	for( i = 0; i < 4 && io[i] && irq[i]; i++ ) {
 		airo_print_info("", "Trying to configure ISA adapter at irq=%d "
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/net/wireless/ray_cs.c linux-2.6.18-rc7/drivers/net/wireless/ray_cs.c
--- linux-2.6.18-rc7-orig/drivers/net/wireless/ray_cs.c	2006-09-15 15:28:43.000000000 +0530
+++ linux-2.6.18-rc7/drivers/net/wireless/ray_cs.c	2006-09-18 15:45:12.000000000 +0530
@@ -2780,7 +2780,8 @@ static void raycs_write(const char *name
 	if (entry) {
 		entry->write_proc = w;
 		entry->data = data;
-	}
+	} else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", name);
 }
 
 static int write_essid(struct file *file, const char __user *buffer, unsigned long count, void *data)
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/parisc/ccio-dma.c linux-2.6.18-rc7/drivers/parisc/ccio-dma.c
--- linux-2.6.18-rc7-orig/drivers/parisc/ccio-dma.c	2006-09-15 15:28:43.000000000 +0530
+++ linux-2.6.18-rc7/drivers/parisc/ccio-dma.c	2006-09-18 15:49:42.000000000 +0530
@@ -1573,10 +1573,14 @@ static int ccio_probe(struct parisc_devi
 		info_entry = create_proc_entry(MODULE_NAME, 0, proc_runway_root);
 		if (info_entry)
 			info_entry->proc_fops = &ccio_proc_info_fops;
+		else
+			printk(KERN_WARNING "Unable to create '%s' proc entry.\n", MODULE_NAME);
 
 		bitmap_entry = create_proc_entry(MODULE_NAME"-bitmap", 0, proc_runway_root);
 		if (bitmap_entry)
 			bitmap_entry->proc_fops = &ccio_proc_bitmap_fops;
+		else
+			printk(KERN_WARNING "Unable to create '%s' proc entry.\n", MODULE_NAME);
 	}
 
 	ioc_count++;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/parisc/led.c linux-2.6.18-rc7/drivers/parisc/led.c
--- linux-2.6.18-rc7-orig/drivers/parisc/led.c	2006-09-15 15:28:43.000000000 +0530
+++ linux-2.6.18-rc7/drivers/parisc/led.c	2006-09-18 15:50:53.000000000 +0530
@@ -251,7 +251,10 @@ static int __init led_create_procfs(void
 	if (!proc_pdc_root) return -1;
 	proc_pdc_root->owner = THIS_MODULE;
 	ent = create_proc_entry("led", S_IFREG|S_IRUGO|S_IWUSR, proc_pdc_root);
-	if (!ent) return -1;
+	if (!ent) {
+		printk(KERN_ERR "Unable to create 'led' proc entry.\n");
+		return -1;
+	}
 	ent->nlink = 1;
 	ent->data = (void *)LED_NOLCD; /* LED */
 	ent->read_proc = led_proc_read;
@@ -261,7 +264,10 @@ static int __init led_create_procfs(void
 	if (led_type = LED_HASLCD)
 	{
 		ent = create_proc_entry("lcd", S_IFREG|S_IRUGO|S_IWUSR, proc_pdc_root);
-		if (!ent) return -1;
+		if (!ent) {
+			printk(KERN_ERR "Unable to create 'lcd' proc entry.\n");
+			return -1;
+		}
 		ent->nlink = 1;
 		ent->data = (void *)LED_HASLCD; /* LCD */
 		ent->read_proc = led_proc_read;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/parisc/sba_iommu.c linux-2.6.18-rc7/drivers/parisc/sba_iommu.c
--- linux-2.6.18-rc7-orig/drivers/parisc/sba_iommu.c	2006-09-15 15:28:43.000000000 +0530
+++ linux-2.6.18-rc7/drivers/parisc/sba_iommu.c	2006-09-18 15:51:53.000000000 +0530
@@ -2144,9 +2144,13 @@ sba_driver_callback(struct parisc_device
 
 	if (info_entry)
 		info_entry->proc_fops = &sba_proc_fops;
+	else
+		printk(KERN_WARNING "Unable to create 'sba_iommu' proc entry.\n");
 
 	if (bitmap_entry)
 		bitmap_entry->proc_fops = &sba_proc_bitmap_fops;
+	else
+		printk(KERN_WARNING "Unable to create 'sba_iommu-bitmap' proc entry.\n");
 #endif
 
 	parisc_vmerge_boundary = IOVP_SIZE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/pnp/isapnp/proc.c linux-2.6.18-rc7/drivers/pnp/isapnp/proc.c
--- linux-2.6.18-rc7-orig/drivers/pnp/isapnp/proc.c	2006-09-15 15:28:43.000000000 +0530
+++ linux-2.6.18-rc7/drivers/pnp/isapnp/proc.c	2006-09-18 15:55:32.000000000 +0530
@@ -105,8 +105,10 @@ static int isapnp_proc_attach_device(str
 	}
 	sprintf(name, "%02x", dev->number);
 	e = dev->procent = create_proc_entry(name, S_IFREG | S_IRUGO, de);
-	if (!e)
+	if (!e) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", name);
 		return -ENOMEM;
+	}
 	e->proc_fops = &isapnp_proc_bus_file_operations;
 	e->owner = THIS_MODULE;
 	e->data = dev;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/pnp/pnpbios/proc.c linux-2.6.18-rc7/drivers/pnp/pnpbios/proc.c
--- linux-2.6.18-rc7-orig/drivers/pnp/pnpbios/proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/pnp/pnpbios/proc.c	2006-09-18 15:57:36.000000000 +0530
@@ -228,7 +228,8 @@ int pnpbios_interface_attach_device(stru
 			ent->read_proc = proc_read_node;
 			ent->write_proc = proc_write_node;
 			ent->data = (void *)(long)(node->handle);
-		}
+		} else
+			printk(KERN_WARNING "Unable to create '%s' proc entry.\n", name);
 	}
 
 	if (!proc_pnp_boot)
@@ -239,7 +240,8 @@ int pnpbios_interface_attach_device(stru
 		ent->write_proc = proc_write_node;
 		ent->data = (void *)(long)(node->handle+0x100);
 		return 0;
-	}
+	} else
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", name);
 
 	return -EIO;
 }
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/s390/block/dasd_proc.c linux-2.6.18-rc7/drivers/s390/block/dasd_proc.c
--- linux-2.6.18-rc7-orig/drivers/s390/block/dasd_proc.c	2006-09-15 15:28:43.000000000 +0530
+++ linux-2.6.18-rc7/drivers/s390/block/dasd_proc.c	2006-09-18 15:59:46.000000000 +0530
@@ -307,15 +307,19 @@ dasd_proc_init(void)
 	dasd_devices_entry = create_proc_entry("devices",
 					       S_IFREG | S_IRUGO | S_IWUSR,
 					       dasd_proc_root_entry);
-	if (!dasd_devices_entry)
+	if (!dasd_devices_entry) {
+		printk(KERN_ERR "Unable to create 'devices' proc entry.\n");
 		goto out_nodevices;
+	}
 	dasd_devices_entry->proc_fops = &dasd_devices_file_ops;
 	dasd_devices_entry->owner = THIS_MODULE;
 	dasd_statistics_entry = create_proc_entry("statistics",
 						  S_IFREG | S_IRUGO | S_IWUSR,
 						  dasd_proc_root_entry);
-	if (!dasd_statistics_entry)
+	if (!dasd_statistics_entry) {
+		printk(KERN_ERR "Unable to create 'statistics' proc entry.\n");
 		goto out_nostatistics;
+	}
 	dasd_statistics_entry->read_proc = dasd_statistics_read;
 	dasd_statistics_entry->write_proc = dasd_statistics_write;
 	dasd_statistics_entry->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/s390/cio/blacklist.c linux-2.6.18-rc7/drivers/s390/cio/blacklist.c
--- linux-2.6.18-rc7-orig/drivers/s390/cio/blacklist.c	2006-09-15 15:28:43.000000000 +0530
+++ linux-2.6.18-rc7/drivers/s390/cio/blacklist.c	2006-09-18 16:00:46.000000000 +0530
@@ -379,8 +379,10 @@ cio_ignore_proc_init (void)
 
 	entry = create_proc_entry ("cio_ignore", S_IFREG | S_IRUGO | S_IWUSR,
 				   &proc_root);
-	if (!entry)
+	if (!entry) {
+		printk(KERN_ERR "Unable to create 'cio_ignore' proc entry.\n");
 		return -ENOENT;
+	}
 
 	entry->proc_fops = &cio_ignore_proc_fops;
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/s390/net/qeth_proc.c linux-2.6.18-rc7/drivers/s390/net/qeth_proc.c
--- linux-2.6.18-rc7-orig/drivers/s390/net/qeth_proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/drivers/s390/net/qeth_proc.c	2006-09-19 12:48:34.000000000 +0530
@@ -287,12 +287,16 @@ qeth_create_procfs_entries(void)
 					   S_IFREG | 0444, NULL);
 	if (qeth_procfile)
 		qeth_procfile->proc_fops = &qeth_procfile_fops;
+	else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", QETH_PROCFILE_NAME);
 
 #ifdef CONFIG_QETH_PERF_STATS
 	qeth_perf_procfile = create_proc_entry(QETH_PERF_PROCFILE_NAME,
 					   S_IFREG | 0444, NULL);
 	if (qeth_perf_procfile)
 		qeth_perf_procfile->proc_fops = &qeth_perf_procfile_fops;
+	else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", QETH_PERF_PROCFILE_NAME);
 #endif /* CONFIG_QETH_PERF_STATS */
 
 	if (qeth_procfile &&
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/usb/gadget/at91_udc.c linux-2.6.18-rc7/drivers/usb/gadget/at91_udc.c
--- linux-2.6.18-rc7-orig/drivers/usb/gadget/at91_udc.c	2006-09-15 15:28:45.000000000 +0530
+++ linux-2.6.18-rc7/drivers/usb/gadget/at91_udc.c	2006-09-18 16:06:27.000000000 +0530
@@ -260,8 +260,10 @@ static void create_debug_file(struct at9
 
 	pde = create_proc_entry (debug_filename, 0, NULL);
 	udc->pde = pde;
-	if (pde = NULL)
+	if (pde = NULL) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", debug_filename);
 		return;
+	}
 
 	pde->proc_fops = &proc_ops;
 	pde->data = udc;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/usb/gadget/omap_udc.c linux-2.6.18-rc7/drivers/usb/gadget/omap_udc.c
--- linux-2.6.18-rc7-orig/drivers/usb/gadget/omap_udc.c	2006-09-15 15:28:45.000000000 +0530
+++ linux-2.6.18-rc7/drivers/usb/gadget/omap_udc.c	2006-09-18 16:08:28.000000000 +0530
@@ -2451,6 +2451,8 @@ static void create_proc_file(void)
 	pde = create_proc_entry (proc_filename, 0, NULL);
 	if (pde)
 		pde->proc_fops = &proc_ops;
+	else
+		printk(KERN_WARNING "Unable to create '%s' proc entry.\n", proc_filename);
 }
 
 static void remove_proc_file(void)
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/drivers/usb/host/sl811-hcd.c linux-2.6.18-rc7/drivers/usb/host/sl811-hcd.c
--- linux-2.6.18-rc7-orig/drivers/usb/host/sl811-hcd.c	2006-09-15 15:28:45.000000000 +0530
+++ linux-2.6.18-rc7/drivers/usb/host/sl811-hcd.c	2006-09-18 16:09:15.000000000 +0530
@@ -1532,8 +1532,10 @@ static void create_debug_file(struct sl8
 	struct proc_dir_entry *pde;
 
 	pde = create_proc_entry(proc_filename, 0, NULL);
-	if (pde = NULL)
+	if (pde = NULL) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", proc_filename);
 		return;
+	}
 
 	pde->proc_fops = &proc_ops;
 	pde->data = sl811;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
