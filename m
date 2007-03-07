From: Surya <surya.prabhakar@wipro.com>
Date: Wed, 07 Mar 2007 04:57:39 +0000
Subject: [KJ] [kj]Patch8:replace pci_find_device in drivers/telephony/ixj.c
Message-Id: <1173242739.3931.0.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eokerson@quicknet.net
Cc: alan@lxorguk.ukuu.org.uk, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, trivial@kernel.org

Hi,
   Cleaning up of pci_find_device in drivers/telephony/ixj.c.
Applies and compiles clean on Linus tree. No hardware hence not tested!!

Unable to find a suitable Maintainer for the current subsection in the Maintainers file.
I am not sure whether this is orphaned or maintained. 

Can somebody help me identify the actual maintainer.

thank you.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
--- 


diff --git a/drivers/telephony/ixj.c b/drivers/telephony/ixj.c
index 71cb64e..c7b0a35 100644
--- a/drivers/telephony/ixj.c
+++ b/drivers/telephony/ixj.c
@@ -7692,7 +7692,7 @@ static int __init ixj_probe_pci(int *cnt
 	IXJ *j = NULL;
 
 	for (i = 0; i < IXJMAX - *cnt; i++) {
-		pci = pci_find_device(PCI_VENDOR_ID_QUICKNET,
+		pci = pci_get_device(PCI_VENDOR_ID_QUICKNET,
 				      PCI_DEVICE_ID_QUICKNET_XJ, pci);
 		if (!pci)
 			break;
@@ -7712,6 +7712,7 @@ static int __init ixj_probe_pci(int *cnt
 			printk(KERN_INFO "ixj: found Internet PhoneJACK PCI at 0x%x\n", j->DSPbase);
 		++*cnt;
 	}
+	pci_dev_put(pci);
 	return probe;
 }
 

-- 
surya.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
