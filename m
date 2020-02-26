From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 26 Feb 2020 09:07:07 +0000
Subject: [PATCH] dmaengine: Simplify error handling path in '__dma_async_device_channel_register()'
Message-Id: <20200226090707.12285-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.j.williams@intel.com, vkoul@kernel.org, dave.jiang@intel.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'chan->dev = kzalloc()' fails, there is no need to explicitly call
'free_percpu()'. It is already called in the error handling path.
So it can be removed.

While at it, add a 'chan->local = NULL;' in the error handling path after
the 'free_percpu()' call. It is maybe useless, but can not hurt.

Fixes: d2fb0a043838 ("dmaengine: break out channel registration")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure a Fixes tag is required for just a clean-up. I added it if the
move of the 'chan->local = NULL;' makes a real sense.
---
 drivers/dma/dmaengine.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index c3b1283b6d31..6bb6e88c6019 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -978,11 +978,8 @@ static int __dma_async_device_channel_register(struct dma_device *device,
 	if (!chan->local)
 		goto err_out;
 	chan->dev = kzalloc(sizeof(*chan->dev), GFP_KERNEL);
-	if (!chan->dev) {
-		free_percpu(chan->local);
-		chan->local = NULL;
+	if (!chan->dev)
 		goto err_out;
-	}
 
 	/*
 	 * When the chan_id is a negative value, we are dynamically adding
@@ -1008,6 +1005,7 @@ static int __dma_async_device_channel_register(struct dma_device *device,
 
  err_out:
 	free_percpu(chan->local);
+	chan->local = NULL;
 	kfree(chan->dev);
 	if (atomic_dec_return(idr_ref) = 0)
 		kfree(idr_ref);
-- 
2.20.1
