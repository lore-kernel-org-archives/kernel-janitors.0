From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 29 Oct 2005 13:09:26 +0000
Subject: [KJ]
Message-Id: <20051029130926.GA1381@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77702248175936295=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1106245529.15916.12.camel@base.torri.org>
In-Reply-To: <1106245529.15916.12.camel@base.torri.org>
To: kernel-janitors@vger.kernel.org

--===============77702248175936295==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This one from my DMA_{32,64}BIT_MASK series did not seem to make it
through to upstream.

Use the DMA_{32,64}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -X dontdiff -urpN linux-2.6.14/drivers/net/tg3.c linux-2.6.14~dma_mask/drivers/net/tg3.c
--- linux-2.6.14/drivers/net/tg3.c	2005-10-28 08:56:27.000000000 +0200
+++ linux-2.6.14~dma_mask/drivers/net/tg3.c	2005-10-29 14:46:38.000000000 +0200
@@ -37,6 +37,7 @@
 #include <linux/tcp.h>
 #include <linux/workqueue.h>
 #include <linux/prefetch.h>
+#include <linux/dma-mapping.h>
 
 #include <net/checksum.h>
 
@@ -10492,17 +10493,17 @@ static int __devinit tg3_init_one(struct
 	}
 
 	/* Configure DMA attributes. */
-	err = pci_set_dma_mask(pdev, 0xffffffffffffffffULL);
+	err = pci_set_dma_mask(pdev, DMA_64BIT_MASK);
 	if (!err) {
 		pci_using_dac = 1;
-		err = pci_set_consistent_dma_mask(pdev, 0xffffffffffffffffULL);
+		err = pci_set_consistent_dma_mask(pdev, DMA_64BIT_MASK);
 		if (err < 0) {
 			printk(KERN_ERR PFX "Unable to obtain 64 bit DMA "
 			       "for consistent allocations\n");
 			goto err_out_free_res;
 		}
 	} else {
-		err = pci_set_dma_mask(pdev, 0xffffffffULL);
+		err = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 		if (err) {
 			printk(KERN_ERR PFX "No usable DMA configuration, "
 			       "aborting.\n");

--===============77702248175936295==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77702248175936295==--
