From: Scott Feldman <sfeldma@pobox.com>
Date: Tue, 21 Sep 2004 06:52:35 +0000
Subject: [Kernel-janitors] [PATCH -mm 2/9] pci_find_device to pci_get_device
Message-Id: <1095749555.3790.85.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92044008576729719=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92044008576729719==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Use pci_get_device instead of pci_find_device as pci device returned
from pci_find_device can disappear at any momemt in time.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/fc/iph5526.c linux-2.6.9-rc2-mm1-dsf/drivers/net/fc/iph5526.c
--- linux-2.6.9-rc2-mm1/drivers/net/fc/iph5526.c	2004-08-14 03:54:51.000000000 -0700
+++ linux-2.6.9-rc2-mm1-dsf/drivers/net/fc/iph5526.c	2004-09-20 22:43:58.022996008 -0700
@@ -3711,7 +3711,7 @@ int iph5526_detect(Scsi_Host_Template *t
 		fc[i] = NULL;
 
 	for (i = 0; clone_list[i].vendor_id != 0; i++)
-	while ((pdev = pci_find_device(clone_list[i].vendor_id, clone_list[i].device_id, pdev))) {
+	while ((pdev = pci_get_device(clone_list[i].vendor_id, clone_list[i].device_id, pdev))) {
 		unsigned short pci_command;
 		if (pci_enable_device(pdev))
 			continue;
@@ -3719,12 +3719,14 @@ int iph5526_detect(Scsi_Host_Template *t
 			fc[count] = kmalloc(sizeof(struct fc_info), GFP_ATOMIC);
 			if (fc[count] == NULL) {
 				printk("iph5526.c: Unable to register card # %d\n", count + 1);
+				pci_dev_put(pdev);
 				return no_of_hosts;
 			}
 			memset(fc[count], 0, sizeof(struct fc_info));
 		}
 		else {
 			printk("iph5526.c: Maximum Number of cards reached.\n");
+			pci_dev_put(pdev);
 			return no_of_hosts;
 		}
 			
@@ -3734,6 +3736,7 @@ int iph5526_detect(Scsi_Host_Template *t
 		host = scsi_register(tmpt, sizeof(struct iph5526_hostdata));
 		if(host==NULL) {
 			kfree(fc[count]);
+			pci_dev_put(pdev);
 			return no_of_hosts;
 		}
 			
@@ -3807,6 +3810,7 @@ int iph5526_detect(Scsi_Host_Template *t
 				clean_up_memory(fi);
 			kfree(fc[count]);
 			fc[count] = NULL;
+			pci_dev_put(pdev);
 			break;
 		}
 		DPRINTK1("Fibre Channel card initialized");



--===============92044008576729719==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92044008576729719==--
