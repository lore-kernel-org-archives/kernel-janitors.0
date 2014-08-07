From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 07 Aug 2014 12:49:07 +0000
Subject: [PATCH 2/5] solos-pci: fix error return code
Message-Id: <1407415749-19978-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407415749-19978-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407415749-19978-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <chas@cmf.nrl.navy.mil>
Cc: kernel-janitors@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert a zero return value on error to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/atm/solos-pci.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/atm/solos-pci.c b/drivers/atm/solos-pci.c
index 943cf0d..7652e8d 100644
--- a/drivers/atm/solos-pci.c
+++ b/drivers/atm/solos-pci.c
@@ -1278,6 +1278,7 @@ static int fpga_probe(struct pci_dev *dev, const struct pci_device_id *id)
 			card->dma_bounce = kmalloc(card->nr_ports * BUF_SIZE, GFP_KERNEL);
 			if (!card->dma_bounce) {
 				dev_warn(&card->dev->dev, "Failed to allocate DMA bounce buffers\n");
+				err = -ENOMEM;
 				/* Fallback to MMIO doesn't work */
 				goto out_unmap_both;
 			}

