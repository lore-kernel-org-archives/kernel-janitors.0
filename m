From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 22:55:12 +0000
Subject: [KJ] [RFT 2.6] pci-gart.c replace pci_find_device with
Message-Id: <87680000.1097276112@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83683567843509943=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: greg@kroah.com, hannal@us.ibm.com, ak@suse.de

--===============83683567843509943==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As pci_find_device is going away I've replaced it with pci_get_device.
If someone with a x86-64 system could test it I would appreciate it.
Thanks.

This should be the last of the /arch fixes for this work.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>
---
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/x86_64/kernel/pci-gart.c linux-2.6.9-rc3-mm3patch3/arch/x86_64/kernel/pci-gart.c
--- linux-2.6.9-rc3-mm3cln/arch/x86_64/kernel/pci-gart.c	2004-09-29 20:04:32.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch3/arch/x86_64/kernel/pci-gart.c	2004-10-08 15:42:18.000000000 -0700
@@ -81,7 +81,7 @@ static u32 gart_unmapped_entry; 
 
 #define for_all_nb(dev) \
 	dev = NULL;	\
-	while ((dev = pci_find_device(PCI_VENDOR_ID_AMD, 0x1103, dev))!=NULL)\
+	while ((dev = pci_get_device(PCI_VENDOR_ID_AMD, 0x1103, dev))!=NULL)\
 	     if (dev->bus->number == 0 && 				     \
 		    (PCI_SLOT(dev->devfn) >= 24) && (PCI_SLOT(dev->devfn) <= 31))
 



--===============83683567843509943==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83683567843509943==--
