From: yoonsoo@web.de
Date: Thu, 03 Jun 2004 18:42:01 +0000
Subject: [Kernel-janitors] [Patch] drivedata access replacement
Message-Id: <20040603184201.GA26906@nlx.t-online.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61871923741318169=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============61871923741318169==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

sorry again for making every mistake that could be made :(

Now hopefully everything is fine.

All changes are tested to compile. Changes are made to avoid direct
access to the driver_data fields and to use get/set_drvdata methods
instead.

greets  
yoon


diff -u1 -rpN -X dontdiff linux-2.6.6-orig/drivers/ide/ide.c linux-2.6.6-new/drivers/ide/ide.c
--- linux-2.6.6-orig/drivers/ide/ide.c	2004-05-10 04:32:26.000000000 +0200
+++ linux-2.6.6-new/drivers/ide/ide.c	2004-05-26 17:23:55.000000000 +0200
@@ -1476,3 +1476,3 @@ static int generic_ide_suspend(struct de
 {
-	ide_drive_t *drive = dev->driver_data;
+	ide_drive_t *drive = dev_get_drvdata(dev);
 	struct request rq;
@@ -1495,3 +1495,3 @@ static int generic_ide_resume(struct dev
 {
-	ide_drive_t *drive = dev->driver_data;
+	ide_drive_t *drive = dev_get_drvdata(dev);
 	struct request rq;
diff -u1 -rpN -X dontdiff linux-2.6.6-orig/drivers/ieee1394/eth1394.c linux-2.6.6-new/drivers/ieee1394/eth1394.c
--- linux-2.6.6-orig/drivers/ieee1394/eth1394.c	2004-05-10 04:32:52.000000000 +0200
+++ linux-2.6.6-new/drivers/ieee1394/eth1394.c	2004-06-03 20:18:07.000000000 +0200
@@ -364,3 +364,3 @@ static int eth1394_probe(struct device *
 
-	ud->device.driver_data = node_info;
+	dev_set_drvdata(&ud->device, node_info);
 	new_node->ud = ud;
@@ -396,3 +396,3 @@ static int eth1394_remove(struct device 
 
-		node_info = (struct eth1394_node_info*)ud->device.driver_data;
+		node_info = dev_get_drvdata(&ud->device);
 
@@ -407,3 +407,3 @@ static int eth1394_remove(struct device 
 		kfree(node_info);
-		ud->device.driver_data = NULL;
+		dev_set_drvdata(&ud->device, NULL);
 	}
@@ -441,3 +441,3 @@ static int eth1394_update(struct unit_di
 
-		ud->device.driver_data = node_info;
+		dev_set_drvdata(&ud->device, node_info);
 		node->ud = ud;
@@ -699,3 +699,3 @@ static void ether1394_host_reset (struct
 	list_for_each_entry(node, &priv->ip_node_list, list) {
-		node_info = (struct eth1394_node_info*)node->ud->device.driver_data;
+		node_info = dev_get_drvdata(&node->ud->device);
 
@@ -908,3 +908,3 @@ static inline u16 ether1394_parse_encap(
 
-		node_info = (struct eth1394_node_info*)node->ud->device.driver_data;
+		node_info = dev_get_drvdata(&node->ud->device);
 
@@ -1134,3 +1134,3 @@ static int ether1394_data_handler(struct
 
-	node_info = (struct eth1394_node_info*)ud->device.driver_data;
+	node_info = dev_get_drvdata(&ud->device);
 
@@ -1697,3 +1697,3 @@ static int ether1394_tx (struct sk_buff 
 		}
-		node_info = (struct eth1394_node_info*)node->ud->device.driver_data;
+		node_info = dev_get_drvdata(&node->ud->device);
 		if (node_info->fifo == ETHER1394_INVALID_ADDR) {
diff -u1 -rpN -X dontdiff linux-2.6.6-orig/drivers/ieee1394/sbp2.c linux-2.6.6-new/drivers/ieee1394/sbp2.c
--- linux-2.6.6-orig/drivers/ieee1394/sbp2.c	2004-05-10 04:32:01.000000000 +0200
+++ linux-2.6.6-new/drivers/ieee1394/sbp2.c	2004-06-03 20:16:17.000000000 +0200
@@ -634,3 +634,3 @@ static int sbp2_remove(struct device *de
 	ud = container_of(dev, struct unit_directory, device);
-	scsi_id = ud->device.driver_data;
+	scsi_id = dev_get_drvdata(&ud->device);
 
@@ -644,3 +644,3 @@ static int sbp2_update(struct unit_direc
 {
-	struct scsi_id_instance_data *scsi_id = ud->device.driver_data;
+	struct scsi_id_instance_data *scsi_id = dev_get_drvdata(&ud->device);
 
@@ -714,3 +714,3 @@ static struct scsi_id_instance_data *sbp
 
-	ud->device.driver_data = scsi_id;
+	dev_set_drvdata(&ud->device, scsi_id);
 
@@ -1014,3 +1014,3 @@ static void sbp2_remove_device(struct sc
 
-	scsi_id->ud->device.driver_data = NULL;
+	dev_set_drvdata(&scsi_id->ud->device, NULL);
 
diff -u1 -rpN -X dontdiff linux-2.6.6-orig/drivers/net/3c509.c linux-2.6.6-new/drivers/net/3c509.c
--- linux-2.6.6-orig/drivers/net/3c509.c	2004-05-10 04:31:59.000000000 +0200
+++ linux-2.6.6-new/drivers/net/3c509.c	2004-06-03 19:51:32.348655024 +0200
@@ -676,3 +676,3 @@ static int __init el3_mca_probe(struct d
 	lp->type = EL3_MCA;
-	device->driver_data = dev;
+	dev_set_drvdata(device, dev);
 	err = el3_common_init(dev);
@@ -680,3 +680,3 @@ static int __init el3_mca_probe(struct d
 	if (err) {
-		device->driver_data = NULL;
+		dev_set_drvdata(device, NULL);
 		free_netdev(dev);
@@ -759,3 +759,3 @@ static int __devexit el3_device_remove (
 
-	dev  = device->driver_data;
+	dev  = dev_get_drvdata(device);
 
diff -u1 -rpN -X dontdiff linux-2.6.6-orig/drivers/net/depca.c linux-2.6.6-new/drivers/net/depca.c
--- linux-2.6.6-orig/drivers/net/depca.c	2004-05-10 04:32:37.000000000 +0200
+++ linux-2.6.6-new/drivers/net/depca.c	2004-06-03 19:55:21.407832736 +0200
@@ -805,3 +805,3 @@ static int __init depca_hw_init (struct 
 
-	device->driver_data = dev;
+	dev_set_drvdata(device, dev);
 	SET_NETDEV_DEV (dev, device);
@@ -1630,3 +1630,3 @@ static int __devexit depca_device_remove
 
-	dev  = device->driver_data;
+	dev  = dev_get_drvdata(device);
 	lp   = dev->priv;
diff -u1 -rpN -X dontdiff linux-2.6.6-orig/drivers/net/dgrs.c linux-2.6.6-new/drivers/net/dgrs.c
--- linux-2.6.6-orig/drivers/net/dgrs.c	2004-05-10 04:31:59.000000000 +0200
+++ linux-2.6.6-new/drivers/net/dgrs.c	2004-06-03 19:52:35.014128424 +0200
@@ -1494,3 +1494,3 @@ static int __init dgrs_eisa_probe (struc
 
-	gendev->driver_data = dev;
+	dev_set_drvdata(gendev, dev);
 	return 0;
@@ -1503,3 +1503,3 @@ static int __devexit dgrs_eisa_remove(st
 {
-	struct net_device *dev = gendev->driver_data;
+	struct net_device *dev = dev_get_drvdata(gendev);
 	
diff -u1 -rpN -X dontdiff linux-2.6.6-orig/drivers/net/hp100.c linux-2.6.6-new/drivers/net/hp100.c
--- linux-2.6.6-orig/drivers/net/hp100.c	2004-05-10 04:32:28.000000000 +0200
+++ linux-2.6.6-new/drivers/net/hp100.c	2004-06-03 19:54:14.467009288 +0200
@@ -2876,3 +2876,3 @@ static int __init hp100_eisa_probe (stru
 #endif
-	gendev->driver_data = dev;
+	dev_set_drvdata(gendev, dev);
 	return 0;
@@ -2887,3 +2887,3 @@ static int __devexit hp100_eisa_remove (
 {
-	struct net_device *dev = gendev->driver_data;
+	struct net_device *dev = dev_get_drvdata(gendev);
 	cleanup_dev(dev);
diff -u1 -rpN -X dontdiff linux-2.6.6-orig/drivers/net/ne3210.c linux-2.6.6-new/drivers/net/ne3210.c
--- linux-2.6.6-orig/drivers/net/ne3210.c	2004-05-10 04:32:28.000000000 +0200
+++ linux-2.6.6-new/drivers/net/ne3210.c	2004-06-03 19:54:47.825937960 +0200
@@ -110,3 +110,3 @@ static int __init ne3210_eisa_probe (str
 	SET_NETDEV_DEV(dev, device);
-	device->driver_data = dev;
+	dev_set_drvdata(device, dev);
 	ioaddr = edev->base_addr;
@@ -236,3 +236,3 @@ static int __devexit ne3210_eisa_remove 
 {
-	struct net_device  *dev    = device->driver_data;
+	struct net_device  *dev    = dev_get_drvdata(device);
 	unsigned long       ioaddr = to_eisa_device (device)->base_addr;
diff -u1 -rpN -X dontdiff linux-2.6.6-orig/drivers/net/smc-mca.c linux-2.6.6-new/drivers/net/smc-mca.c
--- linux-2.6.6-orig/drivers/net/smc-mca.c	2004-05-10 04:32:00.000000000 +0200
+++ linux-2.6.6-new/drivers/net/smc-mca.c	2004-06-03 19:53:26.325327936 +0200
@@ -297,3 +297,3 @@ int __init ultramca_probe(struct device 
 
-	gen_dev->driver_data = dev;
+	dev_set_drvdata(gen_dev, dev);
 
@@ -457,3 +457,3 @@ static int ultramca_remove(struct device
 	struct mca_device *mca_dev = to_mca_device(gen_dev);
-	struct net_device *dev = (struct net_device *)gen_dev->driver_data;
+	struct net_device *dev = dev_get_drvdata(gen_dev);
 
diff -u1 -rpN -X dontdiff linux-2.6.6-orig/drivers/net/tulip/de4x5.c linux-2.6.6-new/drivers/net/tulip/de4x5.c
--- linux-2.6.6-orig/drivers/net/tulip/de4x5.c	2004-05-10 04:31:59.000000000 +0200
+++ linux-2.6.6-new/drivers/net/tulip/de4x5.c	2004-06-03 20:24:14.748324928 +0200
@@ -1092,3 +1092,3 @@ de4x5_hw_init(struct net_device *dev, u_
 
-    gendev->driver_data = dev;
+		dev_set_drvdata(gendev, dev);
 
@@ -2102,3 +2102,3 @@ static int __devexit de4x5_eisa_remove (
 
-	dev = device->driver_data;
+	dev = dev_get_drvdata(device);
 	iobase = dev->base_addr;
@@ -2337,3 +2337,3 @@ static void __devexit de4x5_pci_remove (
 
-	dev = pdev->dev.driver_data;
+	dev = pci_get_drvdata(pdev);
 	iobase = dev->base_addr;
diff -u1 -rpN -X dontdiff linux-2.6.6-orig/drivers/usb/core/usb.c linux-2.6.6-new/drivers/usb/core/usb.c
--- linux-2.6.6-orig/drivers/usb/core/usb.c	2004-05-10 04:32:37.000000000 +0200
+++ linux-2.6.6-new/drivers/usb/core/usb.c	2004-06-03 19:57:27.507662648 +0200
@@ -570,3 +570,3 @@ static int usb_hotplug (struct device *d
 	if ((dev->driver == &usb_generic_driver) || 
-	    (dev->driver_data == &usb_generic_driver_data))
+			(dev_get_drvdata(dev) == &usb_generic_driver_data))
 		return 0;
@@ -712,3 +712,3 @@ usb_alloc_dev(struct usb_device *parent,
 	dev->dev.dma_mask = bus->controller->dma_mask;
-	dev->dev.driver_data = &usb_generic_driver_data;
+	dev_set_drvdata(&dev->dev, &usb_generic_driver_data);
 	dev->dev.driver = &usb_generic_driver;
@@ -1516,3 +1516,3 @@ static int usb_device_suspend(struct dev
 	    (dev->driver == &usb_generic_driver) ||
-	    (dev->driver_data == &usb_generic_driver_data))
+			(dev_get_drvdata(dev) == &usb_generic_driver_data))
 		return 0;
@@ -1534,3 +1534,3 @@ static int usb_device_resume(struct devi
 	    (dev->driver == &usb_generic_driver) ||
-	    (dev->driver_data == &usb_generic_driver_data))
+			(dev_get_drvdata(dev) == &usb_generic_driver_data))
 		return 0;
diff -u1 -rpN -X dontdiff linux-2.6.6-orig/include/linux/eisa.h linux-2.6.6-new/include/linux/eisa.h
--- linux-2.6.6-orig/include/linux/eisa.h	2004-05-10 04:33:12.000000000 +0200
+++ linux-2.6.6-new/include/linux/eisa.h	2004-06-03 19:47:43.438454664 +0200
@@ -76,3 +76,3 @@ static inline void *eisa_get_drvdata (st
 {
-        return edev->dev.driver_data;
+	return dev_get_drvdata(&edev->dev);
 }
@@ -81,3 +81,3 @@ static inline void eisa_set_drvdata (str
 {
-        edev->dev.driver_data = data;
+	dev_set_drvdata(&edev->dev, data);
 }

--===============61871923741318169==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61871923741318169==--
