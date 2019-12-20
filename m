From: Colin King <colin.king@canonical.com>
Date: Fri, 20 Dec 2019 23:33:22 +0000
Subject: [PATCH][next] io_uring: fix missing error return when percpu_ref_init fails
Message-Id: <20191220233322.13599-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to percpu_ref_init fails ctx->file_data is
set to null and because there is a missing return statement the
following statement dereferences this null pointer causing an oops.
Fix this by adding the missing -ENOMEM return to avoid the oops.

Addresses-Coverity: ("Explicit null dereference")
Fixes: cbb537634780 ("io_uring: avoid ring quiesce for fixed file set unregister and update")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/io_uring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index c756b8fc44c6..1d31294f5914 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -4937,6 +4937,7 @@ static int io_sqe_files_register(struct io_ring_ctx *ctx, void __user *arg,
 		kfree(ctx->file_data->table);
 		kfree(ctx->file_data);
 		ctx->file_data = NULL;
+		return -ENOMEM;
 	}
 	ctx->file_data->put_llist.first = NULL;
 	INIT_WORK(&ctx->file_data->ref_work, io_ring_file_ref_switch);
-- 
2.24.0
