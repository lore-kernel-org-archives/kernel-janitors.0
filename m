From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 14 Feb 2005 15:09:09 +0000
Subject: [KJ] [PATCH] drivers/net/sk98lin/* : pci_request_regions
Message-Id: <20050214150909.GK20620@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mXDO3udm/xYWQeMQ"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--mXDO3udm/xYWQeMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

description:
If PCI request regions fails, then someone else is using the
hardware we wish to use. For that one case, calling
pci_disable_device() is rather rude.
See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>


--mXDO3udm/xYWQeMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_disable-linux-2.6.11-rc4_drivers_net_sk98lin.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/sk98lin/skge.c linux-2.6.11-rc4/drivers/net/sk98lin/skge.c
--- linux-2.6.11-rc4-vanilla/drivers/net/sk98lin/skge.c	2005-02-14 09:03:53.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/sk98lin/skge.c	2005-02-14 14:41:03.000000000 +0100
@@ -332,7 +332,8 @@ int SkGeInitPCI(SK_AC *pAC)
  out_release:
 	pci_release_regions(pdev);
  out_disable:
-	pci_disable_device(pdev);
+	if( retval == 2 ) 
+		pci_disable_device(pdev);
 	return retval;
 }
 

--mXDO3udm/xYWQeMQ
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--mXDO3udm/xYWQeMQ--
