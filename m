From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 20 Oct 2004 18:55:14 +0000
Subject: [KJ] [RFT 2.6] sis-agp.c: replace pci_find_device with
Message-Id: <18870000.1098298514@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83616155929523583=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: Hanna Linder <hannal@us.ibm.com>, greg@kroah.com, davej@codemonkey.org.uk

--===============83616155929523583==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away soon I have converted this file to use
pci_get_device instead. for_each_pci_dev is a macro wrapper around
pci_get_device.  I have compile tested it. If anyone has this hardware
and could test it that would be great.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>
---

diff -Nrup linux-2.6.9cln/drivers/char/agp/sis-agp.c linux-2.6.9patch2/drivers/char/agp/sis-agp.c
--- linux-2.6.9cln/drivers/char/agp/sis-agp.c	2004-10-18 16:35:52.000000000 -0700
+++ linux-2.6.9patch2/drivers/char/agp/sis-agp.c	2004-10-19 15:52:32.000000000 -0700
@@ -85,7 +85,7 @@ static void sis_delayed_enable(u32 mode)
 	command |= AGPSTAT_AGP_ENABLE;
 	rate = (command & 0x7) << 2;
 
-	while ((device = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, device)) != NULL) {
+	for_each_pci_dev(device) {
 		u8 agp = pci_find_capability(device, PCI_CAP_ID_AGP);
 		if (!agp)
 			continue;


--===============83616155929523583==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83616155929523583==--
