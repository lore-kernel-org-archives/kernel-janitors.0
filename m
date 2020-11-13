From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Nov 2020 10:16:31 +0000
Subject: [PATCH] dmaengine: fix error codes in channel_register()
Message-Id: <20201113101631.GE168908@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>
Cc: Dave Jiang <dave.jiang@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

The error codes were not set on some of these error paths.

Also the error handling was more confusing than it needed to be so I
cleaned it up and shuffled it around a bit.

Fixes: d2fb0a043838 ("dmaengine: break out channel registration")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/dma/dmaengine.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 7974fa0400d8..962cbb5e5f7f 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -1039,16 +1039,15 @@ static int get_dma_id(struct dma_device *device)
 static int __dma_async_device_channel_register(struct dma_device *device,
 					       struct dma_chan *chan)
 {
-	int rc = 0;
+	int rc;
 
 	chan->local = alloc_percpu(typeof(*chan->local));
 	if (!chan->local)
-		goto err_out;
+		return -ENOMEM;
 	chan->dev = kzalloc(sizeof(*chan->dev), GFP_KERNEL);
 	if (!chan->dev) {
-		free_percpu(chan->local);
-		chan->local = NULL;
-		goto err_out;
+		rc = -ENOMEM;
+		goto err_free_local;
 	}
 
 	/*
@@ -1061,7 +1060,8 @@ static int __dma_async_device_channel_register(struct dma_device *device,
 	if (chan->chan_id < 0) {
 		pr_err("%s: unable to alloc ida for chan: %d\n",
 		       __func__, chan->chan_id);
-		goto err_out;
+		rc = chan->chan_id;
+		goto err_free_dev;
 	}
 
 	chan->dev->device.class = &dma_devclass;
@@ -1082,9 +1082,10 @@ static int __dma_async_device_channel_register(struct dma_device *device,
 	mutex_lock(&device->chan_mutex);
 	ida_free(&device->chan_ida, chan->chan_id);
 	mutex_unlock(&device->chan_mutex);
- err_out:
-	free_percpu(chan->local);
+ err_free_dev:
 	kfree(chan->dev);
+ err_free_local:
+	free_percpu(chan->local);
 	return rc;
 }
 
-- 
2.28.0
