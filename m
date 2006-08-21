From: Stephan Sperber <quinte17@gmx.de>
Date: Mon, 21 Aug 2006 15:44:50 +0000
Subject: [KJ] replace deprecated pci_find_device
Message-Id: <200608211744.51043.quinte17@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello everybody!
The included patch is my first try, so be critical :)
On the TODO list is mentioned that pci_find_device should be replaced with 
pci_get_dev. It also mentions that after shutting down the device a 
pci_dev_put(*dev) is needed to free the used memory again. And here is the 
problem I have. I don't see a "shutdownfunction" in ip2main.c nor in the 
other ip2 related files. Or did I miss something?

Thank you for any input on this topic.

Stephan

diff --git a/drivers/char/ip2/ip2main.c b/drivers/char/ip2/ip2main.c
index 7907ae8..11b4f25 100644
--- a/drivers/char/ip2/ip2main.c
+++ b/drivers/char/ip2/ip2main.c
@@ -589,7 +589,7 @@ ip2_loadmain(int *iop, int *irqp, unsign
 #ifdef CONFIG_PCI
 			{
 				struct pci_dev *pci_dev_i = NULL;
-				pci_dev_i = pci_find_device(PCI_VENDOR_ID_COMPUTONE,
+				pci_dev_i = pci_get_device(PCI_VENDOR_ID_COMPUTONE,
 							  PCI_DEVICE_ID_COMPUTONE_IP2EX, pci_dev_i);
 				if (pci_dev_i != NULL) {
 					unsigned int addr;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
