From: Colin King <colin.king@canonical.com>
Date: Mon, 12 Oct 2020 14:03:41 +0000
Subject: [PATCH][next] io_uring: Fix sizeof() mismatch
Message-Id: <20201012140341.77412-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An incorrect sizeof() is being used, sizeof(file_data->table) is not
correct, it should be sizeof(*file_data->table).

Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Fixes: 5398ae698525 ("io_uring: clean file_data access in files_register")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index b58169240c77..6b30670fffbd 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -7306,7 +7306,7 @@ static int io_sqe_files_register(struct io_ring_ctx *ctx, void __user *arg,
 	spin_lock_init(&file_data->lock);
 
 	nr_tables = DIV_ROUND_UP(nr_args, IORING_MAX_FILES_TABLE);
-	file_data->table = kcalloc(nr_tables, sizeof(file_data->table),
+	file_data->table = kcalloc(nr_tables, sizeof(*file_data->table),
 				   GFP_KERNEL);
 	if (!file_data->table)
 		goto out_free;
-- 
2.27.0
