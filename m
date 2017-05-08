From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 09:13:16 +0000
Subject: [PATCH 3/4] dma-buf: Adjust a null pointer check in dma_buf_attach()
Message-Id: <1deb58e7-7eac-55d6-235a-baf72f392371@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3d972fa2-787a-d1f2-ff86-5c05494e00d3@users.sourceforge.net>
In-Reply-To: <3d972fa2-787a-d1f2-ff86-5c05494e00d3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, Gustavo Padovan <gustavo@padovan.org>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 10:54:17 +0200

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written "!attach"

Thus adjust this expression.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 9887d72cf804..4a038dcf5361 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -559,7 +559,7 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 		return ERR_PTR(-EINVAL);
 
 	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
-	if (attach = NULL)
+	if (!attach)
 		return ERR_PTR(-ENOMEM);
 
 	attach->dev = dev;
-- 
2.12.2

