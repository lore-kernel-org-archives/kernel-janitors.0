From: Hanna Linder <hannal@us.ibm.com>
Date: Mon, 04 Oct 2004 21:19:37 +0000
Subject: [Kernel-janitors] [PATCH 2.6] hades-pci.c: replace pci_find_device
Message-Id: <280230000.1096924777@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91251703480171487=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, greg@kroah.com, hannal@us.ibm.com, geert@linux-m68k.org, zippel@linux-m68k.org

--===============91251703480171487==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away I have replaced this call with pci_get_device.
If anyone has access to a Hades Atari clone to test this one I would appreciate it..

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc3-mm2cln/arch/m68k/atari/hades-pci.c linux-2.6.9-rc3-mm2patch/arch/m68k/atari/hades-pci.c
--- linux-2.6.9-rc3-mm2cln/arch/m68k/atari/hades-pci.c	2004-09-29 20:04:57.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch/arch/m68k/atari/hades-pci.c	2004-10-04 13:30:44.120362824 -0700
@@ -311,7 +311,7 @@ static void __init hades_fixup(int pci_m
 	 * Go through all devices, fixing up irqs as we see fit:
 	 */
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL)
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL)
 	{
 		if (dev->class >> 16 != PCI_BASE_CLASS_BRIDGE)
 		{



--===============91251703480171487==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91251703480171487==--
