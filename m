From: Matthew Martin <lihnucks@gmail.com>
Date: Wed, 12 Jul 2006 01:15:38 +0000
Subject: [KJ] [PATCH] Convert DPRINTK to pr_debug in drivers/scsi/ahci.c
Message-Id: <44B44D3A.8010101@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,
    This converts DPRINTK to pr_debug in drivers/scsi/ahci.c

Signed-off-by: Matthew Martin <lihnucks@gmail.com>

---

--- vanilla-linux-2.6.18-rc1/drivers/scsi/ahci.c	2006-07-11 15:55:59.000000000 -0500
+++ linux-2.6.18-rc1/drivers/scsi/ahci.c	2006-07-11 20:13:26.000000000 -0500
@@ -617,10 +617,10 @@ static int ahci_softreset(struct ata_por
 	u8 *fis;
 	int rc;
 
-	DPRINTK("ENTER\n");
+	pr_debug("ENTER\n");
 
 	if (ata_port_offline(ap)) {
-		DPRINTK("PHY reports no device\n");
+		pr_debug("PHY reports no device\n");
 		*class = ATA_DEV_NONE;
 		return 0;
 	}
@@ -702,7 +702,7 @@ static int ahci_softreset(struct ata_por
 		*class = ahci_dev_classify(ap);
 	}
 
-	DPRINTK("EXIT, class=%u\n", *class);
+	pr_debug("EXIT, class=%u\n", *class);
 	return 0;
 
  fail_restart:
@@ -719,7 +719,7 @@ static int ahci_hardreset(struct ata_por
 	struct ata_taskfile tf;
 	int rc;
 
-	DPRINTK("ENTER\n");
+	pr_debug("ENTER\n");
 
 	ahci_stop_engine(ap);
 
@@ -737,7 +737,7 @@ static int ahci_hardreset(struct ata_por
 	if (*class = ATA_DEV_UNKNOWN)
 		*class = ATA_DEV_NONE;
 
-	DPRINTK("EXIT, rc=%d, class=%u\n", rc, *class);
+	pr_debug("EXIT, rc=%d, class=%u\n", rc, *class);
 	return rc;
 }
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
