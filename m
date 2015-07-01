From: Sohny Thomas <sohnythomas@zoho.com>
Date: Wed, 01 Jul 2015 13:58:44 +0000
Subject: [PATCH v2 2/3] Staging: android: ion: fix coding style
Message-Id: <5593EF44.3050708@zoho.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5593EA18.8060109@zoho.com>
In-Reply-To: <5593EA18.8060109@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, arve@android.com, riandrews@android.com, sumit.semwal@linaro.org, carlos@cgarcia.org
Cc: kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


- Fixed 80 char limit exceeding line
  and a newline after declarations as per checkpatch.pl

Signed-of-by: Sohny Thomas <sohnythomas@zoho.com>
---
 drivers/staging/android/ion/ion.c            | 1 +
 drivers/staging/android/ion/ion_chunk_heap.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
index 6f48112..e44f5e6 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -1106,6 +1106,7 @@ struct dma_buf *ion_share_dma_buf(struct ion_client *client,
 	struct ion_buffer *buffer;
 	struct dma_buf *dmabuf;
 	bool valid_handle;
+
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 
 	mutex_lock(&client->lock);
diff --git a/drivers/staging/android/ion/ion_chunk_heap.c b/drivers/staging/android/ion/ion_chunk_heap.c
index 5474615..0813163 100644
--- a/drivers/staging/android/ion/ion_chunk_heap.c
+++ b/drivers/staging/android/ion/ion_chunk_heap.c
@@ -173,8 +173,8 @@ struct ion_heap *ion_chunk_heap_create(struct ion_platform_heap *heap_data)
 	chunk_heap->heap.ops = &chunk_heap_ops;
 	chunk_heap->heap.type = ION_HEAP_TYPE_CHUNK;
 	chunk_heap->heap.flags = ION_HEAP_FLAG_DEFER_FREE;
-	pr_debug("%s: base %lu size %zu align %ld\n", __func__, chunk_heap->base,
-		heap_data->size, heap_data->align);
+	pr_debug("%s: base %lu size %zu align %ld\n", __func__,
+		chunk_heap->base, heap_data->size, heap_data->align);
 
 	return &chunk_heap->heap;
 
-- 



