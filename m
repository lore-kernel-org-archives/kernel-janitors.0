From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 01 Mar 2006 23:29:02 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/mtd
Message-Id: <1141255742.16847.0.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72111591577512835=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============72111591577512835==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/mtd to kzalloc usage.
Compile tested with allyes config.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4-mm2/drivers/mtd/onenand/generic.c.orig	2006-02-28 18:55:50.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/onenand/generic.c	2006-02-28 18:56:00.000000000 +0100
@@ -45,12 +45,10 @@ static int __devinit generic_onenand_pro
 	unsigned long size = res->end - res->start + 1;
 	int err;
 
-	info = kmalloc(sizeof(struct onenand_info), GFP_KERNEL);
+	info = kzalloc(sizeof(struct onenand_info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
-	memset(info, 0, sizeof(struct onenand_info));
-
 	if (!request_mem_region(res->start, size, dev->driver->name)) {
 		err = -EBUSY;
 		goto out_free_info;
--- linux-2.6.16-rc4-mm2/drivers/mtd/mtdblock_ro.c.orig	2006-02-28 18:56:12.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/mtdblock_ro.c	2006-02-28 18:56:26.000000000 +0100
@@ -33,13 +33,11 @@ static int mtdblock_writesect(struct mtd
 
 static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 {
-	struct mtd_blktrans_dev *dev = kmalloc(sizeof(*dev), GFP_KERNEL);
+	struct mtd_blktrans_dev *dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 
 	if (!dev)
 		return;
 
-	memset(dev, 0, sizeof(*dev));
-
 	dev->mtd = mtd;
 	dev->devnum = mtd->index;
 	dev->blksize = 512;
--- linux-2.6.16-rc4-mm2/drivers/mtd/mtdblock.c.orig	2006-02-28 18:56:30.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/mtdblock.c	2006-02-28 18:56:49.000000000 +0100
@@ -278,11 +278,10 @@ static int mtdblock_open(struct mtd_blkt
 	}
 
 	/* OK, it's not open. Create cache info for it */
-	mtdblk = kmalloc(sizeof(struct mtdblk_dev), GFP_KERNEL);
+	mtdblk = kzalloc(sizeof(struct mtdblk_dev), GFP_KERNEL);
 	if (!mtdblk)
 		return -ENOMEM;
 
-	memset(mtdblk, 0, sizeof(*mtdblk));
 	mtdblk->count = 1;
 	mtdblk->mtd = mtd;
 
@@ -340,13 +339,11 @@ static int mtdblock_flush(struct mtd_blk
 
 static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 {
-	struct mtd_blktrans_dev *dev = kmalloc(sizeof(*dev), GFP_KERNEL);
+	struct mtd_blktrans_dev *dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 
 	if (!dev)
 		return;
 
-	memset(dev, 0, sizeof(*dev));
-
 	dev->mtd = mtd;
 	dev->devnum = mtd->index;
 	dev->blksize = 512;
--- linux-2.6.16-rc4-mm2/drivers/mtd/chips/cfi_cmdset_0002.c.orig	2006-02-28 18:57:04.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/chips/cfi_cmdset_0002.c	2006-02-28 18:57:15.000000000 +0100
@@ -218,12 +218,11 @@ struct mtd_info *cfi_cmdset_0002(struct 
 	struct mtd_info *mtd;
 	int i;
 
-	mtd = kmalloc(sizeof(*mtd), GFP_KERNEL);
+	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
 	if (!mtd) {
 		printk(KERN_WARNING "Failed to allocate memory for MTD device\n");
 		return NULL;
 	}
-	memset(mtd, 0, sizeof(*mtd));
 	mtd->priv = map;
 	mtd->type = MTD_NORFLASH;
 
--- linux-2.6.16-rc4-mm2/drivers/mtd/chips/amd_flash.c.orig	2006-02-28 18:57:25.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/chips/amd_flash.c	2006-02-28 18:57:43.000000000 +0100
@@ -650,13 +650,12 @@ static struct mtd_info *amd_flash_probe(
 	int reg_idx;
 	int offset;
 
-	mtd = (struct mtd_info*)kmalloc(sizeof(*mtd), GFP_KERNEL);
+	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
 	if (!mtd) {
 		printk(KERN_WARNING
 		       "%s: kmalloc failed for info structure\n", map->name);
 		return NULL;
 	}
-	memset(mtd, 0, sizeof(*mtd));
 	mtd->priv = map;
 
 	memset(&temp, 0, sizeof(temp));
--- linux-2.6.16-rc4-mm2/drivers/mtd/chips/jedec.c.orig	2006-02-28 18:57:53.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/chips/jedec.c	2006-02-28 18:58:15.000000000 +0100
@@ -116,11 +116,10 @@ static struct mtd_info *jedec_probe(stru
    char Part[200];
    memset(&priv,0,sizeof(priv));
 
-   MTD = kmalloc(sizeof(struct mtd_info) + sizeof(struct jedec_private), GFP_KERNEL);
+   MTD = kzalloc(sizeof(struct mtd_info) + sizeof(struct jedec_private), GFP_KERNEL);
    if (!MTD)
 	   return NULL;
 
-   memset(MTD, 0, sizeof(struct mtd_info) + sizeof(struct jedec_private));
    priv = (struct jedec_private *)&MTD[1];
 
    my_bank_size = map->size;
--- linux-2.6.16-rc4-mm2/drivers/mtd/chips/cfi_cmdset_0001.c.orig	2006-02-28 18:58:31.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/chips/cfi_cmdset_0001.c	2006-02-28 18:58:40.000000000 +0100
@@ -344,12 +344,11 @@ struct mtd_info *cfi_cmdset_0001(struct 
 	struct mtd_info *mtd;
 	int i;
 
-	mtd = kmalloc(sizeof(*mtd), GFP_KERNEL);
+	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
 	if (!mtd) {
 		printk(KERN_ERR "Failed to allocate memory for MTD device\n");
 		return NULL;
 	}
-	memset(mtd, 0, sizeof(*mtd));
 	mtd->priv = map;
 	mtd->type = MTD_NORFLASH;
 
--- linux-2.6.16-rc4-mm2/drivers/mtd/chips/gen_probe.c.orig	2006-02-28 18:59:31.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/chips/gen_probe.c	2006-02-28 18:59:52.000000000 +0100
@@ -101,13 +101,12 @@ static struct cfi_private *genprobe_iden
 	 */
 	max_chips = map->size >> cfi.chipshift;
 	mapsize = (max_chips / 8) + ((max_chips % 8) ? 1 : 0);
-	chip_map = kmalloc(mapsize, GFP_KERNEL);
+	chip_map = kzalloc(mapsize, GFP_KERNEL);
 	if (!chip_map) {
 		printk(KERN_WARNING "%s: kmalloc failed for CFI chip map\n", map->name);
 		kfree(cfi.cfiq);
 		return NULL;
 	}
-	memset (chip_map, 0, mapsize);
 
 	set_bit(0, chip_map); /* Mark first chip valid */
 
--- linux-2.6.16-rc4-mm2/drivers/mtd/chips/map_ram.c.orig	2006-02-28 19:00:03.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/chips/map_ram.c	2006-02-28 19:00:14.000000000 +0100
@@ -55,12 +55,10 @@ static struct mtd_info *map_ram_probe(st
 #endif
 	/* OK. It seems to be RAM. */
 
-	mtd = kmalloc(sizeof(*mtd), GFP_KERNEL);
+	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
 	if (!mtd)
 		return NULL;
 
-	memset(mtd, 0, sizeof(*mtd));
-
 	map->fldrv = &mapram_chipdrv;
 	mtd->priv = map;
 	mtd->name = map->name;
--- linux-2.6.16-rc4-mm2/drivers/mtd/chips/map_rom.c.orig	2006-02-28 19:00:44.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/chips/map_rom.c	2006-02-28 19:00:51.000000000 +0100
@@ -31,12 +31,10 @@ static struct mtd_info *map_rom_probe(st
 {
 	struct mtd_info *mtd;
 
-	mtd = kmalloc(sizeof(*mtd), GFP_KERNEL);
+	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
 	if (!mtd)
 		return NULL;
 
-	memset(mtd, 0, sizeof(*mtd));
-
 	map->fldrv = &maprom_chipdrv;
 	mtd->priv = map;
 	mtd->name = map->name;
--- linux-2.6.16-rc4-mm2/drivers/mtd/mtd_blkdevs.c.orig	2006-02-28 19:01:03.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/mtd_blkdevs.c	2006-02-28 19:01:16.000000000 +0100
@@ -372,12 +372,10 @@ int register_mtd_blktrans(struct mtd_blk
 	if (!blktrans_notifier.list.next)
 		register_mtd_user(&blktrans_notifier);
 
-	tr->blkcore_priv = kmalloc(sizeof(*tr->blkcore_priv), GFP_KERNEL);
+	tr->blkcore_priv = kzalloc(sizeof(*tr->blkcore_priv), GFP_KERNEL);
 	if (!tr->blkcore_priv)
 		return -ENOMEM;
 
-	memset(tr->blkcore_priv, 0, sizeof(*tr->blkcore_priv));
-
 	mutex_lock(&mtd_table_mutex);
 
 	ret = register_blkdev(tr->major, tr->name);
--- linux-2.6.16-rc4-mm2/drivers/mtd/afs.c.orig	2006-02-28 19:01:23.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/afs.c	2006-02-28 19:01:38.000000000 +0100
@@ -207,11 +207,10 @@ static int parse_afs_partitions(struct m
 	if (!sz)
 		return ret;
 
-	parts = kmalloc(sz, GFP_KERNEL);
+	parts = kzalloc(sz, GFP_KERNEL);
 	if (!parts)
 		return -ENOMEM;
 
-	memset(parts, 0, sz);
 	str = (char *)(parts + idx);
 
 	/*
--- linux-2.6.16-rc4-mm2/drivers/mtd/devices/pmc551.c.orig	2006-02-28 19:01:47.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/devices/pmc551.c	2006-02-28 19:02:16.000000000 +0100
@@ -712,21 +712,18 @@ static int __init init_pmc551(void)
 			msize = length;
 		}
 
-                mtd = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
+                mtd = kzalloc(sizeof(struct mtd_info), GFP_KERNEL);
                 if (!mtd) {
                         printk(KERN_NOTICE "pmc551: Cannot allocate new MTD device.\n");
                         break;
                 }
 
-                memset(mtd, 0, sizeof(struct mtd_info));
-
-                priv = kmalloc (sizeof(struct mypriv), GFP_KERNEL);
+                priv = kzalloc (sizeof(struct mypriv), GFP_KERNEL);
                 if (!priv) {
                         printk(KERN_NOTICE "pmc551: Cannot allocate new MTD device.\n");
                         kfree(mtd);
                         break;
                 }
-                memset(priv, 0, sizeof(*priv));
                 mtd->priv = priv;
                 priv->dev = PCI_Device;
 
--- linux-2.6.16-rc4-mm2/drivers/mtd/devices/phram.c.orig	2006-02-28 19:02:25.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/devices/phram.c	2006-02-28 19:02:37.000000000 +0100
@@ -126,12 +126,10 @@ static int register_device(char *name, u
 	struct phram_mtd_list *new;
 	int ret = -ENOMEM;
 
-	new = kmalloc(sizeof(*new), GFP_KERNEL);
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
 	if (!new)
 		goto out0;
 
-	memset(new, 0, sizeof(*new));
-
 	ret = -EIO;
 	new->mtd.priv = ioremap(start, len);
 	if (!new->mtd.priv) {
--- linux-2.6.16-rc4-mm2/drivers/mtd/devices/ms02-nv.c.orig	2006-02-28 19:02:45.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/devices/ms02-nv.c	2006-02-28 19:03:31.000000000 +0100
@@ -131,11 +131,10 @@ static int __init ms02nv_init_one(ulong 
 	int ret = -ENODEV;
 
 	/* The module decodes 8MiB of address space. */
-	mod_res = kmalloc(sizeof(*mod_res), GFP_KERNEL);
+	mod_res = kzalloc(sizeof(*mod_res), GFP_KERNEL);
 	if (!mod_res)
 		return -ENOMEM;
 
-	memset(mod_res, 0, sizeof(*mod_res));
 	mod_res->name = ms02nv_name;
 	mod_res->start = addr;
 	mod_res->end = addr + MS02NV_SLOT_SIZE - 1;
@@ -153,24 +152,21 @@ static int __init ms02nv_init_one(ulong 
 	}
 
 	ret = -ENOMEM;
-	mtd = kmalloc(sizeof(*mtd), GFP_KERNEL);
+	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
 	if (!mtd)
 		goto err_out_mod_res_rel;
-	memset(mtd, 0, sizeof(*mtd));
-	mp = kmalloc(sizeof(*mp), GFP_KERNEL);
+	mp = kzalloc(sizeof(*mp), GFP_KERNEL);
 	if (!mp)
 		goto err_out_mtd;
-	memset(mp, 0, sizeof(*mp));
 
 	mtd->priv = mp;
 	mp->resource.module = mod_res;
 
 	/* Firmware's diagnostic NVRAM area. */
-	diag_res = kmalloc(sizeof(*diag_res), GFP_KERNEL);
+	diag_res = kzalloc(sizeof(*diag_res), GFP_KERNEL);
 	if (!diag_res)
 		goto err_out_mp;
 
-	memset(diag_res, 0, sizeof(*diag_res));
 	diag_res->name = ms02nv_res_diag_ram;
 	diag_res->start = addr;
 	diag_res->end = addr + MS02NV_RAM - 1;
@@ -180,11 +176,10 @@ static int __init ms02nv_init_one(ulong 
 	mp->resource.diag_ram = diag_res;
 
 	/* User-available general-purpose NVRAM area. */
-	user_res = kmalloc(sizeof(*user_res), GFP_KERNEL);
+	user_res = kzalloc(sizeof(*user_res), GFP_KERNEL);
 	if (!user_res)
 		goto err_out_diag_res;
 
-	memset(user_res, 0, sizeof(*user_res));
 	user_res->name = ms02nv_res_user_ram;
 	user_res->start = addr + MS02NV_RAM;
 	user_res->end = addr + size - 1;
@@ -194,11 +189,10 @@ static int __init ms02nv_init_one(ulong 
 	mp->resource.user_ram = user_res;
 
 	/* Control and status register. */
-	csr_res = kmalloc(sizeof(*csr_res), GFP_KERNEL);
+	csr_res = kzalloc(sizeof(*csr_res), GFP_KERNEL);
 	if (!csr_res)
 		goto err_out_user_res;
 
-	memset(csr_res, 0, sizeof(*csr_res));
 	csr_res->name = ms02nv_res_csr;
 	csr_res->start = addr + MS02NV_CSR;
 	csr_res->end = addr + MS02NV_CSR + 3;
--- linux-2.6.16-rc4-mm2/drivers/mtd/devices/block2mtd.c.orig	2006-02-28 19:03:44.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/devices/block2mtd.c	2006-02-28 19:04:13.000000000 +0100
@@ -293,10 +293,9 @@ static struct block2mtd_dev *add_device(
 	if (!devname)
 		return NULL;
 
-	dev = kmalloc(sizeof(struct block2mtd_dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(struct block2mtd_dev), GFP_KERNEL);
 	if (!dev)
 		return NULL;
-	memset(dev, 0, sizeof(*dev));
 
 	/* Get a handle on the device */
 	bdev = open_bdev_excl(devname, O_RDWR, NULL);
--- linux-2.6.16-rc4-mm2/drivers/mtd/devices/slram.c.orig	2006-02-28 19:04:23.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/devices/slram.c	2006-02-28 19:05:13.000000000 +0100
@@ -168,19 +168,16 @@ static int register_device(char *name, u
 		E("slram: Cannot allocate new MTD device.\n");
 		return(-ENOMEM);
 	}
-	(*curmtd)->mtdinfo = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
+	(*curmtd)->mtdinfo = kzalloc(sizeof(struct mtd_info), GFP_KERNEL);
 	(*curmtd)->next = NULL;
 
 	if ((*curmtd)->mtdinfo)	{
-		memset((char *)(*curmtd)->mtdinfo, 0, sizeof(struct mtd_info));
 		(*curmtd)->mtdinfo->priv =
-			kmalloc(sizeof(slram_priv_t), GFP_KERNEL);
+			kzalloc(sizeof(slram_priv_t), GFP_KERNEL);
 
 		if (!(*curmtd)->mtdinfo->priv) {
 			kfree((*curmtd)->mtdinfo);
 			(*curmtd)->mtdinfo = NULL;
-		} else {
-			memset((*curmtd)->mtdinfo->priv,0,sizeof(slram_priv_t));
 		}
 	}
 
--- linux-2.6.16-rc4-mm2/drivers/mtd/maps/ceiva.c.orig	2006-02-28 19:05:31.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/maps/ceiva.c	2006-02-28 19:05:48.000000000 +0100
@@ -123,10 +123,9 @@ static int __init clps_setup_mtd(struct 
 	/*
 	 * Allocate the map_info structs in one go.
 	 */
-	maps = kmalloc(sizeof(struct map_info) * nr, GFP_KERNEL);
+	maps = kcalloc(nr, sizeof(struct map_info), GFP_KERNEL);
 	if (!maps)
 		return -ENOMEM;
-	memset(maps, 0, sizeof(struct map_info) * nr);
 	/*
 	 * Claim and then map the memory regions.
 	 */

--- linux-2.6.16-rc4-mm2/drivers/mtd/maps/tqm834x.c.orig	2006-02-28 19:06:59.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/maps/tqm834x.c	2006-02-28 19:07:55.000000000 +0100
@@ -133,20 +133,16 @@ static int __init init_tqm834x_mtd(void)
 
 		pr_debug("%s: chip probing count %d\n", __FUNCTION__, idx);
 
-		map_banks[idx] =
-			(struct map_info *)kmalloc(sizeof(struct map_info),
-						   GFP_KERNEL);
+		map_banks[idx] = kzalloc(sizeof(struct map_info), GFP_KERNEL);
 		if (map_banks[idx] == NULL) {
 			ret = -ENOMEM;
 			goto error_mem;
 		}
-		memset((void *)map_banks[idx], 0, sizeof(struct map_info));
-		map_banks[idx]->name = (char *)kmalloc(16, GFP_KERNEL);
+		map_banks[idx]->name = kzalloc(16, GFP_KERNEL);
 		if (map_banks[idx]->name == NULL) {
 			ret = -ENOMEM;
 			goto error_mem;
 		}
-		memset((void *)map_banks[idx]->name, 0, 16);
 
 		sprintf(map_banks[idx]->name, "TQM834x-%d", idx);
 		map_banks[idx]->size = flash_size;
--- linux-2.6.16-rc4-mm2/drivers/mtd/maps/tqm8xxl.c.orig	2006-02-28 19:08:03.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/maps/tqm8xxl.c	2006-02-28 19:08:30.000000000 +0100
@@ -135,14 +135,13 @@ int __init init_tqm_mtd(void)
 
 		printk(KERN_INFO "%s: chip probing count %d\n", __FUNCTION__, idx);
 
-		map_banks[idx] = (struct map_info *)kmalloc(sizeof(struct map_info), GFP_KERNEL);
+		map_banks[idx] = kzalloc(sizeof(struct map_info), GFP_KERNEL);
 		if(map_banks[idx] == NULL) {
 			ret = -ENOMEM;
 			/* FIXME: What if some MTD devices were probed already? */
 			goto error_mem;
 		}
 
-		memset((void *)map_banks[idx], 0, sizeof(struct map_info));
 		map_banks[idx]->name = (char *)kmalloc(16, GFP_KERNEL);
 
 		if (!map_banks[idx]->name) {
--- linux-2.6.16-rc4-mm2/drivers/mtd/maps/omap_nor.c.orig	2006-02-28 19:08:38.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/maps/omap_nor.c	2006-02-28 19:08:48.000000000 +0100
@@ -78,12 +78,10 @@ static int __devinit omapflash_probe(str
 	struct resource *res = pdev->resource;
 	unsigned long size = res->end - res->start + 1;
 
-	info = kmalloc(sizeof(struct omapflash_info), GFP_KERNEL);
+	info = kzalloc(sizeof(struct omapflash_info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
-	memset(info, 0, sizeof(struct omapflash_info));
-
 	if (!request_mem_region(res->start, size, "flash")) {
 		err = -EBUSY;
 		goto out_free_info;
--- linux-2.6.16-rc4-mm2/drivers/mtd/nand/diskonchip.c.orig	2006-02-28 19:08:59.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/mtd/nand/diskonchip.c	2006-02-28 19:09:21.000000000 +0100
@@ -1645,13 +1645,12 @@ static int __init doc_probe(unsigned lon
 	      sizeof(struct nand_chip) +
 	      sizeof(struct doc_priv) +
 	      (2 * sizeof(struct nand_bbt_descr));
-	mtd =  kmalloc(len, GFP_KERNEL);
+	mtd =  kzalloc(len, GFP_KERNEL);
 	if (!mtd) {
 		printk(KERN_ERR "DiskOnChip kmalloc (%d bytes) failed!\n", len);
 		ret = -ENOMEM;
 		goto fail;
 	}
-	memset(mtd, 0, len);
 
 	nand			= (struct nand_chip *) (mtd + 1);
 	doc			= (struct doc_priv *) (nand + 1);



--===============72111591577512835==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72111591577512835==--
