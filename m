From: Karsten Keil <kkeil@suse.de>
Date: Tue, 26 Sep 2006 13:07:46 +0000
Subject: Re: [KJ] [PATCH] ioremap balanced with iounmap for drivers/isdn
Message-Id: <20060926130746.GA17638@pingi.kke.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158842563.28299.145.camel@amol.verismonetworks.com>
In-Reply-To: <1158842563.28299.145.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ioremap must be balanced by an iounmap and failing to do so can result
in a memory leak.

Tested (compilation only) with:
- allmodconfig

Signed-off-by: Amol Lad <amol@verismonetworks.com>
Acked-by: Karsten keil <kkeil@suse.de>
---
 hisax/diva.c      |   26 ++++++++++++++++++++++++--
 hysdn/boardergo.c |    2 +-
 2 files changed, 25 insertions(+), 3 deletions(-)
---
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/isdn/hisax/diva.c linux-2.6.18/drivers/isdn/hisax/diva.c
--- linux-2.6.18-orig/drivers/isdn/hisax/diva.c	2006-09-21 10:15:33.000000000 +0530
+++ linux-2.6.18/drivers/isdn/hisax/diva.c	2006-09-26 13:24:05.000000000 +0530
@@ -716,8 +716,10 @@ release_io_diva(struct IsdnCardState *cs
 
 		*cfg = 0; /* disable INT0/1 */ 
 		*cfg = 2; /* reset pending INT0 */
-		iounmap((void *)cs->hw.diva.cfg_reg);
-		iounmap((void *)cs->hw.diva.pci_cfg);
+		if (cs->hw.diva.cfg_reg)
+			iounmap((void *)cs->hw.diva.cfg_reg);
+		if (cs->hw.diva.pci_cfg)
+			iounmap((void *)cs->hw.diva.pci_cfg);
 		return;
 	} else if (cs->subtyp != DIVA_IPAC_ISA) {
 		del_timer(&cs->hw.diva.tl);
@@ -734,6 +736,23 @@ release_io_diva(struct IsdnCardState *cs
 }
 
 static void
+iounmap_diva(struct IsdnCardState *cs)
+{
+	if ((cs->subtyp = DIVA_IPAC_PCI) || (cs->subtyp = DIVA_IPACX_PCI)) {
+		if (cs->hw.diva.cfg_reg) {
+			iounmap((void *)cs->hw.diva.cfg_reg);
+			cs->hw.diva.cfg_reg = 0;
+		}
+		if (cs->hw.diva.pci_cfg) {
+			iounmap((void *)cs->hw.diva.pci_cfg);
+			cs->hw.diva.pci_cfg = 0;
+		}
+	}
+
+	return;
+}
+
+static void
 reset_diva(struct IsdnCardState *cs)
 {
 	if (cs->subtyp = DIVA_IPAC_ISA) {
@@ -1069,11 +1088,13 @@ setup_diva(struct IsdnCard *card)
 
 		if (!cs->irq) {
 			printk(KERN_WARNING "Diva: No IRQ for PCI card found\n");
+			iounmap_diva(cs);
 			return(0);
 		}
 
 		if (!cs->hw.diva.cfg_reg) {
 			printk(KERN_WARNING "Diva: No IO-Adr for PCI card found\n");
+			iounmap_diva(cs);
 			return(0);
 		}
 		cs->irq_flags |= IRQF_SHARED;
@@ -1123,6 +1144,7 @@ ready:
 			       CardType[card->typ],
 			       cs->hw.diva.cfg_reg,
 			       cs->hw.diva.cfg_reg + bytecnt);
+			iounmap_diva(cs);
 			return (0);
 		}
 	}
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/isdn/hysdn/boardergo.c linux-2.6.18/drivers/isdn/hysdn/boardergo.c
--- linux-2.6.18-orig/drivers/isdn/hysdn/boardergo.c	2006-09-21 10:15:33.000000000 +0530
+++ linux-2.6.18/drivers/isdn/hysdn/boardergo.c	2006-09-26 10:57:25.000000000 +0530
@@ -408,7 +408,7 @@ ergo_releasehardware(hysdn_card * card)
 	free_irq(card->irq, card);	/* release interrupt */
 	release_region(card->iobase + PCI9050_INTR_REG, 1);	/* release all io ports */
 	release_region(card->iobase + PCI9050_USER_IO, 1);
-	vfree(card->dpram);
+	iounmap(card->dpram);
 	card->dpram = NULL;	/* release shared mem */
 }				/* ergo_releasehardware */



-- 
Karsten Keil
SuSE Labs
ISDN development
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
