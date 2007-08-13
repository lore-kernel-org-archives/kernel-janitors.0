From: "Scott Thompson" <postfail@hushmail.com>
Date: Mon, 13 Aug 2007 04:05:30 +0000
Subject: [PATCH 4 of 5 ] /drivers/char/rio ioremap balancing/ returncode check
Message-Id: <20070813040530.9E0E9DA82E@mailserver8.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, dri-devel@lists.sourceforge.net

patchset against 2.6.23-rc2 and this set is an audit of 
/drivers/char/a* 
through drivers/char .   

this corrects missing ioremap return checks and balancing on 
iounmap calls..

Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
----------------------------------------------------------
diff --git a/drivers/char/rio/rio_linux.c 
b/drivers/char/rio/rio_linux.c
index 0ce9667..fdaf44f 100644
--- a/drivers/char/rio/rio_linux.c
+++ b/drivers/char/rio/rio_linux.c
@@ -924,6 +924,11 @@ static void fix_rio_pci(struct pci_dev *pdev)
 
 	hwbase = pci_resource_start(pdev, 0);
 	rebase = ioremap(hwbase, 0x80);
+	if (!rebase) {
+		printk(KERN_DEBUG "rio: unable to perform cntrl reg fix as 
ioremap call failed\n");
+		return;
+	}
+		
 	t = readl(rebase + CNTRL_REG_OFFSET);
 	if (t != CNTRL_REG_GOODVALUE) {
 		printk(KERN_DEBUG "rio: performing cntrl reg fix: %08x -> 
%08x\n", t, CNTRL_REG_GOODVALUE);
@@ -996,6 +1001,11 @@ static int __init rio_init(void)
 		if (((1 << hp->Ivec) & rio_irqmask) = 0)
 			hp->Ivec = 0;
 		hp->Caddr = ioremap(p->RIOHosts[p->RIONumHosts].PaddrP, 
RIO_WINDOW_LEN);
+		if (!hp->Caddr) {
+			printk(KERN_ERR "RIO: Unable to ioremap.\n");
+			return -ENOMEM;
+		}
+
 		hp->CardP = (struct DpRam __iomem *) hp->Caddr;
 		hp->Type = RIO_PCI;
 		hp->Copy = rio_copy_to_card;
@@ -1049,6 +1059,10 @@ static int __init rio_init(void)
 			hp->Ivec = 0;
 		hp->Ivec |= 0x8000;	/* Mark as non-sharable */
 		hp->Caddr = ioremap(p->RIOHosts[p->RIONumHosts].PaddrP, 
RIO_WINDOW_LEN);
+		if (!hp->Caddr) {
+			printk(KERN_ERR "RIO: Unable to ioremap.\n");
+			return -ENOMEM;
+		}
 		hp->CardP = (struct DpRam __iomem *) hp->Caddr;
 		hp->Type = RIO_PCI;
 		hp->Copy = rio_copy_to_card;


