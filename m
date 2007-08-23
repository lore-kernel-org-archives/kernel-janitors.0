From: Scott Thompson <postfailathushmaildotcom@yahoo.com>
Date: Thu, 23 Aug 2007 03:31:00 +0000
Subject: [PATCH 4 of 5 resend] /drivers/char/rio ioremap balancing/ returncode check
Message-Id: <830283.28023.qm@web44902.mail.sp1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

patchset against 2.6.23-rc3.  
corrects missing ioremap return checks and balancing on iounmap calls, integrated changes per list
recommendations on the original set of patches..

patch 4 --> rio_linux.c adds an int rc to the void fix_rio_pci which is then checked.  early
returns for ioremap fails also required a misc_deregister call.

Note -- this mail client will probably wrap first couple lines of (1013,7 +1026,12 @@ static int
__init rio_init(void) ) patch which, by my counts, runs to 221 columns.  Not sure what to do about
that, will post something seperate to lists for ideas...  

Warning -- cleanup handler here may miss additional required cleanup as has occurred on other
portions of ioremap audit.

This patch had been submitted previously but hushmail client caused wordwrap issues, resending
with different mail client.

Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
----------------------------------------------------------

diff --git a/drivers/char/rio/rio_linux.c b/drivers/char/rio/rio_linux.c
index 0ce9667..242e5fb 100644
--- a/drivers/char/rio/rio_linux.c
+++ b/drivers/char/rio/rio_linux.c
@@ -913,7 +913,7 @@ static void __exit rio_release_drivers(void)
    EEprom.  As the bit is read/write for the CPU, we can fix it here,
    if we detect that it isn't set correctly. -- REW */
 
-static void fix_rio_pci(struct pci_dev *pdev)
+static int fix_rio_pci(struct pci_dev *pdev)
 {
 	unsigned long hwbase;
 	unsigned char __iomem *rebase;
@@ -924,12 +924,19 @@ static void fix_rio_pci(struct pci_dev *pdev)
 
 	hwbase = pci_resource_start(pdev, 0);
 	rebase = ioremap(hwbase, 0x80);
+	if (!rebase) {
+		printk(KERN_ERR "rio: unable to perform cntrl reg fix"
+				  " as ioremap call failed\n");
+		return -ENOMEM;
+	}
+		
 	t = readl(rebase + CNTRL_REG_OFFSET);
 	if (t != CNTRL_REG_GOODVALUE) {
 		printk(KERN_DEBUG "rio: performing cntrl reg fix: %08x -> %08x\n", t, CNTRL_REG_GOODVALUE);
 		writel(CNTRL_REG_GOODVALUE, rebase + CNTRL_REG_OFFSET);
 	}
 	iounmap(rebase);
+ 	return 0;
 }
 #endif
 
@@ -996,6 +1003,12 @@ static int __init rio_init(void)
 		if (((1 << hp->Ivec) & rio_irqmask) = 0)
 			hp->Ivec = 0;
 		hp->Caddr = ioremap(p->RIOHosts[p->RIONumHosts].PaddrP, RIO_WINDOW_LEN);
+		if (!hp->Caddr) {
+			printk(KERN_ERR "RIO: Unable to ioremap.\n");
+			misc_deregister(&rio_fw_device);
+			return -ENOMEM;
+		}
+
 		hp->CardP = (struct DpRam __iomem *) hp->Caddr;
 		hp->Type = RIO_PCI;
 		hp->Copy = rio_copy_to_card;
@@ -1013,7 +1026,12 @@ static int __init rio_init(void)
 			    ((readb(&p->RIOHosts[p->RIONumHosts].Unique[1]) & 0xFF) << 8) |
((readb(&p->RIOHosts[p->RIONumHosts].Unique[2]) & 0xFF) << 16) |
((readb(&p->RIOHosts[p->RIONumHosts].Unique[3]) & 0xFF) << 24);
 			rio_dprintk(RIO_DEBUG_PROBE, "Hmm Tested ok, uniqid = %x.\n",
p->RIOHosts[p->RIONumHosts].UniqueNum);
 
-			fix_rio_pci(pdev);
+			if (fix_rio_pci(pdev)){
+				misc_deregister(&rio_fw_device);
+				iounmap(hp->Caddr);
+				return -ENOMEM;
+
+			}
 
 			p->RIOHosts[p->RIONumHosts].pdev = pdev;
 			pci_dev_get(pdev);
@@ -1049,6 +1067,11 @@ static int __init rio_init(void)
 			hp->Ivec = 0;
 		hp->Ivec |= 0x8000;	/* Mark as non-sharable */
 		hp->Caddr = ioremap(p->RIOHosts[p->RIONumHosts].PaddrP, RIO_WINDOW_LEN);
+		if (!hp->Caddr) {
+			printk(KERN_ERR "RIO: Unable to ioremap.\n");
+			misc_deregister(&rio_fw_device);
+			return -ENOMEM;
+		}
 		hp->CardP = (struct DpRam __iomem *) hp->Caddr;
 		hp->Type = RIO_PCI;
 		hp->Copy = rio_copy_to_card;


       
____________________________________________________________________________________
Be a better Heartthrob. Get better relationship answers from someone who knows. Yahoo! Answers -
Check it out. 
http://answers.yahoo.com/dir/?link=list&sid96545433


       
____________________________________________________________________________________
Boardwalk for $500? In 2007? Ha! Play Monopoly Here and Now (it's updated for today's economy) at Yahoo! Games.
http://get.games.yahoo.com/proddesc?gamekey=monopolyherenow  

