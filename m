From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Sep 2018 06:56:15 +0000
Subject: [PATCH] udmabuf: fix error code in map_udmabuf()
Message-Id: <20180914065615.GA12043@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org

We accidentally forgot to set "ret" on this error path so it means we
return NULL instead of an error pointer.  The caller checks for NULL and
changes it to an error pointer so it doesn't cause an issue at run time.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 9edabce0b8ab..5b44ef226904 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -61,8 +61,10 @@ static struct sg_table *map_udmabuf(struct dma_buf_attachment *at,
 					GFP_KERNEL);
 	if (ret < 0)
 		goto err;
-	if (!dma_map_sg(at->dev, sg->sgl, sg->nents, direction))
+	if (!dma_map_sg(at->dev, sg->sgl, sg->nents, direction)) {
+		ret = -EINVAL;
 		goto err;
+	}
 	return sg;
 
 err:
