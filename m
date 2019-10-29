From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 29 Oct 2019 18:29:43 +0000
Subject: [PATCH] dma-buf: Fix a warning message in dma_heap_buffer_destroy()
Message-Id: <20191029182943.GD17569@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <john.stultz@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>, linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org

The first argument of WARN() is a condition so this will just print the
function name instead of the whole warning message.

Fixes: 7b87ea704fd9 ("dma-buf: heaps: Add heap helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/dma-buf/heaps/heap-helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index 750bef4e902d..a31684c0d5b2 100644
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ b/drivers/dma-buf/heaps/heap-helpers.c
@@ -52,7 +52,7 @@ static void *dma_heap_map_kernel(struct heap_helper_buffer *buffer)
 static void dma_heap_buffer_destroy(struct heap_helper_buffer *buffer)
 {
 	if (buffer->vmap_cnt > 0) {
-		WARN("%s: buffer still mapped in the kernel\n", __func__);
+		WARN(1, "%s: buffer still mapped in the kernel\n", __func__);
 		vunmap(buffer->vaddr);
 	}
 
-- 
2.20.1
