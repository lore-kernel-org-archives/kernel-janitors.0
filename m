From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 09:12:31 +0000
Subject: [PATCH 2/4] dma-buf: Improve a size determination in dma_buf_attach()
Message-Id: <cff83dc6-4391-d9b1-6ac2-791d5a3e2eb4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3d972fa2-787a-d1f2-ff86-5c05494e00d3@users.sourceforge.net>
In-Reply-To: <3d972fa2-787a-d1f2-ff86-5c05494e00d3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, Gustavo Padovan <gustavo@padovan.org>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 10:50:09 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 53257c166f4d..9887d72cf804 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -558,7 +558,7 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 	if (WARN_ON(!dmabuf || !dev))
 		return ERR_PTR(-EINVAL);
 
-	attach = kzalloc(sizeof(struct dma_buf_attachment), GFP_KERNEL);
+	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
 	if (attach = NULL)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.12.2

