From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Tue, 08 Mar 2005 13:55:22 +0000
Subject: [KJ] [PATCH] drivers/media/video/bttv-driver.c : Use the DMA_{64,
Message-Id: <20050308135522.GD5311@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37082437707091831=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37082437707091831==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/media/video/bttv-driver.c	2005-03-02 12:50:30.000000000 +0100
+++ linux-2.6.11/drivers/media/video/bttv-driver.c	2005-03-03 11:50:15.000000000 +0100
@@ -3752,7 +3752,7 @@ static int __devinit bttv_probe(struct p
 		       btv->c.nr);
 		return -EIO;
 	}
-        if (pci_set_dma_mask(dev, 0xffffffff)) {
+        if (pci_set_dma_mask(dev, DMA_32BIT_MASK)) {
                 printk(KERN_WARNING "bttv%d: No suitable DMA available.\n",
 		       btv->c.nr);
 		return -EIO;

--===============37082437707091831==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37082437707091831==--
