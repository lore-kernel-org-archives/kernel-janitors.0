From: trem <tremyfr@yahoo.fr>
Date: Tue, 16 May 2006 22:55:33 +0000
Subject: [KJ] [PATCH] drivers/char/mxser.c : change pci_find_device by
Message-Id: <446A5865.8040403@yahoo.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070307010405090202010907"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070307010405090202010907
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: trem <tremyfr@yahoo.fr>

This patch simply change pci_find_device by pci_get_device, because
pci_find_device is deprecated. pci_dev_put has been added to decrement
the counter, so unload could be done.

Signed-Off-By: trem <tremyfr@yahoo.fr>
---


--------------070307010405090202010907
Content-Type: text/x-patch;
	name="mxser_replace_pci_find_device_by_pci_get_device.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="mxser_replace_pci_find_device_by_pci_get_device.patch"

diff --git a/drivers/char/mxser.c b/drivers/char/mxser.c
index 0fb2fb9..82ccc31 100644
--- a/drivers/char/mxser.c
+++ b/drivers/char/mxser.c
@@ -817,7 +817,7 @@ static int mxser_init(void)
 	index = 0;
 	b = 0;
 	while (b < n) {
-		pdev = pci_find_device(mxser_pcibrds[b].vendor, mxser_pcibrds[b].device, pdev);
+		pdev = pci_get_device(mxser_pcibrds[b].vendor, mxser_pcibrds[b].device, pdev);
 			if (pdev == NULL) {
 			b++;
 			continue;
@@ -832,6 +832,7 @@ static int mxser_init(void)
 		} else {
 			if (pci_enable_device(pdev)) {
 				printk(KERN_ERR "Moxa SmartI/O PCI enable fail !\n");
+				pci_dev_put(pdev);
 				continue;
 			}
 			retval = mxser_get_PCI_conf(busnum, devnum, (int) mxser_pcibrds[b].driver_data, &hwconf);
@@ -844,15 +845,19 @@ static int mxser_init(void)
 					printk(KERN_ERR "Invalid interrupt vector,board not configured\n");
 				else if (retval == MXSER_ERR_IOADDR)
 					printk(KERN_ERR "Invalid I/O address,board not configured\n");
+				pci_dev_put(pdev);
 				continue;
 			}
 			mxser_getcfg(m, &hwconf);
 			//init mxsercfg first, or mxsercfg data is not correct on ISR.
 			//mxser_initbrd will hook ISR.
-			if (mxser_initbrd(m, &hwconf) < 0)
+			if (mxser_initbrd(m, &hwconf) < 0) {
+				pci_dev_put(pdev);
 				continue;
+			}
 			m++;
 		}
+		pci_dev_put(pdev);
 	}
 #endif
 

--------------070307010405090202010907
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070307010405090202010907--
