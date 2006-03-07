From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 07 Mar 2006 08:53:21 +0000
Subject: [KJ] [Patch] kzalloc() conversion in arch/powerpc
Message-Id: <1141721601.15005.5.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49377418058577183=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141499387.30193.18.camel@alice>
In-Reply-To: <1141499387.30193.18.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============49377418058577183==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts arch/powerpc to kzalloc usage.
Partly tested, didnt get iseries/pseries to compile

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/arch/powerpc/kernel/pci_64.c.orig	2006-03-06 20:41:42.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/powerpc/kernel/pci_64.c	2006-03-06 20:42:18.000000000 +0100
@@ -363,7 +363,7 @@ struct pci_dev *of_create_pci_dev(struct
 	struct pci_dev *dev;
 	const char *type;
 
-	dev = kmalloc(sizeof(struct pci_dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(struct pci_dev), GFP_KERNEL);
 	if (!dev)
 		return NULL;
 	type = get_property(node, "device_type", NULL);
@@ -372,7 +372,6 @@ struct pci_dev *of_create_pci_dev(struct
 
 	DBG("    create device, devfn: %x, type: %s\n", devfn, type);
 
-	memset(dev, 0, sizeof(struct pci_dev));
 	dev->bus = bus;
 	dev->sysdata = node;
 	dev->dev.parent = bus->bridge;
--- linux-2.6.16-rc5-mm1/arch/powerpc/kernel/smp-tbsync.c.orig	2006-03-06 20:42:28.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/powerpc/kernel/smp-tbsync.c	2006-03-06 20:42:52.000000000 +0100
@@ -116,8 +116,7 @@ void __devinit smp_generic_give_timebase
 	printk("Synchronizing timebase\n");
 
 	/* if this fails then this kernel won't work anyway... */
-	tbsync = kmalloc( sizeof(*tbsync), GFP_KERNEL );
-	memset( tbsync, 0, sizeof(*tbsync) );
+	tbsync = kzalloc(sizeof(*tbsync), GFP_KERNEL);
 	mb();
 	running = 1;
 
--- linux-2.6.16-rc5-mm1/arch/powerpc/kernel/ibmebus.c.orig	2006-03-06 20:43:01.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/powerpc/kernel/ibmebus.c	2006-03-06 20:43:10.000000000 +0100
@@ -210,11 +210,10 @@ static struct ibmebus_dev* __devinit ibm
 		return NULL;
 	}
 
-	dev = kmalloc(sizeof(struct ibmebus_dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(struct ibmebus_dev), GFP_KERNEL);
 	if (!dev) {
 		return NULL;
 	}
-	memset(dev, 0, sizeof(struct ibmebus_dev));
 
 	dev->ofdev.node = of_node_get(dn);
        
--- linux-2.6.16-rc5-mm1/arch/powerpc/platforms/iseries/pci.c.orig	2006-03-06 20:43:46.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/powerpc/platforms/iseries/pci.c	2006-03-06 20:44:09.000000000 +0100
@@ -207,10 +207,9 @@ static struct device_node *build_device_
 	struct device_node *node;
 	struct pci_dn *pdn;
 
-	node = kmalloc(sizeof(struct device_node), GFP_KERNEL);
+	node = kzalloc(sizeof(struct device_node), GFP_KERNEL);
 	if (node == NULL)
 		return NULL;
-	memset(node, 0, sizeof(struct device_node));
 	pdn = kzalloc(sizeof(*pdn), GFP_KERNEL);
 	if (pdn == NULL) {
 		kfree(node);
--- linux-2.6.16-rc5-mm1/arch/powerpc/platforms/iseries/vio.c.orig	2006-03-06 20:45:42.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/powerpc/platforms/iseries/vio.c	2006-03-06 20:45:51.000000000 +0100
@@ -53,10 +53,9 @@ static struct vio_dev *__init vio_regist
 	struct vio_dev *viodev;
 
 	/* allocate a vio_dev for this device */
-	viodev = kmalloc(sizeof(struct vio_dev), GFP_KERNEL);
+	viodev = kzalloc(sizeof(struct vio_dev), GFP_KERNEL);
 	if (!viodev)
 		return NULL;
-	memset(viodev, 0, sizeof(struct vio_dev));
 
 	snprintf(viodev->dev.bus_id, BUS_ID_SIZE, "%s%d", type, unit_num);
 
--- linux-2.6.16-rc5-mm1/arch/powerpc/platforms/iseries/iommu.c.orig	2006-03-06 20:45:59.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/powerpc/platforms/iseries/iommu.c	2006-03-06 20:46:18.000000000 +0100
@@ -107,12 +107,10 @@ void iommu_table_getparms_iSeries(unsign
 {
 	struct iommu_table_cb *parms;
 
-	parms = kmalloc(sizeof(*parms), GFP_KERNEL);
+	parms = kzalloc(sizeof(*parms), GFP_KERNEL);
 	if (parms == NULL)
 		panic("PCI_DMA: TCE Table Allocation failed.");
 
-	memset(parms, 0, sizeof(*parms));
-
 	parms->itc_busno = busno;
 	parms->itc_slotno = slotno;
 	parms->itc_virtbus = virtbus;
--- linux-2.6.16-rc5-mm1/arch/powerpc/platforms/pseries/reconfig.c.orig	2006-03-06 20:46:31.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/powerpc/platforms/pseries/reconfig.c	2006-03-06 20:46:47.000000000 +0100
@@ -267,11 +267,10 @@ static char * parse_next_property(char *
 static struct property *new_property(const char *name, const int length,
 				     const unsigned char *value, struct property *last)
 {
-	struct property *new = kmalloc(sizeof(*new), GFP_KERNEL);
+	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);
 
 	if (!new)
 		return NULL;
-	memset(new, 0, sizeof(*new));
 
 	if (!(new->name = kmalloc(strlen(name) + 1, GFP_KERNEL)))
 		goto cleanup;
--- linux-2.6.16-rc5-mm1/arch/powerpc/platforms/pseries/vio.c.orig	2006-03-06 20:46:55.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/powerpc/platforms/pseries/vio.c	2006-03-06 20:47:04.000000000 +0100
@@ -167,11 +167,10 @@ struct vio_dev * __devinit vio_register_
 	}
 
 	/* allocate a vio_dev for this node */
-	viodev = kmalloc(sizeof(struct vio_dev), GFP_KERNEL);
+	viodev = kzalloc(sizeof(struct vio_dev), GFP_KERNEL);
 	if (!viodev) {
 		return NULL;
 	}
-	memset(viodev, 0, sizeof(struct vio_dev));
 
 	viodev->dev.platform_data = of_node_get(of_node);
 



--===============49377418058577183==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49377418058577183==--
