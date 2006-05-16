From: trem <trem@zarb.org>
Date: Tue, 16 May 2006 21:56:51 +0000
Subject: [KJ] [PATCH] drivers/char/ip2/ip2main.c : change pci_find_device by
Message-Id: <446A4AA3.7090202@zarb.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040903030700000602070904"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040903030700000602070904
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: trem <tremyfr@yahoo.fr>

This patch simply change pci_find_device by pci_get_device, because
pci_find_device is deprecated. pci_dev_put has been added to decrement
the counter, so unload could be done.

Signed-Off-By: trem <tremyfr@yahoo.fr>
---


--------------040903030700000602070904
Content-Type: text/x-patch;
	name="ip2main_replace_pci_find_device_by_pci_get_device.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="ip2main_replace_pci_find_device_by_pci_get_device.patch"

diff --git a/drivers/char/ip2/ip2main.c b/drivers/char/ip2/ip2main.c
index 03db1cb..2acdfb2 100644
--- a/drivers/char/ip2/ip2main.c
+++ b/drivers/char/ip2/ip2main.c
@@ -594,7 +594,7 @@ ip2_loadmain(int *iop, int *irqp, unsign
 #ifdef CONFIG_PCI
 			{
 				struct pci_dev *pci_dev_i = NULL;
-				pci_dev_i = pci_find_device(PCI_VENDOR_ID_COMPUTONE,
+				pci_dev_i = pci_get_device(PCI_VENDOR_ID_COMPUTONE,
 							  PCI_DEVICE_ID_COMPUTONE_IP2EX, pci_dev_i);
 				if (pci_dev_i != NULL) {
 					unsigned int addr;
@@ -622,6 +622,7 @@ ip2_loadmain(int *iop, int *irqp, unsign
 //						pci_irq = 0;
 //					}
 					ip2config.irq[i] = pci_dev_i->irq;
+					pci_dev_put(pci_dev_i);
 				} else {	// ann error
 					ip2config.addr[i] = 0;
 					if (status == PCIBIOS_DEVICE_NOT_FOUND) {

--------------040903030700000602070904
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040903030700000602070904--
