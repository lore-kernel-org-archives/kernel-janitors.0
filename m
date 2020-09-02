From: Colin King <colin.king@canonical.com>
Date: Wed, 02 Sep 2020 16:28:05 +0000
Subject: [PATCH][next] RDMA/ucma: fix memory leak of mc on an xa_alloc failure
Message-Id: <20200902162805.200436-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when an xa_alloc failure occurs the error exit path leaks
the allocated object mc.  Fix this by adding an error return path
that frees mc and rename error exit paths err3 to err4 and err2 to err3.

Fixes: 95fe51096b7a ("RDMA/ucma: Remove mc_list and rely on xarray")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/core/ucma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/infiniband/core/ucma.c b/drivers/infiniband/core/ucma.c
index f2c9ef6ae481..f081da35e3cf 100644
--- a/drivers/infiniband/core/ucma.c
+++ b/drivers/infiniband/core/ucma.c
@@ -1464,7 +1464,7 @@ static ssize_t ucma_process_join(struct ucma_file *file,
 	if (xa_alloc(&multicast_table, &mc->id, NULL, xa_limit_32b,
 		     GFP_KERNEL)) {
 		ret = -ENOMEM;
-		goto err1;
+		goto err2;
 	}
 
 	mutex_lock(&ctx->mutex);
@@ -1472,13 +1472,13 @@ static ssize_t ucma_process_join(struct ucma_file *file,
 				  join_state, mc);
 	mutex_unlock(&ctx->mutex);
 	if (ret)
-		goto err2;
+		goto err3;
 
 	resp.id = mc->id;
 	if (copy_to_user(u64_to_user_ptr(cmd->response),
 			 &resp, sizeof(resp))) {
 		ret = -EFAULT;
-		goto err3;
+		goto err4;
 	}
 
 	xa_store(&multicast_table, mc->id, mc, 0);
@@ -1486,13 +1486,14 @@ static ssize_t ucma_process_join(struct ucma_file *file,
 	ucma_put_ctx(ctx);
 	return 0;
 
-err3:
+err4:
 	mutex_lock(&ctx->mutex);
 	rdma_leave_multicast(ctx->cm_id, (struct sockaddr *) &mc->addr);
 	mutex_unlock(&ctx->mutex);
 	ucma_cleanup_mc_events(mc);
-err2:
+err3:
 	xa_erase(&multicast_table, mc->id);
+err2:
 	kfree(mc);
 err1:
 	ucma_put_ctx(ctx);
-- 
2.27.0
