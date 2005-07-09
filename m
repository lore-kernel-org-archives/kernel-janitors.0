From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 09 Jul 2005 19:58:23 +0000
Subject: [KJ] [PATCH] drivers/media/video/bttv-driver: Remove unneeded call
Message-Id: <20050709195823.GA876@mail.nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74234398331070706=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74234398331070706==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In bttv-driver.c pci_dma_supported() is called after pci_set_dma_mask()
which already did check that for us. The attached patch removes the
unneeded call to pci_dma_supported()

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 bttv-driver.c |    5 -----
 1 files changed, 5 deletions(-)

diff -urpN -X dontdiff linux-2.6.13-rc2/drivers/media/video/bttv-driver.c linux-2.6.13-rc2~dma_mask/drivers/media/video/bttv-driver.c
--- linux-2.6.13-rc2/drivers/media/video/bttv-driver.c	2005-07-07 21:28:50.000000000 +0200
+++ linux-2.6.13-rc2~dma_mask/drivers/media/video/bttv-driver.c	2005-07-07 22:43:50.000000000 +0200
@@ -3880,11 +3881,6 @@ static int __devinit bttv_probe(struct p
         pci_set_master(dev);
 	pci_set_command(dev);
 	pci_set_drvdata(dev,btv);
-	if (!pci_dma_supported(dev,0xffffffff)) {
-		printk("bttv%d: Oops: no 32bit PCI DMA ???\n", btv->c.nr);
-		result = -EIO;
-		goto fail1;
-	}
 
         pci_read_config_byte(dev, PCI_CLASS_REVISION, &btv->revision);
         pci_read_config_byte(dev, PCI_LATENCY_TIMER, &lat);

--===============74234398331070706==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74234398331070706==--
