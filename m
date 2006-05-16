From: trem <tremyfr@yahoo.fr>
Date: Tue, 16 May 2006 22:53:22 +0000
Subject: [KJ] [PATCH] drivers/char/ip2/ip2main.c : change pci_find_device by
Message-Id: <446A57E2.9000005@yahoo.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000604030303060908000708"
List-Id: <kernel-janitors.vger.kernel.org>
References: <446A4AA3.7090202@zarb.org>
In-Reply-To: <446A4AA3.7090202@zarb.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000604030303060908000708
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: trem <tremyfr@yahoo.fr>

This patch simply change pci_find_device by pci_get_device, because
pci_find_device is deprecated. pci_dev_put has been added to decrement
the counter, so unload could be done. I've added a pci_dev_put(pci_dev_i)
before the break to avoid mising a device.

Signed-Off-By: trem <tremyfr@yahoo.fr>
---

--------------000604030303060908000708
Content-Type: text/x-patch;
	name="ip2main_replace_pci_find_device_by_pci_get_device.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="ip2main_replace_pci_find_device_by_pci_get_device.patch"

diff --git a/drivers/char/ip2/ip2main.c b/drivers/char/ip2/ip2main.c
index 03db1cb..235f17e 100644
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
@@ -602,6 +602,7 @@ ip2_loadmain(int *iop, int *irqp, unsign
 					if (pci_enable_device(pci_dev_i)) {
 						printk( KERN_ERR "IP2: can't enable PCI device at %s\n",
 							pci_name(pci_dev_i));
+						pci_dev_put(pci_dev_i);
 						break;
 					}
 					ip2config.type[i] = PCI;
@@ -622,6 +623,7 @@ ip2_loadmain(int *iop, int *irqp, unsign
 //						pci_irq = 0;
 //					}
 					ip2config.irq[i] = pci_dev_i->irq;
+					pci_dev_put(pci_dev_i);
 				} else {	// ann error
 					ip2config.addr[i] = 0;
 					if (status == PCIBIOS_DEVICE_NOT_FOUND) {

--------------000604030303060908000708
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000604030303060908000708--
