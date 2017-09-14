From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Sep 2017 23:05:16 +0000
Subject: [PATCH] dma-buf: remove redundant initialization of sg_table
Message-Id: <20170914230516.6056-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

sg_table is being initialized and is never read before it is updated
again later on, hence making the initialization redundant. Remove
the initialization.

Detected by clang scan-build:
"warning: Value stored to 'sg_table' during its initialization is
never read"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 4a038dcf5361..bc1cb284111c 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -625,7 +625,7 @@ EXPORT_SYMBOL_GPL(dma_buf_detach);
 struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 					enum dma_data_direction direction)
 {
-	struct sg_table *sg_table = ERR_PTR(-EINVAL);
+	struct sg_table *sg_table;
 
 	might_sleep();
 
-- 
2.14.1

