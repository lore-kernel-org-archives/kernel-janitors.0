From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 18 Mar 2005 17:14:24 +0000
Subject: [KJ] [UPDATE PATCH] drivers/ieee1394/pcilynx.c: Use the
Message-Id: <20050318171424.GD3356@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75410337652794646=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75410337652794646==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
These patches include dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/ieee1394/pcilynx.c	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/ieee1394/pcilynx.c	2005-03-18 16:00:11.000000000 +0100
@@ -43,6 +43,7 @@
 #include <linux/fs.h>
 #include <linux/poll.h>
 #include <linux/kdev_t.h>
+#include <linux/dma-mapping.h>
 #include <asm/byteorder.h>
 #include <asm/atomic.h>
 #include <asm/io.h>
@@ -1527,7 +1528,7 @@ static int __devinit add_card(struct pci
 
         error = -ENXIO;
 
-        if (pci_set_dma_mask(dev, 0xffffffff))
+        if (pci_set_dma_mask(dev, DMA_32BIT_MASK))
                 FAIL("DMA address limits not supported for PCILynx hardware");
         if (pci_enable_device(dev))
                 FAIL("failed to enable PCILynx hardware");

--===============75410337652794646==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75410337652794646==--
