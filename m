From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 29 Sep 2004 23:50:14 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 matroxfb_base.c][7/8]
Message-Id: <26940000.1096501814@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45596753076509078=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, greg@kroah.com, vandrove@vc.cvut.cz

--===============45596753076509078==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away it is being replace with pci_dev_present (since the
dev is not used). I have compiled tested this.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---

diff -Nrup linux-2.6.9-rc2-mm4cln/drivers/video/matrox/matroxfb_base.c linux-2.6.9-rc2-mm4patch/drivers/video/matrox/matroxfb_base.c
--- linux-2.6.9-rc2-mm4cln/drivers/video/matrox/matroxfb_base.c	2004-09-28 14:59:07.000000000 -0700
+++ linux-2.6.9-rc2-mm4patch/drivers/video/matrox/matroxfb_base.c	2004-09-29 16:18:33.000000000 -0700
@@ -1578,6 +1578,11 @@ static int initMatrox2(WPMINFO struct bo
 	unsigned int memsize;
 	int err;
 
+	static struct pci_device_id intel_82437[] = {
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82437) },
+		{ },
+	};
+
 	DBG(__FUNCTION__)
 
 	/* set default values... */
@@ -1682,7 +1687,7 @@ static int initMatrox2(WPMINFO struct bo
 		mga_option |= MX_OPTION_BSWAP;
                 /* disable palette snooping */
                 cmd &= ~PCI_COMMAND_VGA_PALETTE;
-		if (pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82437, NULL)) {
+		if (pci_dev_present(intel_82437)) {
 			if (!(mga_option & 0x20000000) && !ACCESS_FBINFO(devflags.nopciretry)) {
 				printk(KERN_WARNING "matroxfb: Disabling PCI retries due to i82437 present\n");
 			}




--===============45596753076509078==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45596753076509078==--
