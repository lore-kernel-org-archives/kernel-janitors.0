From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Dec 2018 14:49:33 +0000
Subject: [PATCH] dmaengine: dmatest: fix a small memory leak in dmatest_func()
Message-Id: <20181203144933.uwkmm2sjs434t322@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently moved the test size tests around but it means we need to
adjust the error handling as well or we leak the "pq_coefs" memory.  I
updated the label name to reflect that we're freeing coefs.

Fixes: 787d3083caf8 ("dmaengine: dmatest: move size checks earlier in function")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/dma/dmatest.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index e71aa1e3451c..28deaa084257 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -511,18 +511,18 @@ static int dmatest_func(void *data)
 	if ((src_cnt + dst_cnt) >= 255) {
 		pr_err("too many buffers (%d of 255 supported)\n",
 		       src_cnt + dst_cnt);
-		goto err_thread_type;
+		goto err_free_coefs;
 	}
 
 	if (1 << align > params->buf_size) {
 		pr_err("%u-byte buffer too small for %d-byte alignment\n",
 		       params->buf_size, 1 << align);
-		goto err_thread_type;
+		goto err_free_coefs;
 	}
 
 	thread->srcs = kcalloc(src_cnt + 1, sizeof(u8 *), GFP_KERNEL);
 	if (!thread->srcs)
-		goto err_srcs;
+		goto err_free_coefs;
 
 	thread->usrcs = kcalloc(src_cnt + 1, sizeof(u8 *), GFP_KERNEL);
 	if (!thread->usrcs)
@@ -800,7 +800,7 @@ static int dmatest_func(void *data)
 	kfree(thread->usrcs);
 err_usrcs:
 	kfree(thread->srcs);
-err_srcs:
+err_free_coefs:
 	kfree(pq_coefs);
 err_thread_type:
 	pr_info("%s: summary %u tests, %u failures %llu iops %llu KB/s (%d)\n",
-- 
2.11.0
