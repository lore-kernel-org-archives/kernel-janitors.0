From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 14 Feb 2005 15:18:02 +0000
Subject: [KJ] [PATCH] drivers/net/wireless/prism54/* : pci_request_regions
Message-Id: <20050214151802.GO20620@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="M2Pxvdb9QxnGd/3e"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050213131029.GL15348@rhum.iomeda.fr>
In-Reply-To: <20050213131029.GL15348@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--M2Pxvdb9QxnGd/3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

description:
If PCI request regions fails, then someone else is using the
hardware we wish to use. For that one case, calling
pci_disable_device() is rather rude.
See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

--M2Pxvdb9QxnGd/3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_disable-linux-2.6.11-rc4_drivers_net_wireless_prism54.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/wireless/prism54/islpci_hotplug.c linux-2.6.11-rc4/drivers/net/wireless/prism54/islpci_hotplug.c
--- linux-2.6.11-rc4-vanilla/drivers/net/wireless/prism54/islpci_hotplug.c	2005-02-14 09:03:54.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/wireless/prism54/islpci_hotplug.c	2005-02-14 14:52:22.000000000 +0100
@@ -106,6 +106,7 @@ prism54_probe(struct pci_dev *pdev, cons
 	u32 mem_addr;
 	islpci_private *priv;
 	int rvalue;
+	int pci_dev_busy = 0;
 
 	/* Enable the pci device */
 	if (pci_enable_device(pdev)) {
@@ -155,6 +156,7 @@ prism54_probe(struct pci_dev *pdev, cons
 	if (rvalue) {
 		printk(KERN_ERR "%s: pci_request_regions failure (rc=%d)\n",
 		       DRV_NAME, rvalue);
+		pci_dev_busy = 1 ;
 		goto do_pci_disable_device;
 	}
 
@@ -211,7 +213,8 @@ prism54_probe(struct pci_dev *pdev, cons
       do_pci_release_regions:
 	pci_release_regions(pdev);
       do_pci_disable_device:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy)
+		pci_disable_device(pdev);
 	return -EIO;
 }
 

--M2Pxvdb9QxnGd/3e
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--M2Pxvdb9QxnGd/3e--
