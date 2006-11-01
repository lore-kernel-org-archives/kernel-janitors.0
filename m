From: "Mike D. Day" <ncmike@us.ibm.com>
Date: Wed, 01 Nov 2006 21:20:08 +0000
Subject: [KJ] [PATCH] ata: remove compiler warnings
Message-Id: <20061101212008.GB5176@silverwood.ncultra.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linux-ide@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeff Garzik <jgarzik@pobox.com>

remove compiler warnings by typecasting function parameters to the
expected value.

Signed-off-by: Mike D. Day <ncmike@us.ibm.com>

---

 drivers/ata/sata_svw.c |   41 +++++++++++++++++++++++------------------
 1 files changed, 23 insertions(+), 18 deletions(-)
diff --git a/drivers/ata/sata_svw.c b/drivers/ata/sata_svw.c
index db32d15..7952315 100644
--- a/drivers/ata/sata_svw.c
+++ b/drivers/ata/sata_svw.c
@@ -111,26 +111,31 @@ static void k2_sata_tf_load(struct ata_p
 	unsigned int is_addr = tf->flags & ATA_TFLAG_ISADDR;
 
 	if (tf->ctl != ap->last_ctl) {
-		writeb(tf->ctl, ioaddr->ctl_addr);
+		writeb(tf->ctl, (void *)ioaddr->ctl_addr);
 		ap->last_ctl = tf->ctl;
 		ata_wait_idle(ap);
 	}
 	if (is_addr && (tf->flags & ATA_TFLAG_LBA48)) {
-		writew(tf->feature | (((u16)tf->hob_feature) << 8), ioaddr->feature_addr);
-		writew(tf->nsect | (((u16)tf->hob_nsect) << 8), ioaddr->nsect_addr);
-		writew(tf->lbal | (((u16)tf->hob_lbal) << 8), ioaddr->lbal_addr);
-		writew(tf->lbam | (((u16)tf->hob_lbam) << 8), ioaddr->lbam_addr);
-		writew(tf->lbah | (((u16)tf->hob_lbah) << 8), ioaddr->lbah_addr);
+		writew(tf->feature | (((u16)tf->hob_feature) << 8),
+		       (void *)ioaddr->feature_addr);
+		writew(tf->nsect | (((u16)tf->hob_nsect) << 8),
+		       (void *)ioaddr->nsect_addr);
+		writew(tf->lbal | (((u16)tf->hob_lbal) << 8),
+		       (void *)ioaddr->lbal_addr);
+		writew(tf->lbam | (((u16)tf->hob_lbam) << 8),
+		       (void *)ioaddr->lbam_addr);
+		writew(tf->lbah | (((u16)tf->hob_lbah) << 8),
+		       (void *)ioaddr->lbah_addr);
 	} else if (is_addr) {
-		writew(tf->feature, ioaddr->feature_addr);
-		writew(tf->nsect, ioaddr->nsect_addr);
-		writew(tf->lbal, ioaddr->lbal_addr);
-		writew(tf->lbam, ioaddr->lbam_addr);
-		writew(tf->lbah, ioaddr->lbah_addr);
+		writew(tf->feature, (void *)ioaddr->feature_addr);
+		writew(tf->nsect, (void *)ioaddr->nsect_addr);
+		writew(tf->lbal, (void *)ioaddr->lbal_addr);
+		writew(tf->lbam, (void *)ioaddr->lbam_addr);
+		writew(tf->lbah, (void *)ioaddr->lbah_addr);
 	}
 
 	if (tf->flags & ATA_TFLAG_DEVICE)
-		writeb(tf->device, ioaddr->device_addr);
+		writeb(tf->device, (void *)ioaddr->device_addr);
 
 	ata_wait_idle(ap);
 }
@@ -142,12 +147,12 @@ static void k2_sata_tf_read(struct ata_p
 	u16 nsect, lbal, lbam, lbah, feature;
 
 	tf->command = k2_stat_check_status(ap);
-	tf->device = readw(ioaddr->device_addr);
-	feature = readw(ioaddr->error_addr);
-	nsect = readw(ioaddr->nsect_addr);
-	lbal = readw(ioaddr->lbal_addr);
-	lbam = readw(ioaddr->lbam_addr);
-	lbah = readw(ioaddr->lbah_addr);
+	tf->device = readw((void *)ioaddr->device_addr);
+	feature = readw((void *)ioaddr->error_addr);
+	nsect = readw((void *)ioaddr->nsect_addr);
+	lbal = readw((void *)ioaddr->lbal_addr);
+	lbam = readw((void *)ioaddr->lbam_addr);
+	lbah = readw((void *)ioaddr->lbah_addr);
 
 	tf->feature = feature;
 	tf->nsect = nsect;

-- 
Mike D. Day
IBM LTC
Cell: 919 412-3900
Sametime: ncmike@us.ibm.com AIM: ncmikeday  Yahoo: ultra.runner
PGP key: http://www.ncultra.org/ncmike/pubkey.asc
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
