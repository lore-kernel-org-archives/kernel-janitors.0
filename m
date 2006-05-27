From: trem <tremyfr@yahoo.fr>
Date: Sat, 27 May 2006 21:24:52 +0000
Subject: [KJ] [PATCH] drivers/char/rocket.c : replace pci_find_device by
Message-Id: <4478C3A4.9000504@yahoo.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030803070408060603070106"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030803070408060603070106
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: trem <tremyfr@yahoo.fr>

This patch simply change pci_find_device by pci_get_device, because
pci_find_device is deprecated. No pci_dev_put is needed because the
loop isn't broken, and pci_get_device decrement the counter of the
device given as from parameter.

Signed-Off-By: trem <tremyfr@yahoo.fr>
---

--------------030803070408060603070106
Content-Type: text/x-patch;
	name="rocket_replace_pci_find_device_by_pci_get_device.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="rocket_replace_pci_find_device_by_pci_get_device.patch"

diff --git a/drivers/char/rocket.c b/drivers/char/rocket.c
index 7edc6a4..2682c8c 100644
--- a/drivers/char/rocket.c
+++ b/drivers/char/rocket.c
@@ -2230,7 +2230,7 @@ static int __init init_PCI(int boards_fo
 	int count = 0;
 
 	/*  Work through the PCI device list, pulling out ours */
-	while ((dev = pci_find_device(PCI_VENDOR_ID_RP, PCI_ANY_ID, dev))) {
+	while ((dev = pci_get_device(PCI_VENDOR_ID_RP, PCI_ANY_ID, dev))) {
 		if (register_PCI(count + boards_found, dev))
 			count++;
 	}

--------------030803070408060603070106
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030803070408060603070106--
