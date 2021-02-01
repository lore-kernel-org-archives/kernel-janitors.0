From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Feb 2021 12:23:42 +0000
Subject: [PATCH] io_uring: Fix NULL dereference in error in io_sqe_files_register()
Message-Id: <YBfyzmcP1N6jpDjo@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Bijan Mottahedeh <bijan.mottahedeh@oracle.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, kernel-janitors@vger.kernel.org

If we hit a "goto out_free;" before the "ctx->file_data" pointer has
been assigned then it leads to a NULL derefence when we call:

	free_fixed_rsrc_data(ctx->file_data);

We can fix this by moving the assignment earlier.

Fixes: 3cfb739c561e ("io_uring: create common fixed_rsrc_data allocation routines")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 03748faa5295..8e8b74dd7d9b 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -7869,6 +7869,7 @@ static int io_sqe_files_register(struct io_ring_ctx *ctx, void __user *arg,
 	file_data = alloc_fixed_rsrc_data(ctx);
 	if (!file_data)
 		return -ENOMEM;
+	ctx->file_data = file_data;
 
 	nr_tables = DIV_ROUND_UP(nr_args, IORING_MAX_FILES_TABLE);
 	file_data->table = kcalloc(nr_tables, sizeof(*file_data->table),
@@ -7878,7 +7879,6 @@ static int io_sqe_files_register(struct io_ring_ctx *ctx, void __user *arg,
 
 	if (io_sqe_alloc_file_tables(file_data, nr_tables, nr_args))
 		goto out_free;
-	ctx->file_data = file_data;
 
 	for (i = 0; i < nr_args; i++, ctx->nr_user_files++) {
 		struct fixed_rsrc_table *table;
-- 
2.29.2
