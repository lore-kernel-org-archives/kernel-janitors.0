From: "Scott Thompson" <postfail@hushmail.com>
Date: Wed, 01 Aug 2007 13:33:13 +0000
Subject: [PATCH] sound/pci ioremap unchecked return
Message-Id: <20070801133313.A408E22822@mailserver9.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

two unchecked ioremap calls.  upon further review and discussion 
these are only 'valid' changes from previously posted "[PATCH 2/3] 
sound/pci ioremap/iounmap balancing".

Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
---
diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index ac007ce..871b09f 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -1319,6 +1319,13 @@ static int __devinit snd_mixart_probe(struct
pci_dev *pci,
                            pci_resource_len(pci, i));
     }
 
+    if (!mgr->mem[0].virt || !mgr->mem[1].virt){
+        printk(KERN_ERR "unable to remap resource 0x%lx and/or 
0x%lx\n",
+            mgr->mem[0].phys, mgr->mem[1].phys);
+        snd_mixart_free(mgr);
+        return -EBUSY;
+    }
+
     if (request_irq(pci->irq, snd_mixart_interrupt, IRQF_SHARED,
             CARD_NAME, mgr)) {
         snd_printk(KERN_ERR "unable to grab IRQ %d\n", pci->irq);

--
Click here to double your salary by becoming a medical transcriber.
http://tagline.hushmail.com/fc/Ioyw6h4eKoY9b45qdapjPR3Z3SZM2SyWTcOTz330fym9TiGfPbAR8i/

