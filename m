From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 14 Feb 2005 14:48:32 +0000
Subject: [KJ] [PATCH] drivers/atm/* : pci_request_regions
Message-Id: <20050214144832.GF20620@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="n2Pv11Ogg/Ox8ay5"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

description:
If PCI request regions fails, then someone else is using the
hardware we wish to use. For that one case, calling
pci_disable_device() is rather rude.
See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>


--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_disable-linux-2.6.11-rc4_drivers_atm.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/atm/zatm.c linux-2.6.11-rc4/drivers/atm/zatm.c
--- linux-2.6.11-rc4-vanilla/drivers/atm/zatm.c	2005-02-14 09:03:40.000000000 +0100
+++ linux-2.6.11-rc4/drivers/atm/zatm.c	2005-02-14 09:41:40.000000000 +0100
@@ -1576,6 +1576,7 @@ static int __devinit zatm_init_one(struc
 	struct atm_dev *dev;
 	struct zatm_dev *zatm_dev;
 	int ret = -ENOMEM;
+	int pci_dev_busy = 0 ;
 
 	zatm_dev = (struct zatm_dev *) kmalloc(sizeof(*zatm_dev), GFP_KERNEL);
 	if (!zatm_dev) {
@@ -1592,8 +1593,10 @@ static int __devinit zatm_init_one(struc
 		goto out_deregister;
 
 	ret = pci_request_regions(pci_dev, DEV_LABEL);
-	if (ret < 0)
+	if (ret < 0) {
+		pci_dev_busy = 1 ;
 		goto out_disable;
+	}
 
 	zatm_dev->pci_dev = pci_dev;
 	dev->dev_data = zatm_dev;
@@ -1611,7 +1614,8 @@ out:
 out_release:
 	pci_release_regions(pci_dev);
 out_disable:
-	pci_disable_device(pci_dev);
+	if(!pci_dev_busy)
+		pci_disable_device(pci_dev);
 out_deregister:
 	atm_dev_deregister(dev);
 out_free:

--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--n2Pv11Ogg/Ox8ay5--
