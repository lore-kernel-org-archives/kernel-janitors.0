From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 24 Jan 2021 07:09:23 +0000
Subject: [PATCH] dmaengine: ti: k3-udma: Fix a resource leak in an error handling path
Message-Id: <20210124070923.724479-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peter.ujfalusi@gmail.com, dan.j.williams@intel.com, vkoul@kernel.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In 'dma_pool_create()', we return -ENOMEM, but don't release the resources
already allocated, as in all the other error handling paths.

Go to 'err_res_free' instead of returning directly.

Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDMA")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is not even compile tested.
I don't have the needed configuration.
---
 drivers/dma/ti/k3-udma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 8e3fd1119a77..96ad21869ba7 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2447,7 +2447,8 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 			dev_err(ud->ddev.dev,
 				"Descriptor pool allocation failed\n");
 			uc->use_dma_pool = false;
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto err_res_free;
 		}
 
 		uc->use_dma_pool = true;
-- 
2.27.0
