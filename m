From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 14 Feb 2005 15:10:06 +0000
Subject: [KJ] [PATCH] drivers/net/skfp/* : pci_request_regions
Message-Id: <20050214151006.GL20620@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="huG+SbfbdD6eblZQ"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--huG+SbfbdD6eblZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

description:
If PCI request regions fails, then someone else is using the
hardware we wish to use. For that one case, calling
pci_disable_device() is rather rude.
See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>



--huG+SbfbdD6eblZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_disable-linux-2.6.11-rc4_drivers_net_skfp.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/skfp/skfddi.c linux-2.6.11-rc4/drivers/net/skfp/skfddi.c
--- linux-2.6.11-rc4-vanilla/drivers/net/skfp/skfddi.c	2005-02-14 09:03:53.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/skfp/skfddi.c	2005-02-14 14:43:12.000000000 +0100
@@ -205,6 +205,7 @@ static int skfp_init_one(struct pci_dev 
 	struct s_smc *smc;	/* board pointer */
 	void __iomem *mem;
 	int err;
+	int pci_dev_busy = 0;
 
 	PRINTK(KERN_INFO "entering skfp_init_one\n");
 
@@ -216,8 +217,10 @@ static int skfp_init_one(struct pci_dev 
 		return err;
 
 	err = pci_request_regions(pdev, "skfddi");
-	if (err)
+	if (err) {
+		pci_dev_busy = 1 ;
 		goto err_out1;
+	}
 
 	pci_set_master(pdev);
 
@@ -319,7 +322,8 @@ err_out3:
 err_out2:
 	pci_release_regions(pdev);
 err_out1:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy)
+		pci_disable_device(pdev);
 	return err;
 }
 

--huG+SbfbdD6eblZQ
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--huG+SbfbdD6eblZQ--
