From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 29 Sep 2004 18:15:24 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 scx200_wdt.c] [1/8] Patch to
Message-Id: <77800000.1096481724@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51265824059238962=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, hannal@us.ibm.com, greg@kroah.com

--===============51265824059238962==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Patch to replace the soon to be defunct pci_find_device with the
new function pci_dev_present. I found 8 .c files (outside of /drivers/net)
that used pci_find_device without the dev it returned. therefore it
was replaceable with the new function.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

diff -Nrup linux-2.6.9-rc2-mm4cln/drivers/char/watchdog/scx200_wdt.c linux-2.6.9-rc2-mm4patch/drivers/char/watchdog/scx200_wdt.c
--- linux-2.6.9-rc2-mm4cln/drivers/char/watchdog/scx200_wdt.c	2004-09-12 22:32:55.000000000 -0700
+++ linux-2.6.9-rc2-mm4patch/drivers/char/watchdog/scx200_wdt.c	2004-09-29 11:07:03.836301112 -0700
@@ -217,6 +217,11 @@ static struct miscdevice scx200_wdt_misc
 static int __init scx200_wdt_init(void)
 {
 	int r;
+	static struct pci_device_id ns_sc[] = {
+		{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_SCx200_BRIDGE) },
+		{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_SC1100_BRIDGE) },
+		{ },
+	};
 
 	printk(KERN_DEBUG NAME ": NatSemi SCx200 Watchdog Driver\n");
 
@@ -224,12 +229,7 @@ static int __init scx200_wdt_init(void)
 	 * First check that this really is a NatSemi SCx200 CPU or a Geode
 	 * SC1100 processor
 	 */
-	if ((pci_find_device(PCI_VENDOR_ID_NS,
-			     PCI_DEVICE_ID_NS_SCx200_BRIDGE,
-			     NULL)) == NULL
-	    && (pci_find_device(PCI_VENDOR_ID_NS,
-				PCI_DEVICE_ID_NS_SC1100_BRIDGE,
-				NULL)) == NULL)
+	if (!pci_dev_present(ns_sc))
 		return -ENODEV;
 
 	/* More sanity checks, verify that the configuration block is there */


--===============51265824059238962==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51265824059238962==--
