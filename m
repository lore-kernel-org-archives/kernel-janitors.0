From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 29 Sep 2004 22:28:20 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 zr36120.c][5/8] Convert
Message-Id: <19730000.1096496900@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49243360594912611=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, greg@kroah.com, hannal@us.ibm.com, kraxel@bytesex.org

--===============49243360594912611==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


The dev was not used from pci_find_device so it was acceptable to replace
with pci_dev_present. There was no need for it to be in a while loop originally.
Compile tested.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

diff -Nrup linux-2.6.9-rc2-mm4cln/drivers/media/video/zr36120.c linux-2.6.9-rc2-mm4patch/drivers/media/video/zr36120.c
--- linux-2.6.9-rc2-mm4cln/drivers/media/video/zr36120.c	2004-09-28 14:58:36.000000000 -0700
+++ linux-2.6.9-rc2-mm4patch/drivers/media/video/zr36120.c	2004-09-29 15:12:53.625518848 -0700
@@ -145,14 +145,16 @@ static struct { const char name[8]; uint
 static
 void __init handle_chipset(void)
 {
-	struct pci_dev *dev = NULL;
+	static struct pci_device_id intel_82437[] = {
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82437) },
+		{ },
+	};
 
 	/* Just in case some nut set this to something dangerous */
 	if (triton1)
 		triton1 = ZORAN_VDC_TRICOM;
 
-	while ((dev = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82437, dev)))
-	{
+	if (pci_dev_present(intel_82437)) {
 		printk(KERN_INFO "zoran: Host bridge 82437FX Triton PIIX\n");
 		triton1 = ZORAN_VDC_TRICOM;
 	}


--===============49243360594912611==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49243360594912611==--
