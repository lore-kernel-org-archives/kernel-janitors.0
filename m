From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2021 09:26:39 +0000
Subject: [PATCH] io_uring: fix an IS_ERR() vs NULL check
Message-Id: <X/WCTxIRT4SHLemV@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

The alloc_fixed_file_ref_node() function never returns NULL, it returns
error pointers on error.

Fixes: 1ffc54220c44 ("io_uring: fix io_sqe_files_unregister() hangs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/io_uring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index ca46f314640b..2234ce03034a 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -7255,8 +7255,8 @@ static int io_sqe_files_unregister(struct io_ring_ctx *ctx)
 	if (!data)
 		return -ENXIO;
 	backup_node = alloc_fixed_file_ref_node(ctx);
-	if (!backup_node)
-		return -ENOMEM;
+	if (IS_ERR(backup_node))
+		return PTR_ERR(backup_node);
 
 	spin_lock_bh(&data->lock);
 	ref_node = data->node;
-- 
2.29.2
