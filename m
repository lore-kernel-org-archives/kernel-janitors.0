From: Nick Wilson <njw@osdl.org>
Date: Tue, 05 Apr 2005 23:40:01 +0000
Subject: [KJ] [PATCH] drivers/scsi/sata_svw.c: fix compiler warnings
Message-Id: <20050405234001.GA10931@njw.pdx.osdl.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20010708827530443=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-ide@vger.kernel.org, jgarzik@pobox.com

--===============20010708827530443==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixes compiler warnings:
  warning: passing arg 2 of `writeb' makes pointer from integer without a cast
  warning: passing arg 1 of `readw' makes pointer from integer without a cast

Patch is compile tested. Diffed against 2.6.12-rc2-kj.

Nick

Signed-off-by: Nick Wilson <njw@osdl.org>
---


 sata_svw.c |   41 +++++++++++++++++++++++------------------
 1 files changed, 23 insertions(+), 18 deletions(-)

--- linux.orig/drivers/scsi/sata_svw.c	2005-04-05 14:21:18.000000000 -0700
+++ linux/drivers/scsi/sata_svw.c	2005-04-05 16:36:57.000000000 -0700
@@ -103,26 +103,31 @@ static void k2_sata_tf_load(struct ata_p
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
+						(void *)ioaddr->feature_addr);
+		writew(tf->nsect | (((u16)tf->hob_nsect) << 8),
+						(void *)ioaddr->nsect_addr);
+		writew(tf->lbal | (((u16)tf->hob_lbal) << 8),
+						(void *)ioaddr->lbal_addr);
+		writew(tf->lbam | (((u16)tf->hob_lbam) << 8),
+						(void *)ioaddr->lbam_addr);
+		writew(tf->lbah | (((u16)tf->hob_lbah) << 8),
+						(void *)ioaddr->lbah_addr);
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
@@ -133,14 +138,14 @@ static void k2_sata_tf_read(struct ata_p
 	struct ata_ioports *ioaddr = &ap->ioaddr;
 	u16 nsect, lbal, lbam, lbah;
 
-	nsect = tf->nsect = readw(ioaddr->nsect_addr);
-	lbal = tf->lbal = readw(ioaddr->lbal_addr);
-	lbam = tf->lbam = readw(ioaddr->lbam_addr);
-	lbah = tf->lbah = readw(ioaddr->lbah_addr);
-	tf->device = readw(ioaddr->device_addr);
+	nsect = tf->nsect = readw((void *)ioaddr->nsect_addr);
+	lbal = tf->lbal = readw((void *)ioaddr->lbal_addr);
+	lbam = tf->lbam = readw((void *)ioaddr->lbam_addr);
+	lbah = tf->lbah = readw((void *)ioaddr->lbah_addr);
+	tf->device = readw((void *)ioaddr->device_addr);
 
 	if (tf->flags & ATA_TFLAG_LBA48) {
-		tf->hob_feature = readw(ioaddr->error_addr) >> 8;
+		tf->hob_feature = readw((void *)ioaddr->error_addr) >> 8;
 		tf->hob_nsect = nsect >> 8;
 		tf->hob_lbal = lbal >> 8;
 		tf->hob_lbam = lbam >> 8;
_

--===============20010708827530443==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20010708827530443==--
