From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 22:53:42 +0000
Subject: [KJ] [RFT 2.6] ebus.c replace pci_find_device with pci_get_device
Message-Id: <87310000.1097276022@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2449384019266696=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <83130000.1097274406@w-hlinder.beaverton.ibm.com>
In-Reply-To: <83130000.1097274406@w-hlinder.beaverton.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: greg@kroah.com, hannal@us.ibm.com, davem@davemloft.net, ecd@skynet.be, jj@sunsite.ms.mff.cuni.cz, anton@samba.org

--===============2449384019266696==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As pci_find_device is going away I've replaced it with pci_get_device.
If someone with a Sparc64 system could test it I would appreciate it.
Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>
---
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/sparc64/kernel/ebus.c linux-2.6.9-rc3-mm3patch2/arch/sparc64/kernel/ebus.c
--- linux-2.6.9-rc3-mm3cln/arch/sparc64/kernel/ebus.c	2004-09-29 20:04:25.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch2/arch/sparc64/kernel/ebus.c	2004-10-08 15:37:52.333561336 -0700
@@ -528,7 +528,7 @@ static struct pci_dev *find_next_ebus(st
 	struct pci_dev *pdev = start;
 
 	do {
-		pdev = pci_find_device(PCI_VENDOR_ID_SUN, PCI_ANY_ID, pdev);
+		pdev = pci_get_device(PCI_VENDOR_ID_SUN, PCI_ANY_ID, pdev);
 		if (pdev &&
 		    (pdev->device == PCI_DEVICE_ID_SUN_EBUS ||
 		     pdev->device == PCI_DEVICE_ID_SUN_RIO_EBUS))



--===============2449384019266696==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2449384019266696==--
