From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 22:26:46 +0000
Subject: [KJ] [RFT 2.6] ebus.c replace pci_find_device with pci_get_device
Message-Id: <83130000.1097274406@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27476598503620853=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: greg@kroah.com, hannal@us.ibm.com, wli@holomorphy.com

--===============27476598503620853==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As pci_find_device is going away I've replaced it with pci_get_device.
If someone with a Sparc system could test it I would appreciate it.
Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/sparc/kernel/ebus.c linux-2.6.9-rc3-mm3patch2/arch/sparc/kernel/ebus.c
--- linux-2.6.9-rc3-mm3cln/arch/sparc/kernel/ebus.c	2004-09-29 20:05:51.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch2/arch/sparc/kernel/ebus.c	2004-10-08 15:17:41.481638808 -0700
@@ -275,7 +275,7 @@ void __init ebus_init(void)
 		}
 	}
 
-	pdev = pci_find_device(PCI_VENDOR_ID_SUN, PCI_DEVICE_ID_SUN_EBUS, 0);
+	pdev = pci_get_device(PCI_VENDOR_ID_SUN, PCI_DEVICE_ID_SUN_EBUS, 0);
 	if (!pdev) {
 		return;
 	}
@@ -342,7 +342,7 @@ void __init ebus_init(void)
 		}
 
 	next_ebus:
-		pdev = pci_find_device(PCI_VENDOR_ID_SUN,
+		pdev = pci_get_device(PCI_VENDOR_ID_SUN,
 				       PCI_DEVICE_ID_SUN_EBUS, pdev);
 		if (!pdev)
 			break;


--===============27476598503620853==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27476598503620853==--
