From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Mon, 17 Sep 2012 17:28:26 +0000
Subject: [PATCH 2/4] drivers/crypto/hifn_795x.c: fix error return code
Message-Id: <1347902908-19006-2-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347902908-19006-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347902908-19006-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au
Cc: davem@davemloft.net, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

From: Peter Senna Tschudin <peter.senna@gmail.com>

Convert a nonnegative error return code to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
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

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 drivers/crypto/hifn_795x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/hifn_795x.c b/drivers/crypto/hifn_795x.c
index df14358..fda3296 100644
--- a/drivers/crypto/hifn_795x.c
+++ b/drivers/crypto/hifn_795x.c
@@ -2611,14 +2611,17 @@ static int __devinit hifn_probe(struct pci_dev *pdev, const struct pci_device_id
 		size = pci_resource_len(pdev, i);
 
 		dev->bar[i] = ioremap_nocache(addr, size);
-		if (!dev->bar[i])
+		if (!dev->bar[i]) {
+			err = -ENOMEM;
 			goto err_out_unmap_bars;
+		}
 	}
 
 	dev->desc_virt = pci_alloc_consistent(pdev, sizeof(struct hifn_dma),
 			&dev->desc_dma);
 	if (!dev->desc_virt) {
 		dprintk("Failed to allocate descriptor rings.\n");
+		err = -ENOMEM;
 		goto err_out_unmap_bars;
 	}
 	memset(dev->desc_virt, 0, sizeof(struct hifn_dma));
-- 
1.7.11.4

