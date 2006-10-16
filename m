From: Andi Drebes <lists-receive@programmierforen.de>
Date: Mon, 16 Oct 2006 14:33:26 +0000
Subject: [KJ] [PATCH] drivers/ata/sata_svw.c: Compiler-noise reduction
Message-Id: <200610161633.27006.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610152239.50411.webmaster@programmierforen.de>
In-Reply-To: <200610152239.50411.webmaster@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

During the compilation of the latest kernel-source from the git repository, I 
got those warnings:

drivers/ata/sata_svw.c: In function `k2_sata_tf_load':
drivers/ata/sata_svw.c:114: warning: passing arg 2 of `writeb' makes pointer from integer without a cast
drivers/ata/sata_svw.c:119: warning: passing arg 2 of `writew' makes pointer from integer without a cast
...
drivers/ata/sata_svw.c:133: warning: passing arg 2 of `writeb' makes pointer from integer without a cast
drivers/ata/sata_svw.c: In function `k2_sata_tf_read':
drivers/ata/sata_svw.c:145: warning: passing arg 1 of `readw' makes pointer from integer without a cast
drivers/ata/sata_svw.c:146: warning: passing arg 1 of `readw' makes pointer from integer without a cast
...
drivers/ata/sata_svw.c:150: warning: passing arg 1 of `readw' makes pointer from integer without a cast

readw and writeb take a volatile void __iomem*, but the variables that are passed in k2_sata_tf_load
and k2_sata_tf_read to writeb/readb are unsigned longs. Should the definition in libata.h be changed?

Here's a patch that reduces the noise during compilation. I'm not sure if this is the right way. The patch
is only tested by compilation (I don't have any SATA hardware here).

Signed-off-by: Andi Drebes <webmaster@programmierforen.de>

---
diff --git a/drivers/ata/sata_svw.c b/drivers/ata/sata_svw.c
index db32d15..502cf70 100644
--- a/drivers/ata/sata_svw.c
+++ b/drivers/ata/sata_svw.c
@@ -111,26 +111,26 @@ static void k2_sata_tf_load(struct ata_p
 	unsigned int is_addr = tf->flags & ATA_TFLAG_ISADDR;
 
 	if (tf->ctl != ap->last_ctl) {
-		writeb(tf->ctl, ioaddr->ctl_addr);
+		writeb(tf->ctl, (void __iomem*)ioaddr->ctl_addr);
 		ap->last_ctl = tf->ctl;
 		ata_wait_idle(ap);
 	}
 	if (is_addr && (tf->flags & ATA_TFLAG_LBA48)) {
-		writew(tf->feature | (((u16)tf->hob_feature) << 8), ioaddr->feature_addr);
-		writew(tf->nsect | (((u16)tf->hob_nsect) << 8), ioaddr->nsect_addr);
-		writew(tf->lbal | (((u16)tf->hob_lbal) << 8), ioaddr->lbal_addr);
-		writew(tf->lbam | (((u16)tf->hob_lbam) << 8), ioaddr->lbam_addr);
-		writew(tf->lbah | (((u16)tf->hob_lbah) << 8), ioaddr->lbah_addr);
+		writew(tf->feature | (((u16)tf->hob_feature) << 8), (void __iomem*)ioaddr->feature_addr);
+		writew(tf->nsect | (((u16)tf->hob_nsect) << 8), (void __iomem*)ioaddr->nsect_addr);
+		writew(tf->lbal | (((u16)tf->hob_lbal) << 8), (void __iomem*)ioaddr->lbal_addr);
+		writew(tf->lbam | (((u16)tf->hob_lbam) << 8), (void __iomem*)ioaddr->lbam_addr);
+		writew(tf->lbah | (((u16)tf->hob_lbah) << 8), (void __iomem*)ioaddr->lbah_addr);
 	} else if (is_addr) {
-		writew(tf->feature, ioaddr->feature_addr);
-		writew(tf->nsect, ioaddr->nsect_addr);
-		writew(tf->lbal, ioaddr->lbal_addr);
-		writew(tf->lbam, ioaddr->lbam_addr);
-		writew(tf->lbah, ioaddr->lbah_addr);
+		writew(tf->feature, (void __iomem*)ioaddr->feature_addr);
+		writew(tf->nsect, (void __iomem*)ioaddr->nsect_addr);
+		writew(tf->lbal, (void __iomem*)ioaddr->lbal_addr);
+		writew(tf->lbam, (void __iomem*)ioaddr->lbam_addr);
+		writew(tf->lbah, (void __iomem*)ioaddr->lbah_addr);
 	}
 
 	if (tf->flags & ATA_TFLAG_DEVICE)
-		writeb(tf->device, ioaddr->device_addr);
+		writeb(tf->device, (void __iomem*)ioaddr->device_addr);
 
 	ata_wait_idle(ap);
 }
@@ -142,12 +142,12 @@ static void k2_sata_tf_read(struct ata_p
 	u16 nsect, lbal, lbam, lbah, feature;
 
 	tf->command = k2_stat_check_status(ap);
-	tf->device = readw(ioaddr->device_addr);
-	feature = readw(ioaddr->error_addr);
-	nsect = readw(ioaddr->nsect_addr);
-	lbal = readw(ioaddr->lbal_addr);
-	lbam = readw(ioaddr->lbam_addr);
-	lbah = readw(ioaddr->lbah_addr);
+	tf->device = readw((void __iomem*)ioaddr->device_addr);
+	feature = readw((void __iomem*)ioaddr->error_addr);
+	nsect = readw((void __iomem*)ioaddr->nsect_addr);
+	lbal = readw((void __iomem*)ioaddr->lbal_addr);
+	lbam = readw((void __iomem*)ioaddr->lbam_addr);
+	lbah = readw((void __iomem*)ioaddr->lbah_addr);
 
 	tf->feature = feature;
 	tf->nsect = nsect;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
