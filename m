From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Feb 2021 05:55:25 +0000
Subject: [PATCH net] net: ipa: pass correct dma_handle to  dma_free_coherent()
Message-Id: <YBjpTU2oejkNIULT@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Elder <elder@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "ring->addr = addr;" assignment is done a few lines later so we
can't use "ring->addr" yet.  The correct dma_handle is "addr".

Fixes: 650d1603825d ("soc: qcom: ipa: the generic software interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Smatch also complians about:

    drivers/net/ipa/gsi.c:1739 gsi_channel_setup()
    warn: missing error code 'ret'

It probably should return -EINVAL, but I'm not positive.

 drivers/net/ipa/gsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index f79cf3c327c1..b559d14271e2 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -1373,7 +1373,7 @@ static int gsi_ring_alloc(struct gsi *gsi, struct gsi_ring *ring, u32 count)
 	/* Hardware requires a 2^n ring size, with alignment equal to size */
 	ring->virt = dma_alloc_coherent(dev, size, &addr, GFP_KERNEL);
 	if (ring->virt && addr % size) {
-		dma_free_coherent(dev, size, ring->virt, ring->addr);
+		dma_free_coherent(dev, size, ring->virt, addr);
 		dev_err(dev, "unable to alloc 0x%zx-aligned ring buffer\n",
 			size);
 		return -EINVAL;	/* Not a good error value, but distinct */
-- 
2.29.2
