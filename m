From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 06 Mar 2006 08:10:00 +0000
Subject: [KJ] [Patch] kzalloc() conversion in  arch/arm
Message-Id: <1141632600.9911.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77094540140419521=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============77094540140419521==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts arch/arm to kzalloc usage.
Cross-compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/arch/arm/mach-integrator/integrator_ap.c.orig	2006-03-04 21:31:41.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/arm/mach-integrator/integrator_ap.c	2006-03-04 21:31:52.000000000 +0100
@@ -319,12 +319,10 @@ static void __init ap_init(void)
 		if ((sc_dec & (16 << i)) == 0)
 			continue;
 
-		lmdev = kmalloc(sizeof(struct lm_device), GFP_KERNEL);
+		lmdev = kzalloc(sizeof(struct lm_device), GFP_KERNEL);
 		if (!lmdev)
 			continue;
 
-		memset(lmdev, 0, sizeof(struct lm_device));
-
 		lmdev->resource.start = 0xc0000000 + 0x10000000 * i;
 		lmdev->resource.end = lmdev->resource.start + 0x0fffffff;
 		lmdev->resource.flags = IORESOURCE_MEM;
--- linux-2.6.16-rc5-mm1/arch/arm/mach-integrator/impd1.c.orig	2006-03-04 21:32:01.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/arm/mach-integrator/impd1.c	2006-03-04 21:32:31.000000000 +0100
@@ -355,12 +355,11 @@ static int impd1_probe(struct lm_device 
 	if (!request_mem_region(dev->resource.start, SZ_4K, "LM registers"))
 		return -EBUSY;
 
-	impd1 = kmalloc(sizeof(struct impd1_module), GFP_KERNEL);
+	impd1 = kzalloc(sizeof(struct impd1_module), GFP_KERNEL);
 	if (!impd1) {
 		ret = -ENOMEM;
 		goto release_lm;
 	}
-	memset(impd1, 0, sizeof(struct impd1_module));
 
 	impd1->base = ioremap(dev->resource.start, SZ_4K);
 	if (!impd1->base) {
@@ -389,12 +388,10 @@ static int impd1_probe(struct lm_device 
 
 		pc_base = dev->resource.start + idev->offset;
 
-		d = kmalloc(sizeof(struct amba_device), GFP_KERNEL);
+		d = kzalloc(sizeof(struct amba_device), GFP_KERNEL);
 		if (!d)
 			continue;
 
-		memset(d, 0, sizeof(struct amba_device));
-
 		snprintf(d->dev.bus_id, sizeof(d->dev.bus_id),
 			 "lm%x:%5.5lx", dev->id, idev->offset >> 12);
 
--- linux-2.6.16-rc5-mm1/arch/arm/kernel/bios32.c.orig	2006-03-04 21:33:54.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/arm/kernel/bios32.c	2006-03-04 21:34:33.000000000 +0100
@@ -540,12 +540,10 @@ static void __init pcibios_init_hw(struc
 	int nr, busnr;
 
 	for (nr = busnr = 0; nr < hw->nr_controllers; nr++) {
-		sys = kmalloc(sizeof(struct pci_sys_data), GFP_KERNEL);
+		sys = kzalloc(sizeof(struct pci_sys_data), GFP_KERNEL);
 		if (!sys)
 			panic("PCI: unable to allocate sys data!");
 
-		memset(sys, 0, sizeof(struct pci_sys_data));
-
 		sys->hw      = hw;
 		sys->busnr   = busnr;
 		sys->swizzle = hw->swizzle;
--- linux-2.6.16-rc5-mm1/arch/arm/kernel/apm.c.orig	2006-03-04 21:34:41.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/arm/kernel/apm.c	2006-03-04 21:35:04.000000000 +0100
@@ -357,10 +357,8 @@ static int apm_open(struct inode * inode
 {
 	struct apm_user *as;
 
-	as = (struct apm_user *)kmalloc(sizeof(*as), GFP_KERNEL);
+	as = (struct apm_user *)kzalloc(sizeof(*as), GFP_KERNEL);
 	if (as) {
-		memset(as, 0, sizeof(*as));
-
 		/*
 		 * XXX - this is a tiny bit broken, when we consider BSD
 		 * process accounting. If the device is opened by root, we
--- linux-2.6.16-rc5-mm1/arch/arm/mach-iop3xx/iq31244-pci.c.orig	2006-03-04 21:38:19.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/arm/mach-iop3xx/iq31244-pci.c	2006-03-04 21:38:30.000000000 +0100
@@ -74,12 +74,10 @@ static int iq31244_setup(int nr, struct 
 	if(nr != 0)
 		return 0;
 
-	res = kmalloc(sizeof(struct resource) * 2, GFP_KERNEL);
+	res = kzalloc(sizeof(struct resource) * 2, GFP_KERNEL);
 	if (!res)
 		panic("PCI: unable to alloc resources");
 
-	memset(res, 0, sizeof(struct resource) * 2);
-
 	res[0].start = IOP321_PCI_LOWER_IO_VA;
 	res[0].end   = IOP321_PCI_UPPER_IO_VA;
 	res[0].name  = "IQ31244 PCI I/O Space";
--- linux-2.6.16-rc5-mm1/arch/arm/mach-iop3xx/iq80332-pci.c.orig	2006-03-04 21:38:47.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/arm/mach-iop3xx/iq80332-pci.c	2006-03-04 21:38:56.000000000 +0100
@@ -70,12 +70,10 @@ static int iq80332_setup(int nr, struct 
 	if(nr != 0)
 		return 0;
 
-	res = kmalloc(sizeof(struct resource) * 2, GFP_KERNEL);
+	res = kzalloc(sizeof(struct resource) * 2, GFP_KERNEL);
 	if (!res)
 		panic("PCI: unable to alloc resources");
 
-	memset(res, 0, sizeof(struct resource) * 2);
-
 	res[0].start = IOP331_PCI_LOWER_IO_VA;
 	res[0].end   = IOP331_PCI_UPPER_IO_VA;
 	res[0].name  = "IQ80332 PCI I/O Space";
--- linux-2.6.16-rc5-mm1/arch/arm/mach-iop3xx/iq80321-pci.c.orig	2006-03-04 21:39:06.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/arm/mach-iop3xx/iq80321-pci.c	2006-03-04 21:39:14.000000000 +0100
@@ -68,12 +68,10 @@ static int iq80321_setup(int nr, struct 
 	if(nr != 0)
 		return 0;
 
-	res = kmalloc(sizeof(struct resource) * 2, GFP_KERNEL);
+	res = kzalloc(sizeof(struct resource) * 2, GFP_KERNEL);
 	if (!res)
 		panic("PCI: unable to alloc resources");
 
-	memset(res, 0, sizeof(struct resource) * 2);
-
 	res[0].start = IOP321_PCI_LOWER_IO_VA;
 	res[0].end   = IOP321_PCI_UPPER_IO_VA;
 	res[0].name  = "IQ80321 PCI I/O Space";
--- linux-2.6.16-rc5-mm1/arch/arm/mach-iop3xx/iq80331-pci.c.orig	2006-03-04 21:39:21.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/arm/mach-iop3xx/iq80331-pci.c	2006-03-04 21:39:29.000000000 +0100
@@ -64,12 +64,10 @@ static int iq80331_setup(int nr, struct 
 	if(nr != 0)
 		return 0;
 
-	res = kmalloc(sizeof(struct resource) * 2, GFP_KERNEL);
+	res = kzalloc(sizeof(struct resource) * 2, GFP_KERNEL);
 	if (!res)
 		panic("PCI: unable to alloc resources");
 
-	memset(res, 0, sizeof(struct resource) * 2);
-
 	res[0].start = IOP331_PCI_LOWER_IO_VA;
 	res[0].end   = IOP331_PCI_UPPER_IO_VA;
 	res[0].name  = "IQ80331 PCI I/O Space";
--- linux-2.6.16-rc5-mm1/arch/arm/common/sa1111.c.orig	2006-03-04 21:39:42.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/arm/common/sa1111.c	2006-03-04 21:39:58.000000000 +0100
@@ -555,12 +555,11 @@ sa1111_init_one_child(struct sa1111 *sac
 	struct sa1111_dev *dev;
 	int ret;
 
-	dev = kmalloc(sizeof(struct sa1111_dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(struct sa1111_dev), GFP_KERNEL);
 	if (!dev) {
 		ret = -ENOMEM;
 		goto out;
 	}
-	memset(dev, 0, sizeof(struct sa1111_dev));
 
 	snprintf(dev->dev.bus_id, sizeof(dev->dev.bus_id),
 		 "%4.4lx", info->offset);
@@ -635,12 +634,10 @@ __sa1111_probe(struct device *me, struct
 	unsigned int has_devs, val;
 	int i, ret = -ENODEV;
 
-	sachip = kmalloc(sizeof(struct sa1111), GFP_KERNEL);
+	sachip = kzalloc(sizeof(struct sa1111), GFP_KERNEL);
 	if (!sachip)
 		return -ENOMEM;
 
-	memset(sachip, 0, sizeof(struct sa1111));
-
 	spin_lock_init(&sachip->lock);
 
 	sachip->dev = me;
--- linux-2.6.16-rc5-mm1/arch/arm/common/scoop.c.orig	2006-03-04 21:40:08.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/arm/common/scoop.c	2006-03-04 21:40:17.000000000 +0100
@@ -132,12 +132,11 @@ int __init scoop_probe(struct platform_d
 	if (!mem)
 		return -EINVAL;
 
-	devptr = kmalloc(sizeof(struct scoop_dev), GFP_KERNEL);
+	devptr = kzalloc(sizeof(struct scoop_dev), GFP_KERNEL);
 
 	if (!devptr)
 		return  -ENOMEM;
 
-	memset(devptr, 0, sizeof(struct scoop_dev));
 	spin_lock_init(&devptr->scoop_lock);
 
 	inf = pdev->dev.platform_data;
--- linux-2.6.16-rc5-mm1/arch/arm/common/locomo.c.orig	2006-03-04 21:40:24.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/arm/common/locomo.c	2006-03-04 21:40:39.000000000 +0100
@@ -501,12 +501,11 @@ locomo_init_one_child(struct locomo *lch
 	struct locomo_dev *dev;
 	int ret;
 
-	dev = kmalloc(sizeof(struct locomo_dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(struct locomo_dev), GFP_KERNEL);
 	if (!dev) {
 		ret = -ENOMEM;
 		goto out;
 	}
-	memset(dev, 0, sizeof(struct locomo_dev));
 
 	strncpy(dev->dev.bus_id,info->name,sizeof(dev->dev.bus_id));
 	/*
@@ -648,12 +647,10 @@ __locomo_probe(struct device *me, struct
 	unsigned long r;
 	int i, ret = -ENODEV;
 
-	lchip = kmalloc(sizeof(struct locomo), GFP_KERNEL);
+	lchip = kzalloc(sizeof(struct locomo), GFP_KERNEL);
 	if (!lchip)
 		return -ENOMEM;
 
-	memset(lchip, 0, sizeof(struct locomo));
-
 	spin_lock_init(&lchip->lock);
 
 	lchip->dev = me;



--===============77094540140419521==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77094540140419521==--
