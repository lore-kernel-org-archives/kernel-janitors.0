From: Yoon Soo <yoonsoo@web.de>
Date: Fri, 28 May 2004 12:33:40 +0000
Subject: [Kernel-janitors] [PATCH] replacing driver_data access by
Message-Id: <40B731A4.8040109@web.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24772991506543818=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24772991506543818==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

as I can see, this is mostly cosmetic and doesnt change the code too
much. So it is just tested to compile and modified kernel is running
without probs here. But many changes didnt touched it anyway, because
these drivers are unused here.

Hope it is ok. I took care of tabs and spaces..I think. Another
question: Should I split a patch of this size or is it ok?

greets

yoon


diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/eisa/pci_eisa.c
linux-2.6.6-new/drivers/eisa/pci_eisa.c
--- linux-2.6.6-orig/drivers/eisa/pci_eisa.c    2004-05-10
04:32:01.000000000 +0200
+++ linux-2.6.6-new/drivers/eisa/pci_eisa.c    2004-05-26
17:11:36.000000000 +0200
@@ -33,3 +33,3 @@ static int __devinit pci_eisa_init (stru
     pci_eisa_root.dev              = &pdev->dev;
-    pci_eisa_root.dev->driver_data = &pci_eisa_root;
+    dev_set_drvdata(pci_eisa_root.dev,&pci_eisa_root);
     pci_eisa_root.res           = pdev->bus->resource[0];
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/eisa/virtual_root.c
linux-2.6.6-new/drivers/eisa/virtual_root.c
--- linux-2.6.6-orig/drivers/eisa/virtual_root.c    2004-05-10
04:32:54.000000000 +0200
+++ linux-2.6.6-new/drivers/eisa/virtual_root.c    2004-05-26
17:12:28.000000000 +0200
@@ -60,3 +60,3 @@ static int virtual_eisa_root_init (void)

-    eisa_root_dev.dev.driver_data = &eisa_bus_root;
+    dev_set_drvdata(eisa_root_dev.dev,&eisa_bus_root);

diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/ide/ide.c
linux-2.6.6-new/drivers/ide/ide.c
--- linux-2.6.6-orig/drivers/ide/ide.c    2004-05-10 04:32:26.000000000
+0200
+++ linux-2.6.6-new/drivers/ide/ide.c    2004-05-26 17:23:55.000000000 +0200
@@ -1476,3 +1476,3 @@ static int generic_ide_suspend(struct de
{
-    ide_drive_t *drive = dev->driver_data;
+    ide_drive_t *drive = dev_get_drvdata(dev);
     struct request rq;
@@ -1495,3 +1495,3 @@ static int generic_ide_resume(struct dev
{
-    ide_drive_t *drive = dev->driver_data;
+    ide_drive_t *drive = dev_get_drvdata(dev);
     struct request rq;
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/ieee1394/eth1394.c
linux-2.6.6-new/drivers/ieee1394/eth1394.c
--- linux-2.6.6-orig/drivers/ieee1394/eth1394.c    2004-05-10
04:32:52.000000000 +0200
+++ linux-2.6.6-new/drivers/ieee1394/eth1394.c    2004-05-26
17:30:04.000000000 +0200
@@ -364,3 +364,3 @@ static int eth1394_probe(struct device *

-    ud->device.driver_data = node_info;
+    dev_set_drvdata(ud->device,node_info);
     new_node->ud = ud;
@@ -396,3 +396,3 @@ static int eth1394_remove(struct device

-        node_info = (struct eth1394_node_info*)ud->device.driver_data;
+        node_info = (struct eth1394_node_info*)dev_get_drvdata(ud->device);

@@ -407,3 +407,3 @@ static int eth1394_remove(struct device
         kfree(node_info);
-        ud->device.driver_data = NULL;
+        dev_set_drvdata(ud->device,NULL);
     }
@@ -441,3 +441,3 @@ static int eth1394_update(struct unit_di

-        ud->device.driver_data = node_info;
+        dev_set_drvdata(ud->device,node_info);
         node->ud = ud;
@@ -699,3 +699,3 @@ static void ether1394_host_reset (struct
     list_for_each_entry(node, &priv->ip_node_list, list) {
-        node_info = (struct
eth1394_node_info*)node->ud->device.driver_data;
+        node_info = (struct
eth1394_node_info*)dev_get_drvdata(node->ud->device);

@@ -908,3 +908,3 @@ static inline u16 ether1394_parse_encap(

-        node_info = (struct
eth1394_node_info*)node->ud->device.driver_data;
+        node_info = (struct
eth1394_node_info*)dev_get_drvdata(node->ud->device);

@@ -1134,3 +1134,3 @@ static int ether1394_data_handler(struct

-    node_info = (struct eth1394_node_info*)ud->device.driver_data;
+    node_info = (struct eth1394_node_info*)dev_get_drvdata(ud->device);

@@ -1697,3 +1697,3 @@ static int ether1394_tx (struct sk_buff
         }
-        node_info = (struct
eth1394_node_info*)node->ud->device.driver_data;
+        node_info = (struct
eth1394_node_info*)dev_get_drvdata(node->ud->device);
         if (node_info->fifo == ETHER1394_INVALID_ADDR) {
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/ieee1394/sbp2.c
linux-2.6.6-new/drivers/ieee1394/sbp2.c
--- linux-2.6.6-orig/drivers/ieee1394/sbp2.c    2004-05-10
04:32:01.000000000 +0200
+++ linux-2.6.6-new/drivers/ieee1394/sbp2.c    2004-05-26
17:27:09.000000000 +0200
@@ -634,3 +634,3 @@ static int sbp2_remove(struct device *de
     ud = container_of(dev, struct unit_directory, device);
-    scsi_id = ud->device.driver_data;
+    scsi_id = dev_get_drvdata(ud->device);

@@ -644,3 +644,3 @@ static int sbp2_update(struct unit_direc
{
-    struct scsi_id_instance_data *scsi_id = ud->device.driver_data;
+    struct scsi_id_instance_data *scsi_id = dev_get_drvdata(ud->device);

@@ -714,3 +714,3 @@ static struct scsi_id_instance_data *sbp

-    ud->device.driver_data = scsi_id;
+    dev_set_drvdata(ud->device,scsi_id);

@@ -1014,3 +1014,3 @@ static void sbp2_remove_device(struct sc

-    scsi_id->ud->device.driver_data = NULL;
+    dev_set_drvdata(scsi_id->ud->device,NULL);

diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/net/3c509.c
linux-2.6.6-new/drivers/net/3c509.c
--- linux-2.6.6-orig/drivers/net/3c509.c    2004-05-10
04:31:59.000000000 +0200
+++ linux-2.6.6-new/drivers/net/3c509.c    2004-05-26 13:06:42.000000000
+0200
@@ -676,3 +676,3 @@ static int __init el3_mca_probe(struct d
     lp->type = EL3_MCA;
-    device->driver_data = dev;
+    dev_set_drvdata(device,dev);
     err = el3_common_init(dev);
@@ -680,3 +680,3 @@ static int __init el3_mca_probe(struct d
     if (err) {
-        device->driver_data = NULL;
+        dev_set_drvdata(device,NULL);
         free_netdev(dev);
@@ -759,3 +759,3 @@ static int __devexit el3_device_remove (

-    dev  = device->driver_data;
+    dev  = dev_get_drvdata(device);

diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/net/depca.c
linux-2.6.6-new/drivers/net/depca.c
--- linux-2.6.6-orig/drivers/net/depca.c    2004-05-10
04:32:37.000000000 +0200
+++ linux-2.6.6-new/drivers/net/depca.c    2004-05-26 13:16:58.000000000
+0200
@@ -805,3 +805,3 @@ static int __init depca_hw_init (struct

-    device->driver_data = dev;
+    dev_set_drvdata(device,dev);
     SET_NETDEV_DEV (dev, device);
@@ -1630,3 +1630,3 @@ static int __devexit depca_device_remove

-    dev  = device->driver_data;
+    dev  = dev_get_drvdata(device);
     lp   = dev->priv;
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/net/dgrs.c
linux-2.6.6-new/drivers/net/dgrs.c
--- linux-2.6.6-orig/drivers/net/dgrs.c    2004-05-10 04:31:59.000000000
+0200
+++ linux-2.6.6-new/drivers/net/dgrs.c    2004-05-26 13:09:21.000000000
+0200
@@ -1494,3 +1494,3 @@ static int __init dgrs_eisa_probe (struc

-    gendev->driver_data = dev;
+    dev_set_drvdata(gendev,dev);
     return 0;
@@ -1503,3 +1503,3 @@ static int __devexit dgrs_eisa_remove(st
{
-    struct net_device *dev = gendev->driver_data;
+    struct net_device *dev = dev_get_drvdata(gendev);

diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/net/hp100.c
linux-2.6.6-new/drivers/net/hp100.c
--- linux-2.6.6-orig/drivers/net/hp100.c    2004-05-10
04:32:28.000000000 +0200
+++ linux-2.6.6-new/drivers/net/hp100.c    2004-05-26 13:13:45.000000000
+0200
@@ -2876,3 +2876,3 @@ static int __init hp100_eisa_probe (stru
#endif
-    gendev->driver_data = dev;
+    dev_set_drvdata(gendev,dev);
     return 0;
@@ -2887,3 +2887,3 @@ static int __devexit hp100_eisa_remove (
{
-    struct net_device *dev = gendev->driver_data;
+    struct net_device *dev = dev_get_drvdata(gendev);
     cleanup_dev(dev);
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/net/ne3210.c
linux-2.6.6-new/drivers/net/ne3210.c
--- linux-2.6.6-orig/drivers/net/ne3210.c    2004-05-10
04:32:28.000000000 +0200
+++ linux-2.6.6-new/drivers/net/ne3210.c    2004-05-26
13:15:08.000000000 +0200
@@ -110,3 +110,3 @@ static int __init ne3210_eisa_probe (str
     SET_NETDEV_DEV(dev, device);
-    device->driver_data = dev;
+    dev_set_drvdata(device,dev);
     ioaddr = edev->base_addr;
@@ -236,3 +236,3 @@ static int __devexit ne3210_eisa_remove
{
-    struct net_device  *dev    = device->driver_data;
+    struct net_device  *dev    = dev_get_drvdata(device);
     unsigned long       ioaddr = to_eisa_device (device)->base_addr;
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/net/smc-mca.c
linux-2.6.6-new/drivers/net/smc-mca.c
--- linux-2.6.6-orig/drivers/net/smc-mca.c    2004-05-10
04:32:00.000000000 +0200
+++ linux-2.6.6-new/drivers/net/smc-mca.c    2004-05-26
13:11:12.000000000 +0200
@@ -297,3 +297,3 @@ int __init ultramca_probe(struct device

-    gen_dev->driver_data = dev;
+    dev_set_drvdata(gen_dev,dev);

@@ -457,3 +457,3 @@ static int ultramca_remove(struct device
     struct mca_device *mca_dev = to_mca_device(gen_dev);
-    struct net_device *dev = (struct net_device *)gen_dev->driver_data;
+    struct net_device *dev = (struct net_device *)dev_get_drvdata(gen_dev);

diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/net/tulip/de4x5.c
linux-2.6.6-new/drivers/net/tulip/de4x5.c
--- linux-2.6.6-orig/drivers/net/tulip/de4x5.c    2004-05-10
04:31:59.000000000 +0200
+++ linux-2.6.6-new/drivers/net/tulip/de4x5.c    2004-05-26
13:01:30.000000000 +0200
@@ -1092,3 +1092,3 @@ de4x5_hw_init(struct net_device *dev, u_

-    gendev->driver_data = dev;
+    drv_set_drvdata(gendev,dev);

@@ -2102,3 +2102,3 @@ static int __devexit de4x5_eisa_remove (

-    dev = device->driver_data;
+    dev = drv_get_drvdata(device);
     iobase = dev->base_addr;
@@ -2337,3 +2337,3 @@ static void __devexit de4x5_pci_remove (

-    dev = pdev->dev.driver_data;
+    dev = pci_get_drvdata(pdev);
     iobase = dev->base_addr;
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/parisc/eisa.c
linux-2.6.6-new/drivers/parisc/eisa.c
--- linux-2.6.6-orig/drivers/parisc/eisa.c    2004-05-10
04:31:58.000000000 +0200
+++ linux-2.6.6-new/drivers/parisc/eisa.c    2004-05-26
17:30:59.000000000 +0200
@@ -395,3 +395,3 @@ static int __devinit eisa_probe(struct p
         eisa_dev.root.dev = &dev->dev;
-        dev->dev.driver_data = &eisa_dev.root;
+        dev_set_drvdata(dev->dev,&eisa_dev.root);
         eisa_dev.root.bus_base_addr = 0;
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/parport/parport_gsc.c
linux-2.6.6-new/drivers/parport/parport_gsc.c
--- linux-2.6.6-orig/drivers/parport/parport_gsc.c    2004-05-10
04:33:19.000000000 +0200
+++ linux-2.6.6-new/drivers/parport/parport_gsc.c    2004-05-26
17:22:10.000000000 +0200
@@ -473,3 +473,3 @@ static int __devinit parport_init_chip(s
         parport_count++;
-    dev->dev.driver_data = p;
+    dev_set_drvdata(dev->dev,p);

@@ -480,3 +480,3 @@ static int __devexit parport_remove_chip
{
-    struct parport *p = dev->dev.driver_data;
+    struct parport *p = dev_get_drvdata(dev->dev);
     if (p) {
diff -u1 -prN -X dontdiff
linux-2.6.6-orig/drivers/s390/block/dasd_devmap.c
linux-2.6.6-new/drivers/s390/block/dasd_devmap.c
--- linux-2.6.6-orig/drivers/s390/block/dasd_devmap.c    2004-05-10
04:32:37.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/block/dasd_devmap.c    2004-05-26
16:41:54.000000000 +0200
@@ -432,7 +432,7 @@ dasd_devmap_from_cdev(struct ccw_device

-    if (cdev->dev.driver_data)
-        return (struct dasd_devmap *) cdev->dev.driver_data;
+    if (dev_get_drvdata(cdev->dev))
+        return (struct dasd_devmap *) dev_get_drvdata(cdev->dev);
     devmap = dasd_find_busid(cdev->dev.bus_id);
     if (!IS_ERR(devmap)) {
-        cdev->dev.driver_data = devmap;
+        dev_set_drvdata(cdev->dev,devmap);
         return devmap;
@@ -441,3 +441,3 @@ dasd_devmap_from_cdev(struct ccw_device
     if (!IS_ERR(devmap))
-        cdev->dev.driver_data = devmap;
+        dev_set_drvdata(cdev->dev,devmap);
     return devmap;
@@ -556,3 +556,3 @@ dasd_device_from_cdev(struct ccw_device
     spin_lock(&dasd_devmap_lock);
-    devmap = cdev->dev.driver_data;
+    devmap = dev_get_drvdata(cdev->dev);
     if (devmap && devmap->device) {
@@ -578,3 +578,3 @@ dasd_ro_show(struct device *dev, char *b

-    devmap = dev->driver_data;
+    devmap = dev_get_drvdata(dev);
     if (devmap)
@@ -624,3 +624,3 @@ dasd_use_diag_show(struct device *dev, c

-    devmap = dev->driver_data;
+    devmap = dev_get_drvdata(dev);
     if (devmap)
@@ -664,3 +664,3 @@ dasd_discipline_show(struct device *dev,
     dname = "none";
-    devmap = dev->driver_data;
+    devmap = dev_get_drvdata(dev);
     if (devmap && devmap->device && devmap->device->discipline)
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/char/con3215.c
linux-2.6.6-new/drivers/s390/char/con3215.c
--- linux-2.6.6-orig/drivers/s390/char/con3215.c    2004-05-10
04:32:53.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/char/con3215.c    2004-05-26
13:49:40.000000000 +0200
@@ -387,3 +387,3 @@ raw3215_irq(struct ccw_device *cdev, uns

-    raw = cdev->dev.driver_data;
+    raw = dev_get_drvdata(cdev->dev);
     req = (struct raw3215_req *) intparm;
@@ -717,3 +717,3 @@ raw3215_probe (struct ccw_device *cdev)

-    cdev->dev.driver_data = raw;
+    dev_set_drvdata(cdev->dev,raw);
     cdev->handler = raw3215_irq;
@@ -729,5 +729,5 @@ raw3215_remove (struct ccw_device *cdev)
     ccw_device_set_offline(cdev);
-    raw = cdev->dev.driver_data;
+    raw = dev_get_drvdata(cdev->dev);
     if (raw) {
-        cdev->dev.driver_data = NULL;
+        dev_set_drvdata(cdev->dev,NULL);
         if (raw->buffer)
@@ -743,3 +743,3 @@ raw3215_set_online (struct ccw_device *c

-    raw = cdev->dev.driver_data;
+    raw = dev_get_drvdata(cdev->dev);
     if (!raw)
@@ -755,3 +755,3 @@ raw3215_set_offline (struct ccw_device *

-    raw = cdev->dev.driver_data;
+    raw = dev_get_drvdata(cdev->dev);
     if (!raw)
@@ -889,3 +889,3 @@ con3215_init(void)
     raw->lock = get_ccwdev_lock(cdev);
-    cdev->dev.driver_data = raw;
+    dev_set_drvdata(cdev->dev,raw);
     cdev->handler = raw3215_irq;
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/char/raw3270.c
linux-2.6.6-new/drivers/s390/char/raw3270.c
--- linux-2.6.6-orig/drivers/s390/char/raw3270.c    2004-05-10
04:33:13.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/char/raw3270.c    2004-05-26
13:54:21.000000000 +0200
@@ -341,3 +341,3 @@ raw3270_irq (struct ccw_device *cdev, un

-    rp = (struct raw3270 *) cdev->dev.driver_data;
+    rp = (struct raw3270 *) dev_get_drvdata(cdev->dev);
     if (!rp)
@@ -788,3 +788,3 @@ raw3270_setup_device(struct ccw_device *
     rp->cdev = cdev;
-    cdev->dev.driver_data = rp;
+    dev_set_drvdata(cdev->dev,rp);
     cdev->handler = raw3270_irq;
@@ -1049,3 +1049,3 @@ raw3270_delete_device(struct raw3270 *rp
     rp->cdev = 0;
-    cdev->dev.driver_data = 0;
+    dev_set_drvdata(cdev->dev,0);
     cdev->handler = 0;
@@ -1073,3 +1073,3 @@ raw3270_model_show(struct device *dev, c
     return snprintf(buf, PAGE_SIZE, "%i\n",
-            ((struct raw3270 *) dev->driver_data)->model);
+            ((struct raw3270 *) dev_get_drvdata(dev))->model);
}
@@ -1081,3 +1081,3 @@ raw3270_rows_show(struct device *dev, ch
     return snprintf(buf, PAGE_SIZE, "%i\n",
-            ((struct raw3270 *) dev->driver_data)->rows);
+            ((struct raw3270 *) dev_get_drvdata(dev))->rows);
}
@@ -1089,3 +1089,3 @@ raw3270_columns_show(struct device *dev,
     return snprintf(buf, PAGE_SIZE, "%i\n",
-            ((struct raw3270 *) dev->driver_data)->cols);
+            ((struct raw3270 *) dev_get_drvdata(dev))->cols);
}
@@ -1143,3 +1143,3 @@ raw3270_remove (struct ccw_device *cdev)

-    rp = cdev->dev.driver_data;
+    rp = dev_get_drvdata(cdev->dev);
     set_bit(RAW3270_FLAGS_SHUTDOWN, &rp->flags);
@@ -1180,3 +1180,3 @@ raw3270_set_offline (struct ccw_device *

-    rp = cdev->dev.driver_data;
+    rp = dev_get_drvdata(cdev->dev);
     if (test_bit(RAW3270_FLAGS_CONSOLE, &rp->flags))
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/char/tape_34xx.c
linux-2.6.6-new/drivers/s390/char/tape_34xx.c
--- linux-2.6.6-orig/drivers/s390/char/tape_34xx.c    2004-05-10
04:32:28.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/char/tape_34xx.c    2004-05-26
13:46:22.000000000 +0200
@@ -1319,3 +1319,3 @@ tape_34xx_online(struct ccw_device *cdev
     return tape_generic_online(
-        cdev->dev.driver_data,
+        dev_get_drvdata(cdev->dev),
         &tape_discipline_34xx
@@ -1327,3 +1327,3 @@ tape_34xx_offline(struct ccw_device *cde
{
-    return tape_generic_offline(cdev->dev.driver_data);
+    return tape_generic_offline(dev_get_drvdata(cdev->dev));
}
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/char/tape_core.c
linux-2.6.6-new/drivers/s390/char/tape_core.c
--- linux-2.6.6-orig/drivers/s390/char/tape_core.c    2004-05-10
04:32:26.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/char/tape_core.c    2004-05-26
13:44:44.000000000 +0200
@@ -110,3 +110,3 @@ tape_medium_state_show(struct device *de

-    tdev = (struct tape_device *) dev->driver_data;
+    tdev = (struct tape_device *) dev_get_drvdata(dev);
     return scnprintf(buf, PAGE_SIZE, "%i\n", tdev->medium_state);
@@ -122,3 +122,3 @@ tape_first_minor_show(struct device *dev

-    tdev = (struct tape_device *) dev->driver_data;
+    tdev = (struct tape_device *) dev_get_drvdata(dev);
     return scnprintf(buf, PAGE_SIZE, "%i\n", tdev->first_minor);
@@ -134,3 +134,3 @@ tape_state_show(struct device *dev, char

-    tdev = (struct tape_device *) dev->driver_data;
+    tdev = (struct tape_device *) dev_get_drvdata(dev);
     return scnprintf(buf, PAGE_SIZE, "%s\n", (tdev->first_minor < 0) ?
@@ -148,3 +148,3 @@ tape_operation_show(struct device *dev,

-    tdev = (struct tape_device *) dev->driver_data;
+    tdev = (struct tape_device *) dev_get_drvdata(dev);
     if (tdev->first_minor < 0)
@@ -174,3 +174,3 @@ tape_blocksize_show(struct device *dev,

-    tdev = (struct tape_device *) dev->driver_data;
+    tdev = (struct tape_device *) dev_get_drvdata(dev);

@@ -542,3 +542,3 @@ tape_generic_probe(struct ccw_device *cd
     PRINT_INFO("tape device %s found\n", cdev->dev.bus_id);
-    cdev->dev.driver_data = device;
+    dev_set_drvdata(cdev->dev,device);
     device->cdev = cdev;
@@ -584,3 +584,3 @@ tape_generic_remove(struct ccw_device *c

-    device = cdev->dev.driver_data;
+    device = dev_get_drvdata(cdev->dev);
     if (!device) {
@@ -627,5 +627,5 @@ tape_generic_remove(struct ccw_device *c

-    if (cdev->dev.driver_data != NULL) {
+    if (dev_get_drvdata(cdev->dev)) {
         sysfs_remove_group(&cdev->dev.kobj, &tape_attr_group);
-        cdev->dev.driver_data = tape_put_device(cdev->dev.driver_data);
+
dev_set_drvdata(cdev->dev,tape_put_device(dev_get_drvdata(cdev->dev)));
     }
@@ -976,3 +976,3 @@ __tape_do_irq (struct ccw_device *cdev,

-    device = (struct tape_device *) cdev->dev.driver_data;
+    device = (struct tape_device *) dev_get_drvdata(cdev->dev);
     if (device == NULL) {
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/cio/ccwgroup.c
linux-2.6.6-new/drivers/s390/cio/ccwgroup.c
--- linux-2.6.6-orig/drivers/s390/cio/ccwgroup.c    2004-05-10
04:32:38.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/cio/ccwgroup.c    2004-05-26
13:34:07.000000000 +0200
@@ -105,3 +105,3 @@ ccwgroup_release (struct device *dev)
     for (i = 0; i < gdev->count; i++) {
-        gdev->cdev[i]->dev.driver_data = NULL;
+        dev_set_drvdata(gdev->cdev[i]->dev,NULL);
         put_device(&gdev->cdev[i]->dev);
@@ -184,3 +184,3 @@ ccwgroup_create(struct device *root,
         /* Don't allow a device to belong to more than one group. */
-        if (gdev->cdev[i]->dev.driver_data) {
+        if (dev_get_drvdata(gdev->cdev[i]->dev)) {
             rc = -EINVAL;
@@ -190,3 +190,3 @@ ccwgroup_create(struct device *root,
     for (i = 0; i < argc; i++)
-        gdev->cdev[i]->dev.driver_data = gdev;
+        dev_set_drvdata(gdev->cdev[i]->dev,gdev);
     del_drvdata = 1;
@@ -229,3 +229,3 @@ error:
             if (del_drvdata)
-                gdev->cdev[i]->dev.driver_data = NULL;
+                dev_set_drvdata(gdev->cdev[i]->dev,NULL);
         }
@@ -442,4 +442,4 @@ __ccwgroup_get_gdev_by_cdev(struct ccw_d

-    if (cdev->dev.driver_data) {
-        gdev = (struct ccwgroup_device *)cdev->dev.driver_data;
+    if (dev_get_drvdata(cdev->dev)) {
+        gdev = (struct ccwgroup_device *)dev_get_drvdata(cdev->dev);
         if (get_device(&gdev->dev)) {
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/cio/device.c
linux-2.6.6-new/drivers/s390/cio/device.c
--- linux-2.6.6-orig/drivers/s390/cio/device.c    2004-05-10
04:32:54.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/cio/device.c    2004-05-26
13:39:36.000000000 +0200
@@ -550,3 +550,3 @@ io_subchannel_register(void *data)
         put_device(&cdev->dev);
-        sch->dev.driver_data = 0;
+        dev_set_drvdata(sch->dev,0);
         kfree (cdev->private);
@@ -630,3 +630,3 @@ io_subchannel_recog(struct ccw_device *c

-    sch->dev.driver_data = cdev;
+    dev_set_drvdata(sch->dev,cdev);
     sch->driver = &io_subchannel_driver;
@@ -668,3 +668,3 @@ io_subchannel_probe (struct device *pdev
     sch = to_subchannel(pdev);
-    if (sch->dev.driver_data) {
+    if (dev_get_drvdata(sch->dev)) {
         /*
@@ -674,3 +674,3 @@ io_subchannel_probe (struct device *pdev
          */
-        cdev = sch->dev.driver_data;
+        cdev = dev_get_drvdata(sch->dev);
         device_initialize(&cdev->dev);
@@ -717,3 +717,3 @@ io_subchannel_probe (struct device *pdev
     if (rc) {
-        sch->dev.driver_data = 0;
+        dev_set_drvdata(sch->dev,0);
         if (cdev->dev.release)
@@ -730,5 +730,5 @@ io_subchannel_remove (struct device *dev

-    if (!dev->driver_data)
+    if (!dev_get_drvdata(dev))
         return 0;
-    cdev = dev->driver_data;
+    cdev = dev_get_drvdata(dev);
     /* Set ccw device to not operational and drop reference. */
@@ -742,3 +742,3 @@ io_subchannel_remove (struct device *dev
         device_unregister(&cdev->dev);
-    dev->driver_data = NULL;
+    dev_set_drvdata(dev,NULL);
     return 0;
@@ -751,3 +751,3 @@ io_subchannel_notify(struct device *dev,

-    cdev = dev->driver_data;
+    cdev = dev_get_drvdata(dev);
     if (!cdev)
@@ -766,3 +766,3 @@ io_subchannel_verify(struct device *dev)

-    cdev = dev->driver_data;
+    cdev = dev_get_drvdata(dev);
     if (cdev)
@@ -776,3 +776,3 @@ io_subchannel_ioterm(struct device *dev)

-    cdev = dev->driver_data;
+    cdev = dev_get_drvdata(dev);
     if (!cdev)
@@ -793,3 +793,3 @@ io_subchannel_shutdown(struct device *de
     sch = to_subchannel(dev);
-    cdev = dev->driver_data;
+    cdev = dev_get_drvdata(dev);

diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/cio/device_fsm.c
linux-2.6.6-new/drivers/s390/cio/device_fsm.c
--- linux-2.6.6-orig/drivers/s390/cio/device_fsm.c    2004-05-10
04:32:37.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/cio/device_fsm.c    2004-05-26
13:27:21.000000000 +0200
@@ -30,5 +30,5 @@ device_is_disconnected(struct subchannel

-    if (!sch->dev.driver_data)
+    if (!dev_get_drvdata(sch->dev))
         return 0;
-    cdev = sch->dev.driver_data;
+    cdev = dev_get_drvdata(sch->dev);
     return (cdev->private->state == DEV_STATE_DISCONNECTED ||
@@ -42,5 +42,5 @@ device_set_disconnected(struct subchanne

-    if (!sch->dev.driver_data)
+    if (!dev_get_drvdata(sch->dev))
         return;
-    cdev = sch->dev.driver_data;
+    cdev = dev_get_drvdata(sch->dev);
     ccw_device_set_timeout(cdev, 0);
@@ -54,5 +54,5 @@ device_set_waiting(struct subchannel *sc

-    if (!sch->dev.driver_data)
+    if (!dev_get_drvdata(sch->dev))
         return;
-    cdev = sch->dev.driver_data;
+    cdev = dev_get_drvdata(sch->dev);
     ccw_device_set_timeout(cdev, 10*HZ);
@@ -464,5 +464,5 @@ device_call_nopath_notify(struct subchan

-    if (!sch->dev.driver_data)
+    if (!dev_get_drvdata(sch->dev))
         return;
-    cdev = sch->dev.driver_data;
+    cdev = dev_get_drvdata(sch->dev);
     PREPARE_WORK(&cdev->private->kick_work,
@@ -975,5 +975,5 @@ device_trigger_reprobe(struct subchannel

-    if (!sch->dev.driver_data)
+    if (!dev_get_drvdata(sch->dev))
         return;
-    cdev = sch->dev.driver_data;
+    cdev = dev_get_drvdata(sch->dev);
     spin_lock_irqsave(&sch->lock, flags);
@@ -1193,3 +1193,3 @@ io_subchannel_irq (struct device *pdev)

-    cdev = to_subchannel(pdev)->dev.driver_data;
+    cdev = dev_get_drvdata(to_subchannel(pdev)->dev);

diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/net/ctcmain.c
linux-2.6.6-new/drivers/s390/net/ctcmain.c
--- linux-2.6.6-orig/drivers/s390/net/ctcmain.c    2004-05-10
04:32:28.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/net/ctcmain.c    2004-05-26
16:52:58.000000000 +0200
@@ -2091,3 +2091,3 @@ ctc_irq_handler(struct ccw_device *cdev,
     /* Check for unsolicited interrupts. */
-    if (!cdev->dev.driver_data) {
+    if (!dev_get_drvdata(cdev->dev)) {
         ctc_pr_warn("ctc: Got unsolicited irq: %s c-%02x d-%02x\n",
@@ -2098,4 +2098,4 @@ ctc_irq_handler(struct ccw_device *cdev,

-    priv = ((struct ccwgroup_device *)cdev->dev.driver_data)
-        ->dev.driver_data;
+    priv = dev_get_drvdata(((struct ccwgroup_device
*)dev_get_drvdata(cdev->dev))
+        ->dev);

@@ -2647,3 +2647,3 @@ buffer_show(struct device *dev, char *bu

-    priv = dev->driver_data;
+    priv = dev_get_drvdata(dev);
     if (!priv)
@@ -2661,3 +2661,3 @@ buffer_write(struct device *dev, const c

-    priv = dev->driver_data;
+    priv = dev_get_drvdata(dev);
     if (!priv)
@@ -2693,3 +2693,3 @@ loglevel_show(struct device *dev, char *

-    priv = dev->driver_data;
+    priv = dev_get_drvdata(dev);
     if (!priv)
@@ -2705,3 +2705,3 @@ loglevel_write(struct device *dev, const

-    priv = dev->driver_data;
+    priv = dev_get_drvdata(dev);
     if (!priv)
@@ -2757,3 +2757,3 @@ stats_show(struct device *dev, char *buf
{
-    struct ctc_priv *priv = dev->driver_data;
+    struct ctc_priv *priv = dev_get_drvdata(dev);
     if (!priv)
@@ -2767,3 +2767,3 @@ stats_write(struct device *dev, const ch
{
-    struct ctc_priv *priv = dev->driver_data;
+    struct ctc_priv *priv = dev_get_drvdata(dev);
     if (!priv)
@@ -2889,3 +2889,3 @@ ctc_proto_show(struct device *dev, char

-    priv = dev->driver_data;
+    priv = dev_get_drvdata(dev);
     if (!priv)
@@ -2904,3 +2904,3 @@ ctc_proto_store(struct device *dev, cons

-    priv = dev->driver_data;
+    priv = dev_get_drvdata(dev);
     if (!priv)
@@ -2994,3 +2994,3 @@ ctc_probe_device(struct ccwgroup_device
     cgdev->cdev[1]->handler = ctc_irq_handler;
-    cgdev->dev.driver_data = priv;
+    dev_set_drvdata(cgdev->dev,priv);

@@ -3020,3 +3020,3 @@ ctc_new_device(struct ccwgroup_device *c

-    privptr = cgdev->dev.driver_data;
+    privptr = dev_get_drvdata(cgdev->dev);
     if (!privptr)
@@ -3115,3 +3115,3 @@ ctc_shutdown_device(struct ccwgroup_devi

-    priv = cgdev->dev.driver_data;
+    priv = dev_get_drvdata(cgdev->dev);
     ndev = NULL;
@@ -3164,3 +3164,3 @@ ctc_remove_device(struct ccwgroup_device

-    priv = cgdev->dev.driver_data;
+    priv = dev_get_drvdata(cgdev->dev);
     if (!priv)
@@ -3170,3 +3170,3 @@ ctc_remove_device(struct ccwgroup_device
     ctc_remove_files(&cgdev->dev);
-    cgdev->dev.driver_data = NULL;
+    dev_set_drvdata(cgdev->dev,NULL);
     kfree(priv);
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/net/lcs.c
linux-2.6.6-new/drivers/s390/net/lcs.c
--- linux-2.6.6-orig/drivers/s390/net/lcs.c    2004-05-10
04:32:01.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/net/lcs.c    2004-05-26
16:48:06.000000000 +0200
@@ -1694,3 +1694,3 @@ lcs_portno_show (struct device *dev, cha

-    card = (struct lcs_card *)dev->driver_data;
+    card = (struct lcs_card *)dev_get_drvdata(dev);

@@ -1711,3 +1711,3 @@ lcs_portno_store (struct device *dev, co

-    card = (struct lcs_card *)dev->driver_data;
+    card = (struct lcs_card *)dev_get_drvdata(dev);

@@ -1745,3 +1745,3 @@ lcs_timeout_show(struct device *dev, cha

-    card = (struct lcs_card *)dev->driver_data;
+    card = (struct lcs_card *)dev_get_drvdata(dev);

@@ -1756,3 +1756,3 @@ lcs_timeout_store (struct device *dev, c

-    card = (struct lcs_card *)dev->driver_data;
+    card = (struct lcs_card *)dev_get_drvdata(dev);

@@ -1808,3 +1808,3 @@ lcs_probe_device(struct ccwgroup_device
         }
-    ccwgdev->dev.driver_data = card;
+    dev_set_drvdata(ccwgdev->dev,card);
     ccwgdev->cdev[0]->handler = lcs_irq;
@@ -1820,3 +1820,3 @@ lcs_register_netdev(struct ccwgroup_devi
     LCS_DBF_TEXT(2, setup, "regnetdv");
-    card = (struct lcs_card *)ccwgdev->dev.driver_data;
+    card = (struct lcs_card *)dev_get_drvdata(ccwgdev->dev);
     if (card->dev->reg_state != NETREG_UNINITIALIZED)
@@ -1839,3 +1839,3 @@ lcs_new_device(struct ccwgroup_device *c

-    card = (struct lcs_card *)ccwgdev->dev.driver_data;
+    card = (struct lcs_card *)dev_get_drvdata(ccwgdev->dev);
     if (!card)
@@ -1936,3 +1936,3 @@ lcs_shutdown_device(struct ccwgroup_devi
     LCS_DBF_TEXT(3, setup, "shtdndev");
-    card = (struct lcs_card *)ccwgdev->dev.driver_data;
+    card = (struct lcs_card *)dev_get_drvdata(ccwgdev->dev);
     if (!card)
@@ -1962,3 +1962,3 @@ lcs_remove_device(struct ccwgroup_device

-    card = (struct lcs_card *)ccwgdev->dev.driver_data;
+    card = (struct lcs_card *)dev_get_drvdata(ccwgdev->dev);
     if (!card)
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/net/lcs.h
linux-2.6.6-new/drivers/s390/net/lcs.h
--- linux-2.6.6-orig/drivers/s390/net/lcs.h    2004-05-10
04:32:54.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/net/lcs.h    2004-05-26
17:08:58.000000000 +0200
@@ -34,5 +34,7 @@ do {
  */
+
#define CARD_FROM_DEV(cdev) \
-    (struct lcs_card *) \
-    ((struct ccwgroup_device *)cdev->dev.driver_data)->dev.driver_data;
+    (struct lcs_card *)dev_get_drvdata( \
+    ((struct ccwgroup_device *)dev_get_drvdata(cdev->dev))->dev);
+
/**
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/net/netiucv.c
linux-2.6.6-new/drivers/s390/net/netiucv.c
--- linux-2.6.6-orig/drivers/s390/net/netiucv.c    2004-05-10
04:32:38.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/net/netiucv.c    2004-05-26
17:07:20.000000000 +0200
@@ -1281,3 +1281,3 @@ user_show (struct device *dev, char *buf
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1289,3 +1289,3 @@ user_write (struct device *dev, const ch
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);
     struct net_device *ndev = priv->conn->netdev;
@@ -1341,3 +1341,3 @@ buffer_show (struct device *dev, char *b
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1349,3 +1349,3 @@ buffer_write (struct device *dev, const
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);
     struct net_device *ndev = priv->conn->netdev;
@@ -1391,3 +1391,3 @@ dev_fsm_show (struct device *dev, char *
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1401,3 +1401,3 @@ conn_fsm_show (struct device *dev, char
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1411,3 +1411,3 @@ maxmulti_show (struct device *dev, char
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1419,3 +1419,3 @@ maxmulti_write (struct device *dev, cons
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1430,3 +1430,3 @@ maxcq_show (struct device *dev, char *bu
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1438,3 +1438,3 @@ maxcq_write (struct device *dev, const c
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1449,3 +1449,3 @@ sdoio_show (struct device *dev, char *bu
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1457,3 +1457,3 @@ sdoio_write (struct device *dev, const c
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1468,3 +1468,3 @@ mdoio_show (struct device *dev, char *bu
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1476,3 +1476,3 @@ mdoio_write (struct device *dev, const c
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1487,3 +1487,3 @@ txlen_show (struct device *dev, char *bu
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1495,3 +1495,3 @@ txlen_write (struct device *dev, const c
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1506,3 +1506,3 @@ txtime_show (struct device *dev, char *b
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1514,3 +1514,3 @@ txtime_write (struct device *dev, const
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1525,3 +1525,3 @@ txpend_show (struct device *dev, char *b
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1533,3 +1533,3 @@ txpend_write (struct device *dev, const
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1544,3 +1544,3 @@ txmpnd_show (struct device *dev, char *b
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1552,3 +1552,3 @@ txmpnd_write (struct device *dev, const
{
-    struct netiucv_priv *priv = dev->driver_data;
+    struct netiucv_priv *priv = dev_get_drvdata(dev);

@@ -1646,3 +1646,3 @@ netiucv_register_device(struct net_devic
         goto out_unreg;
-    dev->driver_data = priv;
+    dev_set_drvdata(dev,priv);
     priv->dev = dev;
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/net/qeth.h
linux-2.6.6-new/drivers/s390/net/qeth.h
--- linux-2.6.6-orig/drivers/s390/net/qeth.h    2004-05-10
04:31:58.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/net/qeth.h    2004-05-26
16:44:56.000000000 +0200
@@ -165,4 +165,3 @@ extern struct ccwgroup_driver qeth_ccwgr
#define CARD_FROM_CDEV(cdev) (struct qeth_card *) \
-        ((struct ccwgroup_device *)cdev->dev.driver_data)\
-        ->dev.driver_data;
+    dev_get_drvdata(((struct ccwgroup_device
*)dev_get_drvdata(cdev->dev))->dev);

diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/net/qeth_main.c
linux-2.6.6-new/drivers/s390/net/qeth_main.c
--- linux-2.6.6-orig/drivers/s390/net/qeth_main.c    2004-05-10
04:32:30.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/net/qeth_main.c    2004-05-26
16:55:31.000000000 +0200
@@ -444,3 +444,3 @@ qeth_set_offline(struct ccwgroup_device
{
-    struct qeth_card *card = (struct qeth_card *) cgdev->dev.driver_data;
+    struct qeth_card *card = (struct qeth_card
*)dev_get_drvdata(cgdev->dev);
     enum qeth_card_states recover_flag;
@@ -467,3 +467,3 @@ qeth_remove_device(struct ccwgroup_devic
{
-    struct qeth_card *card = (struct qeth_card *) cgdev->dev.driver_data;
+    struct qeth_card *card = (struct qeth_card
*)dev_get_drvdata(cgdev->dev);
     unsigned long flags;
@@ -490,3 +490,3 @@ qeth_remove_device(struct ccwgroup_devic
     qeth_free_card(card);
-    cgdev->dev.driver_data = NULL;
+    dev_set_drvdata(cgdev->dev,NULL);
     put_device(&cgdev->dev);
@@ -1041,3 +1041,3 @@ qeth_probe_device(struct ccwgroup_device
     }
-    gdev->dev.driver_data = card;
+    dev_set_drvdata(gdev->dev,card);
     card->gdev = gdev;
@@ -6052,3 +6052,3 @@ qeth_set_online(struct ccwgroup_device *
{
-    struct qeth_card *card = gdev->dev.driver_data;
+    struct qeth_card *card = dev_get_drvdata(gdev->dev);
     int rc = 0;
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/net/qeth_proc.c
linux-2.6.6-new/drivers/s390/net/qeth_proc.c
--- linux-2.6.6-orig/drivers/s390/net/qeth_proc.c    2004-05-10
04:32:37.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/net/qeth_proc.c    2004-05-26
16:56:40.000000000 +0200
@@ -121,3 +121,3 @@ qeth_procfile_seq_show(struct seq_file *
         device = list_entry(it, struct device, driver_list);
-        card = device->driver_data;
+        card = dev_get_drvdata(device);
         seq_printf(s, "%s/%s/%s x%02X   %-10s %-14s %-4i ",
@@ -211,3 +211,3 @@ qeth_perf_procfile_seq_show(struct seq_f
     device = list_entry(it, struct device, driver_list);
-    card = device->driver_data;
+    card = dev_get_drvdata(device);
     seq_printf(s, "For card with devnos %s/%s/%s (%s):\n",
@@ -348,3 +348,3 @@ qeth_ipato_procfile_seq_show(struct seq_
     device = list_entry(it, struct device, driver_list);
-    card = device->driver_data;
+    card = dev_get_drvdata(device);

diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/s390/net/qeth_sys.c
linux-2.6.6-new/drivers/s390/net/qeth_sys.c
--- linux-2.6.6-orig/drivers/s390/net/qeth_sys.c    2004-05-10
04:32:38.000000000 +0200
+++ linux-2.6.6-new/drivers/s390/net/qeth_sys.c    2004-05-26
17:03:48.000000000 +0200
@@ -32,3 +32,3 @@ qeth_dev_state_show(struct device *dev,
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     if (!card)
@@ -60,3 +60,3 @@ qeth_dev_chpid_show(struct device *dev,
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     if (!card)
@@ -72,3 +72,3 @@ qeth_dev_if_name_show(struct device *dev
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     if (!card)
@@ -84,3 +84,3 @@ qeth_dev_card_type_show(struct device *d
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     if (!card)
@@ -96,3 +96,3 @@ qeth_dev_portno_show(struct device *dev,
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     if (!card)
@@ -106,3 +106,3 @@ qeth_dev_portno_store(struct device *dev
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -132,3 +132,3 @@ qeth_dev_portname_show(struct device *de
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char portname[9] = {0, };
@@ -149,3 +149,3 @@ qeth_dev_portname_store(struct device *d
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -180,3 +180,3 @@ qeth_dev_checksum_show(struct device *de
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -191,3 +191,3 @@ qeth_dev_checksum_store(struct device *d
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -221,3 +221,3 @@ qeth_dev_prioqing_show(struct device *de
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -240,3 +240,3 @@ qeth_dev_prioqing_store(struct device *d
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -283,3 +283,3 @@ qeth_dev_bufcnt_show(struct device *dev,
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -294,3 +294,3 @@ qeth_dev_bufcnt_store(struct device *dev
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -343,3 +343,3 @@ qeth_dev_route4_show(struct device *dev,
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -393,3 +393,3 @@ qeth_dev_route4_store(struct device *dev
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -408,3 +408,3 @@ qeth_dev_route6_show(struct device *dev,
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -422,3 +422,3 @@ qeth_dev_route6_store(struct device *dev
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -444,3 +444,3 @@ qeth_dev_add_hhlen_show(struct device *d
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -455,3 +455,3 @@ qeth_dev_add_hhlen_store(struct device *
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -482,3 +482,3 @@ qeth_dev_fake_ll_show(struct device *dev
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -493,3 +493,3 @@ qeth_dev_fake_ll_store(struct device *de
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -520,3 +520,3 @@ qeth_dev_fake_broadcast_show(struct devi
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -531,3 +531,3 @@ qeth_dev_fake_broadcast_store(struct dev
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -558,3 +558,3 @@ qeth_dev_recover_store(struct device *de
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -580,3 +580,3 @@ qeth_dev_broadcast_mode_show(struct devi
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -597,3 +597,3 @@ qeth_dev_broadcast_mode_store(struct dev
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -635,3 +635,3 @@ qeth_dev_canonical_macaddr_show(struct d
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -652,3 +652,3 @@ qeth_dev_canonical_macaddr_store(struct
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -722,3 +722,3 @@ qeth_dev_ipato_enable_show(struct device
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -733,3 +733,3 @@ qeth_dev_ipato_enable_store(struct devic
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -761,3 +761,3 @@ qeth_dev_ipato_invert4_show(struct devic
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -772,3 +772,3 @@ qeth_dev_ipato_invert4_store(struct devi
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -822,3 +822,3 @@ qeth_dev_ipato_add4_show(struct device *
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -889,3 +889,3 @@ qeth_dev_ipato_add4_store(struct device
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -920,3 +920,3 @@ qeth_dev_ipato_del4_store(struct device
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -935,3 +935,3 @@ qeth_dev_ipato_invert6_show(struct devic
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -946,3 +946,3 @@ qeth_dev_ipato_invert6_store(struct devi
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);
     char *tmp;
@@ -975,3 +975,3 @@ qeth_dev_ipato_add6_show(struct device *
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -986,3 +986,3 @@ qeth_dev_ipato_add6_store(struct device
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1001,3 +1001,3 @@ qeth_dev_ipato_del6_store(struct device
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1058,3 +1058,3 @@ qeth_dev_vipa_add4_show(struct device *d
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1096,3 +1096,3 @@ qeth_dev_vipa_add4_store(struct device *
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1126,3 +1126,3 @@ qeth_dev_vipa_del4_store(struct device *
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1141,3 +1141,3 @@ qeth_dev_vipa_add6_show(struct device *d
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1152,3 +1152,3 @@ qeth_dev_vipa_add6_store(struct device *
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1167,3 +1167,3 @@ qeth_dev_vipa_del6_store(struct device *
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1221,3 +1221,3 @@ qeth_dev_rxip_add4_show(struct device *d
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1259,3 +1259,3 @@ qeth_dev_rxip_add4_store(struct device *
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1289,3 +1289,3 @@ qeth_dev_rxip_del4_store(struct device *
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1304,3 +1304,3 @@ qeth_dev_rxip_add6_show(struct device *d
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1315,3 +1315,3 @@ qeth_dev_rxip_add6_store(struct device *
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

@@ -1330,3 +1330,3 @@ qeth_dev_rxip_del6_store(struct device *
{
-    struct qeth_card *card = dev->driver_data;
+    struct qeth_card *card = dev_get_drvdata(dev);

diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/scsi/aha1740.c
linux-2.6.6-new/drivers/scsi/aha1740.c
--- linux-2.6.6-orig/drivers/scsi/aha1740.c    2004-05-10
04:32:26.000000000 +0200
+++ linux-2.6.6-new/drivers/scsi/aha1740.c    2004-05-26
17:20:27.000000000 +0200
@@ -661,3 +661,3 @@ static __devexit int aha1740_remove (str
{
-    struct Scsi_Host *shpnt = dev->driver_data;
+    struct Scsi_Host *shpnt = dev_get_drvdata(dev);
     struct aha1740_hostdata *host = HOSTDATA (shpnt);
diff -u1 -prN -X dontdiff linux-2.6.6-orig/drivers/usb/core/usb.c
linux-2.6.6-new/drivers/usb/core/usb.c
--- linux-2.6.6-orig/drivers/usb/core/usb.c    2004-05-10
04:32:37.000000000 +0200
+++ linux-2.6.6-new/drivers/usb/core/usb.c    2004-05-26
17:48:40.000000000 +0200
@@ -570,3 +570,3 @@ static int usb_hotplug (struct device *d
     if ((dev->driver == &usb_generic_driver) ||
-        (dev->driver_data == &usb_generic_driver_data))
+        (dev_get_drvdata(dev) == &usb_generic_driver_data))
         return 0;
@@ -712,3 +712,3 @@ usb_alloc_dev(struct usb_device *parent,
     dev->dev.dma_mask = bus->controller->dma_mask;
-    dev->dev.driver_data = &usb_generic_driver_data;
+    dev_set_drvdata(&dev->dev,&usb_generic_driver_data);
     dev->dev.driver = &usb_generic_driver;
@@ -1516,3 +1516,3 @@ static int usb_device_suspend(struct dev
         (dev->driver == &usb_generic_driver) ||
-        (dev->driver_data == &usb_generic_driver_data))
+        (dev_get_drvdata(dev) == &usb_generic_driver_data))
         return 0;
@@ -1534,3 +1534,3 @@ static int usb_device_resume(struct devi
         (dev->driver == &usb_generic_driver) ||
-        (dev->driver_data == &usb_generic_driver_data))
+        (dev_get_drvdata(dev) == &usb_generic_driver_data))
         return 0;
diff -u1 -prN -X dontdiff
linux-2.6.6-orig/drivers/usb/gadget/pxa2xx_udc.c
linux-2.6.6-new/drivers/usb/gadget/pxa2xx_udc.c
--- linux-2.6.6-orig/drivers/usb/gadget/pxa2xx_udc.c    2004-05-10
04:32:52.000000000 +0200
+++ linux-2.6.6-new/drivers/usb/gadget/pxa2xx_udc.c    2004-05-26
17:14:32.000000000 +0200
@@ -2518,3 +2518,3 @@ static int __exit pxa2xx_udc_remove(stru
{
-    struct pxa2xx_udc *dev = _dev->driver_data;
+    struct pxa2xx_udc *dev = dev_get_drvdata(_dev);

diff -u1 -prN -X dontdiff linux-2.6.6-orig/include/linux/eisa.h
linux-2.6.6-new/include/linux/eisa.h
--- linux-2.6.6-orig/include/linux/eisa.h    2004-05-10
04:33:12.000000000 +0200
+++ linux-2.6.6-new/include/linux/eisa.h    2004-05-28
12:53:20.000000000 +0200
@@ -76,3 +76,3 @@ static inline void *eisa_get_drvdata (st
{
-        return edev->dev.driver_data;
+  return dev_get_drvdata(edev->dev);
}
@@ -81,3 +81,3 @@ static inline void eisa_set_drvdata (str
{
-        edev->dev.driver_data = data;
+  dev_set_drvdata(edev->dev,data);
}



--===============24772991506543818==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24772991506543818==--
