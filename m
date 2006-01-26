From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Thu, 26 Jan 2006 14:39:04 +0000
Subject: [KJ] [PATCH] drivers/mtd: Use ARRAY_SIZE macro
Message-Id: <20060126143904.GA7408@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9552207540657871=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============9552207540657871==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]) and remove
duplicates of the macro.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 drivers/mtd/chips/amd_flash.c      |    4 ++--
 drivers/mtd/chips/jedec_probe.c    |    2 +-
 drivers/mtd/devices/lart.c         |   10 ++++------
 drivers/mtd/devices/ms02-nv.c      |    2 +-
 drivers/mtd/maps/alchemy-flash.c   |    4 +---
 drivers/mtd/maps/cfi_flagadm.c     |    2 +-
 drivers/mtd/maps/dbox2-flash.c     |    2 +-
 drivers/mtd/maps/dilnetpc.c        |    4 ++--
 drivers/mtd/maps/dmv182.c          |    2 +-
 drivers/mtd/maps/h720x-flash.c     |    2 +-
 drivers/mtd/maps/netsc520.c        |    4 ++--
 drivers/mtd/maps/nettel.c          |    3 +--
 drivers/mtd/maps/ocotea.c          |    6 ++----
 drivers/mtd/maps/pcmciamtd.c       |    2 +-
 drivers/mtd/maps/redwood.c         |    3 +--
 drivers/mtd/maps/sbc8240.c         |    8 +++-----
 drivers/mtd/maps/sc520cdp.c        |    2 +-
 drivers/mtd/maps/scx200_docflash.c |    2 +-
 drivers/mtd/maps/sharpsl-flash.c   |    4 +---
 drivers/mtd/maps/ts5500_flash.c    |    2 +-
 drivers/mtd/maps/uclinux.c         |    2 +-
 drivers/mtd/nand/au1550nd.c        |    4 +---
 22 files changed, 31 insertions(+), 45 deletions(-)

diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/chips/amd_flash.c linux-2.6.16-rc1~array_size/drivers/mtd/chips/amd_flash.c
--- linux-2.6.16-rc1/drivers/mtd/chips/amd_flash.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/chips/amd_flash.c	2006-01-24 08:06:20.000000000 +0100
@@ -664,7 +664,7 @@ static struct mtd_info *amd_flash_probe(
 	printk("%s: Probing for AMD compatible flash...\n", map->name);
 
 	if ((table_pos[0] = probe_new_chip(mtd, 0, NULL, &temp, table,
-					   sizeof(table)/sizeof(table[0])))
+					   ARRAY_SIZE(table)))
 	    == -1) {
 		printk(KERN_WARNING
 		       "%s: Found no AMD compatible device at location zero\n",
@@ -696,7 +696,7 @@ static struct mtd_info *amd_flash_probe(
 	     base += (1 << temp.chipshift)) {
 	     	int numchips = temp.numchips;
 		table_pos[numchips] = probe_new_chip(mtd, base, chips,
-			&temp, table, sizeof(table)/sizeof(table[0]));
+			&temp, table, ARRAY_SIZE(table));
 	}
 
 	mtd->eraseregions = kmalloc(sizeof(struct mtd_erase_region_info) *
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/chips/jedec_probe.c linux-2.6.16-rc1~array_size/drivers/mtd/chips/jedec_probe.c
--- linux-2.6.16-rc1/drivers/mtd/chips/jedec_probe.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/chips/jedec_probe.c	2006-01-24 08:06:20.000000000 +0100
@@ -2035,7 +2035,7 @@ static int jedec_probe_chip(struct map_i
 		DEBUG(MTD_DEBUG_LEVEL3,
 		      "Search for id:(%02x %02x) interleave(%d) type(%d)\n",
 			cfi->mfr, cfi->id, cfi_interleave(cfi), cfi->device_type);
-		for (i=0; i<sizeof(jedec_table)/sizeof(jedec_table[0]); i++) {
+		for (i = 0; i < ARRAY_SIZE(jedec_table); i++) {
 			if ( jedec_match( base, map, cfi, &jedec_table[i] ) ) {
 				DEBUG( MTD_DEBUG_LEVEL3,
 				       "MTD %s(): matched device 0x%x,0x%x unlock_addrs: 0x%.4x 0x%.4x\n",
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/devices/lart.c linux-2.6.16-rc1~array_size/drivers/mtd/devices/lart.c
--- linux-2.6.16-rc1/drivers/mtd/devices/lart.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/devices/lart.c	2006-01-24 08:06:20.000000000 +0100
@@ -581,8 +581,6 @@ static int flash_write (struct mtd_info 
 
 /***************************************************************************************************/
 
-#define NB_OF(x) (sizeof (x) / sizeof (x[0]))
-
 static struct mtd_info mtd;
 
 static struct mtd_erase_region_info erase_regions[] = {
@@ -640,7 +638,7 @@ int __init lart_flash_init (void)
    mtd.flags = MTD_CAP_NORFLASH;
    mtd.size = FLASH_BLOCKSIZE_PARAM * FLASH_NUMBLOCKS_16m_PARAM + FLASH_BLOCKSIZE_MAIN * FLASH_NUMBLOCKS_16m_MAIN;
    mtd.erasesize = FLASH_BLOCKSIZE_MAIN;
-   mtd.numeraseregions = NB_OF (erase_regions);
+   mtd.numeraseregions = ARRAY_SIZE(erase_regions);
    mtd.eraseregions = erase_regions;
    mtd.erase = flash_erase;
    mtd.read = flash_read;
@@ -670,9 +668,9 @@ int __init lart_flash_init (void)
 			   result,mtd.eraseregions[result].numblocks);
 
 #ifdef HAVE_PARTITIONS
-   printk ("\npartitions = %d\n",NB_OF (lart_partitions));
+   printk ("\npartitions = %d\n", ARRAY_SIZE(lart_partitions));
 
-   for (result = 0; result < NB_OF (lart_partitions); result++)
+   for (result = 0; result < ARRAY_SIZE(lart_partitions); result++)
 	 printk (KERN_DEBUG
 			 "\n\n"
 			 "lart_partitions[%d].name = %s\n"
@@ -687,7 +685,7 @@ int __init lart_flash_init (void)
 #ifndef HAVE_PARTITIONS
    result = add_mtd_device (&mtd);
 #else
-   result = add_mtd_partitions (&mtd,lart_partitions,NB_OF (lart_partitions));
+   result = add_mtd_partitions (&mtd,lart_partitions, ARRAY_SIZE(lart_partitions));
 #endif
 
    return (result);
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/devices/ms02-nv.c linux-2.6.16-rc1~array_size/drivers/mtd/devices/ms02-nv.c
--- linux-2.6.16-rc1/drivers/mtd/devices/ms02-nv.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/devices/ms02-nv.c	2006-01-25 10:49:17.000000000 +0100
@@ -308,7 +308,7 @@ static int __init ms02nv_init(void)
 		break;
 	}
 
-	for (i = 0; i < (sizeof(ms02nv_addrs) / sizeof(*ms02nv_addrs)); i++)
+	for (i = 0; i < ARRAY_SIZE(ms02nv_addrs); i++)
 		if (!ms02nv_init_one(ms02nv_addrs[i] << stride))
 			count++;
 
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/alchemy-flash.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/alchemy-flash.c
--- linux-2.6.16-rc1/drivers/mtd/maps/alchemy-flash.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/alchemy-flash.c	2006-01-24 08:06:20.000000000 +0100
@@ -126,8 +126,6 @@ static struct mtd_partition alchemy_part
         }
 };
 
-#define NB_OF(x)  (sizeof(x)/sizeof(x[0]))
-
 static struct mtd_info *mymtd;
 
 int __init alchemy_mtd_init(void)
@@ -154,7 +152,7 @@ int __init alchemy_mtd_init(void)
 	 * Static partition definition selection
 	 */
 	parts = alchemy_partitions;
-	nb_parts = NB_OF(alchemy_partitions);
+	nb_parts = ARRAY_SIZE(alchemy_partitions);
 	alchemy_map.size = window_size;
 
 	/*
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/cfi_flagadm.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/cfi_flagadm.c
--- linux-2.6.16-rc1/drivers/mtd/maps/cfi_flagadm.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/cfi_flagadm.c	2006-01-26 13:52:23.000000000 +0100
@@ -86,7 +86,7 @@ struct mtd_partition flagadm_parts[] = {
 	}
 };
 
-#define PARTITION_COUNT (sizeof(flagadm_parts)/sizeof(struct mtd_partition))
+#define PARTITION_COUNT ARRAY_SIZE(flagadm_parts)
 
 static struct mtd_info *mymtd;
 
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/dbox2-flash.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/dbox2-flash.c
--- linux-2.6.16-rc1/drivers/mtd/maps/dbox2-flash.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/dbox2-flash.c	2006-01-24 08:06:20.000000000 +0100
@@ -57,7 +57,7 @@ static struct mtd_partition partition_in
 	}
 };
 
-#define NUM_PARTITIONS (sizeof(partition_info) / sizeof(partition_info[0]))
+#define NUM_PARTITIONS ARRAY_SIZE(partition_info)
 
 #define WINDOW_ADDR 0x10000000
 #define WINDOW_SIZE 0x800000
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/dilnetpc.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/dilnetpc.c
--- linux-2.6.16-rc1/drivers/mtd/maps/dilnetpc.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/dilnetpc.c	2006-01-24 08:06:20.000000000 +0100
@@ -300,7 +300,7 @@ static struct mtd_partition partition_in
 	},
 };
 
-#define NUM_PARTITIONS (sizeof(partition_info)/sizeof(partition_info[0]))
+#define NUM_PARTITIONS ARRAY_SIZE(partition_info)
 
 static struct mtd_info *mymtd;
 static struct mtd_info *lowlvl_parts[NUM_PARTITIONS];
@@ -345,7 +345,7 @@ static struct mtd_partition higlvl_parti
 	},
 };
 
-#define NUM_HIGHLVL_PARTITIONS (sizeof(higlvl_partition_info)/sizeof(partition_info[0]))
+#define NUM_HIGHLVL_PARTITIONS ARRAY_SIZE(higlvl_partition_info)
 
 
 static int dnp_adnp_probe(void)
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/dmv182.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/dmv182.c
--- linux-2.6.16-rc1/drivers/mtd/maps/dmv182.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/dmv182.c	2006-01-26 14:36:54.000000000 +0100
@@ -99,7 +99,7 @@ static struct mtd_info *this_mtd;
 static int __init init_svme182(void)
 {
 	struct mtd_partition *partitions;
-	int num_parts = sizeof(svme182_partitions) / sizeof(struct mtd_partition);
+	int num_parts = ARRAY_SIZE(svme182_partitions);
 
 	partitions = svme182_partitions;
 
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/h720x-flash.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/h720x-flash.c
--- linux-2.6.16-rc1/drivers/mtd/maps/h720x-flash.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/h720x-flash.c	2006-01-24 08:06:20.000000000 +0100
@@ -59,7 +59,7 @@ static struct mtd_partition h720x_partit
         }
 };
 
-#define NUM_PARTITIONS  (sizeof(h720x_partitions)/sizeof(h720x_partitions[0]))
+#define NUM_PARTITIONS ARRAY_SIZE(h720x_partitions)
 
 static int                   nr_mtd_parts;
 static struct mtd_partition *mtd_parts;
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/netsc520.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/netsc520.c
--- linux-2.6.16-rc1/drivers/mtd/maps/netsc520.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/netsc520.c	2006-01-26 14:42:05.000000000 +0100
@@ -76,7 +76,7 @@ static struct mtd_partition partition_in
 	    .size = 0x80000
     },
 };
-#define NUM_PARTITIONS (sizeof(partition_info)/sizeof(partition_info[0]))
+#define NUM_PARTITIONS ARRAY_SIZE(partition_info)
 
 #define WINDOW_SIZE	0x00100000
 #define WINDOW_ADDR	0x00200000
@@ -88,7 +88,7 @@ static struct map_info netsc520_map = {
 	.phys = WINDOW_ADDR,
 };
 
-#define NUM_FLASH_BANKS	(sizeof(netsc520_map)/sizeof(struct map_info))
+#define NUM_FLASH_BANKS	ARRAY_SIZE(netsc520_map)
 
 static struct mtd_info *mymtd;
 
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/nettel.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/nettel.c
--- linux-2.6.16-rc1/drivers/mtd/maps/nettel.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/nettel.c	2006-01-24 08:06:20.000000000 +0100
@@ -128,8 +128,7 @@ static struct mtd_partition nettel_amd_p
 	}
 };
 
-#define NUM_AMD_PARTITIONS \
-	(sizeof(nettel_amd_partitions)/sizeof(nettel_amd_partitions[0]))
+#define NUM_AMD_PARTITIONS ARRAY_SIZE(nettel_amd_partitions)
 
 /****************************************************************************/
 
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/ocotea.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/ocotea.c
--- linux-2.6.16-rc1/drivers/mtd/maps/ocotea.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/ocotea.c	2006-01-24 08:06:20.000000000 +0100
@@ -58,8 +58,6 @@ static struct mtd_partition ocotea_large
 	}
 };
 
-#define NB_OF(x)  (sizeof(x)/sizeof(x[0]))
-
 int __init init_ocotea(void)
 {
 	u8 fpga0_reg;
@@ -97,7 +95,7 @@ int __init init_ocotea(void)
 	if (flash) {
 		flash->owner = THIS_MODULE;
 		add_mtd_partitions(flash, ocotea_small_partitions,
-					NB_OF(ocotea_small_partitions));
+					ARRAY_SIZE(ocotea_small_partitions));
 	} else {
 		printk("map probe failed for flash\n");
 		return -ENXIO;
@@ -118,7 +116,7 @@ int __init init_ocotea(void)
 	if (flash) {
 		flash->owner = THIS_MODULE;
 		add_mtd_partitions(flash, ocotea_large_partitions,
-					NB_OF(ocotea_large_partitions));
+					ARRAY_SIZE(ocotea_large_partitions));
 	} else {
 		printk("map probe failed for flash\n");
 		return -ENXIO;
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/pcmciamtd.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/pcmciamtd.c
--- linux-2.6.16-rc1/drivers/mtd/maps/pcmciamtd.c	2006-01-24 08:04:10.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/pcmciamtd.c	2006-01-26 14:40:14.000000000 +0100
@@ -616,7 +616,7 @@ static void pcmciamtd_config(dev_link_t 
 	} else if(mem_type == 2) {
 		mtd = do_map_probe("map_rom", &dev->pcmcia_map);
 	} else {
-		for(i = 0; i < sizeof(probes) / sizeof(char *); i++) {
+		for(i = 0; i < ARRAY_SIZE(probes); i++) {
 			DEBUG(1, "Trying %s", probes[i]);
 			mtd = do_map_probe(probes[i], &dev->pcmcia_map);
 			if(mtd)
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/redwood.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/redwood.c
--- linux-2.6.16-rc1/drivers/mtd/maps/redwood.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/redwood.c	2006-01-24 08:06:20.000000000 +0100
@@ -121,8 +121,7 @@ struct map_info redwood_flash_map = {
 };
 
 
-#define NUM_REDWOOD_FLASH_PARTITIONS \
-	(sizeof(redwood_flash_partitions)/sizeof(redwood_flash_partitions[0]))
+#define NUM_REDWOOD_FLASH_PARTITIONS ARRAY_SIZE(redwood_flash_partitions)
 
 static struct mtd_info *redwood_mtd;
 
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/sbc8240.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/sbc8240.c
--- linux-2.6.16-rc1/drivers/mtd/maps/sbc8240.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/sbc8240.c	2006-01-26 14:41:42.000000000 +0100
@@ -66,7 +66,7 @@ static struct map_info sbc8240_map[2] = 
 	}
 };
 
-#define NUM_FLASH_BANKS	(sizeof(sbc8240_map) / sizeof(struct map_info))
+#define NUM_FLASH_BANKS	ARRAY_SIZE(sbc8240_map)
 
 /*
  * The following defines the partition layout of SBC8240 boards.
@@ -125,8 +125,6 @@ static struct mtd_partition sbc8240_fs_p
 	}
 };
 
-#define NB_OF(x) (sizeof (x) / sizeof (x[0]))
-
 /* trivial struct to describe partition information */
 struct mtd_part_def
 {
@@ -190,10 +188,10 @@ int __init init_sbc8240_mtd (void)
 #ifdef CONFIG_MTD_PARTITIONS
 	sbc8240_part_banks[0].mtd_part   = sbc8240_uboot_partitions;
 	sbc8240_part_banks[0].type       = "static image";
-	sbc8240_part_banks[0].nums       = NB_OF(sbc8240_uboot_partitions);
+	sbc8240_part_banks[0].nums       = ARRAY_SIZE(sbc8240_uboot_partitions);
 	sbc8240_part_banks[1].mtd_part   = sbc8240_fs_partitions;
 	sbc8240_part_banks[1].type       = "static file system";
-	sbc8240_part_banks[1].nums       = NB_OF(sbc8240_fs_partitions);
+	sbc8240_part_banks[1].nums       = ARRAY_SIZE(sbc8240_fs_partitions);
 
 	for (i = 0; i < NUM_FLASH_BANKS; i++) {
 
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/sc520cdp.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/sc520cdp.c
--- linux-2.6.16-rc1/drivers/mtd/maps/sc520cdp.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/sc520cdp.c	2006-01-26 14:41:16.000000000 +0100
@@ -107,7 +107,7 @@ static struct map_info sc520cdp_map[] = 
 	},
 };
 
-#define NUM_FLASH_BANKS	(sizeof(sc520cdp_map)/sizeof(struct map_info))
+#define NUM_FLASH_BANKS	ARRAY_SIZE(sc520cdp_map)
 
 static struct mtd_info *mymtd[NUM_FLASH_BANKS];
 static struct mtd_info *merged_mtd;
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/scx200_docflash.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/scx200_docflash.c
--- linux-2.6.16-rc1/drivers/mtd/maps/scx200_docflash.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/scx200_docflash.c	2006-01-24 08:06:20.000000000 +0100
@@ -70,7 +70,7 @@ static struct mtd_partition partition_in
 		.size   = 0x80000
 	},
 };
-#define NUM_PARTITIONS (sizeof(partition_info)/sizeof(partition_info[0]))
+#define NUM_PARTITIONS ARRAY_SIZE(partition_info)
 #endif
 
 
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/sharpsl-flash.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/sharpsl-flash.c
--- linux-2.6.16-rc1/drivers/mtd/maps/sharpsl-flash.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/sharpsl-flash.c	2006-01-24 08:06:20.000000000 +0100
@@ -49,8 +49,6 @@ static struct mtd_partition sharpsl_part
 	}
 };
 
-#define NB_OF(x)  (sizeof(x)/sizeof(x[0]))
-
 int __init init_sharpsl(void)
 {
 	struct mtd_partition *parts;
@@ -92,7 +90,7 @@ int __init init_sharpsl(void)
 	}
 
 	parts = sharpsl_partitions;
-	nb_parts = NB_OF(sharpsl_partitions);
+	nb_parts = ARRAY_SIZE(sharpsl_partitions);
 
 	printk(KERN_NOTICE "Using %s partision definition\n", part_type);
 	add_mtd_partitions(mymtd, parts, nb_parts);
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/ts5500_flash.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/ts5500_flash.c
--- linux-2.6.16-rc1/drivers/mtd/maps/ts5500_flash.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/ts5500_flash.c	2006-01-26 14:37:29.000000000 +0100
@@ -64,7 +64,7 @@ static struct mtd_partition ts5500_parti
 	}
 };
 
-#define NUM_PARTITIONS (sizeof(ts5500_partitions)/sizeof(struct mtd_partition))
+#define NUM_PARTITIONS ARRAY_SIZE(ts5500_partitions)
 
 static struct mtd_info *mymtd;
 
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/maps/uclinux.c linux-2.6.16-rc1~array_size/drivers/mtd/maps/uclinux.c
--- linux-2.6.16-rc1/drivers/mtd/maps/uclinux.c	2006-01-03 14:41:56.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/maps/uclinux.c	2006-01-24 08:06:20.000000000 +0100
@@ -37,7 +37,7 @@ struct mtd_partition uclinux_romfs[] = {
 	{ .name = "ROMfs" }
 };
 
-#define	NUM_PARTITIONS	(sizeof(uclinux_romfs) / sizeof(uclinux_romfs[0]))
+#define	NUM_PARTITIONS	ARRAY_SIZE(uclinux_romfs)
 
 /****************************************************************************/
 
diff -X dontdiff -urpN linux-2.6.16-rc1/drivers/mtd/nand/au1550nd.c linux-2.6.16-rc1~array_size/drivers/mtd/nand/au1550nd.c
--- linux-2.6.16-rc1/drivers/mtd/nand/au1550nd.c	2006-01-24 08:04:10.000000000 +0100
+++ linux-2.6.16-rc1~array_size/drivers/mtd/nand/au1550nd.c	2006-01-24 08:06:20.000000000 +0100
@@ -55,8 +55,6 @@ static const struct mtd_partition partit
  		.size 	=    MTDPART_SIZ_FULL
 	}
 };
-#define NB_OF(x)  (sizeof(x)/sizeof(x[0]))
-
 
 /**
  * au_read_byte -  read one byte from the chip
@@ -462,7 +460,7 @@ int __init au1xxx_nand_init (void)
 	}
 
 	/* Register the partitions */
-	add_mtd_partitions(au1550_mtd, partition_info, NB_OF(partition_info));
+	add_mtd_partitions(au1550_mtd, partition_info, ARRAY_SIZE(partition_info));
 
 	return 0;
 

--===============9552207540657871==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9552207540657871==--
