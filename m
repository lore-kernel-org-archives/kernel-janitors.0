From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 18 Mar 2005 17:28:53 +0000
Subject: [KJ] [UPDATE PATCH] drivers/media/video/bttv-driver.c: Use the
Message-Id: <20050318172853.GE3356@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2569785323760676=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============2569785323760676==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/media/video/bttv-driver.c	2005-03-02 12:50:30.000000000 +0100
+++ linux-2.6.11/drivers/media/video/bttv-driver.c	2005-03-18 16:02:13.000000000 +0100
@@ -35,6 +35,7 @@
 #include <linux/sched.h>
 #include <linux/interrupt.h>
 #include <linux/kdev_t.h>
+#include <linux/dma-mapping.h>
 
 #include <asm/io.h>
 #include <asm/byteorder.h>
@@ -3752,7 +3753,7 @@ static int __devinit bttv_probe(struct p
 		       btv->c.nr);
 		return -EIO;
 	}
-        if (pci_set_dma_mask(dev, 0xffffffff)) {
+        if (pci_set_dma_mask(dev, DMA_32BIT_MASK)) {
                 printk(KERN_WARNING "bttv%d: No suitable DMA available.\n",
 		       btv->c.nr);
 		return -EIO;

--===============2569785323760676==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2569785323760676==--
