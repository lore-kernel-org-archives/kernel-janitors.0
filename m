From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 14 Feb 2005 15:12:11 +0000
Subject: [KJ] [PATCH] drivers/net/tokenring/* : pci_request_regions
Message-Id: <20050214151211.GM20620@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="wIc/V6YLA2QdyfT4"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--wIc/V6YLA2QdyfT4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

description:
If PCI request regions fails, then someone else is using the
hardware we wish to use. For that one case, calling
pci_disable_device() is rather rude.
See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>



--wIc/V6YLA2QdyfT4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_disable-linux-2.6.11-rc4_drivers_net_tokenring.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/tokenring/olympic.c linux-2.6.11-rc4/drivers/net/tokenring/olympic.c
--- linux-2.6.11-rc4-vanilla/drivers/net/tokenring/olympic.c	2005-02-14 09:03:54.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/tokenring/olympic.c	2005-02-14 14:46:44.000000000 +0100
@@ -200,6 +200,7 @@ static int __devinit olympic_probe(struc
 	struct olympic_private *olympic_priv;
 	static int card_no = -1 ;
 	int i ; 
+	int pci_dev_busy = 0 ;
 
 	card_no++ ; 
 
@@ -210,6 +211,7 @@ static int __devinit olympic_probe(struc
 	pci_set_master(pdev);
 
 	if ((i = pci_request_regions(pdev,"olympic"))) { 
+		pci_dev_busy = 1 ;
 		goto op_disable_dev;
 	}
  
@@ -286,7 +288,8 @@ op_free_dev:
 	pci_release_regions(pdev); 
 
 op_disable_dev:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy)
+		pci_disable_device(pdev);
 	return i;
 }
 

--wIc/V6YLA2QdyfT4
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--wIc/V6YLA2QdyfT4--
