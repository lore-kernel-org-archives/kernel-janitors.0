From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 18 Mar 2005 17:34:25 +0000
Subject: [KJ] [UPDATE PATCH] drivers/media/video/meye.c: Use the
Message-Id: <20050318173425.GF3356@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32431421162561946=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050318172853.GE3356@localhost.localdomain>
In-Reply-To: <20050318172853.GE3356@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============32431421162561946==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stelian,

On Wed, Mar 16, 2005 at 05:49:06PM +0100, Stelian Pop wrote:
> Thanks, applied to my tree. I will push it upstream later.

The previous patch does not compile cleanly on all architectures. Please
use the attached one instead.

Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/media/video/meye.c	2005-03-02 12:50:30.000000000 +0100
+++ linux-2.6.11/drivers/media/video/meye.c	2005-03-18 16:01:51.000000000 +0100
@@ -37,6 +37,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/vmalloc.h>
+#include <linux/dma-mapping.h>
 
 #include "meye.h"
 #include <linux/meye.h>
@@ -121,7 +122,7 @@ static int ptable_alloc(void)
 	memset(meye.mchip_ptable, 0, sizeof(meye.mchip_ptable));
 
 	/* give only 32 bit DMA addresses */
-	if (dma_set_mask(&meye.mchip_dev->dev, 0xffffffff))
+	if (dma_set_mask(&meye.mchip_dev->dev, DMA_32BIT_MASK))
 		return -1;
 
 	meye.mchip_ptable_toc = dma_alloc_coherent(&meye.mchip_dev->dev,

--===============32431421162561946==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32431421162561946==--
