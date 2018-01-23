From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Jan 2018 08:33:56 +0000
Subject: [PATCH] ntb_perf: Fix an error code in perf_copy_chunk()
Message-Id: <20180123083356.GC10091@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We accidentally return success if dmaengine_submit() fails.  The fix is
to preserve the error code from dma_submit_error().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/ntb/test/ntb_perf.c b/drivers/ntb/test/ntb_perf.c
index 8de72f3fba4d..387e685063fc 100644
--- a/drivers/ntb/test/ntb_perf.c
+++ b/drivers/ntb/test/ntb_perf.c
@@ -828,7 +828,8 @@ static int perf_copy_chunk(struct perf_thread *pthr,
 	tx->callback_param = pthr;
 	dma_set_unmap(tx, unmap);
 
-	if (dma_submit_error(dmaengine_submit(tx))) {
+	ret = dma_submit_error(dmaengine_submit(tx));
+	if (ret) {
 		dmaengine_unmap_put(unmap);
 		goto err_free_resource;
 	}
