From: Akshay Shipurkar <akshayshipurkar@gmail.com>
Date: Tue, 23 Aug 2016 09:22:13 +0000
Subject: [PATCH] staging: android: ion_cma_heap: Fixed a extra blank line coding style issue
Message-Id: <20160823091013.GA20016@akshays-HP-ENVY-15-Notebook-PC>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, labbott@redhat.com, sumit.semwal@linaro.org, linux-kernel@vger.kernel.org

Fixed a extra blank coding style issue. Deleted the extra blank line on
line 42 of ion_cma_heap.c

Signed-off-by: Akshay Shipurkar <akshayshipurkar@gmail.com>
---
 drivers/staging/android/ion/ion_cma_heap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/android/ion/ion_cma_heap.c b/drivers/staging/android/ion/ion_cma_heap.c
index d5ff3a2..ff719fb 100644
--- a/drivers/staging/android/ion/ion_cma_heap.c
+++ b/drivers/staging/android/ion/ion_cma_heap.c
@@ -39,7 +39,6 @@ struct ion_cma_buffer_info {
 	struct sg_table *table;
 };
 
-
 /* ION CMA heap operations functions */
 static int ion_cma_allocate(struct ion_heap *heap, struct ion_buffer *buffer,
 			    unsigned long len, unsigned long align,
-- 
2.7.4

