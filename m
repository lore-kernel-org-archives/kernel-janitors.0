From: "Denver Gingerich" <denver@ossguy.com>
Date: Thu, 10 May 2007 01:22:58 +0000
Subject: [KJ] [PATCH] fix compiler warnings in acorn.c
Message-Id: <6defe8840705091822s3e99e73l2d8aaaa328fd24da@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Correct the following compiler warnings:
warning: 'adfs_partition' defined but not used
warning: 'riscix_partition' defined but not used
warning: 'linux_partition' defined but not used

Signed-off-by: Denver Gingerich <denver@ossguy.com>

---

--- linux-2.6.21/fs/partitions/acorn.c.000	2007-05-09 18:56:41.000000000 -0400
+++ linux-2.6.21/fs/partitions/acorn.c	2007-05-09 20:44:04.000000000 -0400
@@ -25,6 +25,8 @@
 #define PARTITION_RISCIX_SCSI	2
 #define PARTITION_LINUX		9

+#if defined(CONFIG_ACORN_PARTITION_CUMANA) || \
+	defined(CONFIG_ACORN_PARTITION_ADFS)
 static struct adfs_discrecord *
 adfs_partition(struct parsed_partitions *state, char *name, char *data,
 	       unsigned long first_sector, int slot)
@@ -48,6 +50,7 @@ adfs_partition(struct parsed_partitions
 	put_partition(state, slot, first_sector, nr_sects);
 	return dr;
 }
+#endif

 #ifdef CONFIG_ACORN_PARTITION_RISCIX

@@ -65,6 +68,8 @@ struct riscix_record {
 	struct riscix_part part[8];
 };

+#if defined(CONFIG_ACORN_PARTITION_CUMANA) || \
+	defined(CONFIG_ACORN_PARTITION_ADFS)
 static int
 riscix_partition(struct parsed_partitions *state, struct block_device *bdev,
 		unsigned long first_sect, int slot, unsigned long nr_sects)
@@ -105,6 +110,7 @@ riscix_partition(struct parsed_partition
 	return slot;
 }
 #endif
+#endif

 #define LINUX_NATIVE_MAGIC 0xdeafa1de
 #define LINUX_SWAP_MAGIC   0xdeafab1e
@@ -115,6 +121,8 @@ struct linux_part {
 	__le32 nr_sects;
 };

+#if defined(CONFIG_ACORN_PARTITION_CUMANA) || \
+	defined(CONFIG_ACORN_PARTITION_ADFS)
 static int
 linux_partition(struct parsed_partitions *state, struct block_device *bdev,
 		unsigned long first_sect, int slot, unsigned long nr_sects)
@@ -146,6 +154,7 @@ linux_partition(struct parsed_partitions
 	put_dev_sector(sect);
 	return slot;
 }
+#endif

 #ifdef CONFIG_ACORN_PARTITION_CUMANA
 int
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
