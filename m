From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Oct 2019 12:43:15 +0000
Subject: [PATCH][next] io-wq: fix unintentional integer overflow on left shift
Message-Id: <20191025124315.21742-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting the integer value 1U is evaluated with type unsigned int
using 32-bit arithmetic and then used in an expression that expects
a 64-bit value, so there is potentially an integer overflow. Fix this
by using the BIT_ULL macro to perform the shift and avoid the overflow.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 46134db8fdc5 ("io-wq: small threadpool implementation for io_uring")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/io-wq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/io-wq.c b/fs/io-wq.c
index 35e94792d47c..ea5d37193f31 100644
--- a/fs/io-wq.c
+++ b/fs/io-wq.c
@@ -228,8 +228,8 @@ static struct io_wq_work *io_get_next_work(struct io_wqe *wqe, unsigned *hash)
 
 		/* hashed, can run if not already running */
 		*hash = work->flags >> IO_WQ_HASH_SHIFT;
-		if (!(wqe->hash_map & (1U << *hash))) {
-			wqe->hash_map |= (1U << *hash);
+		if (!(wqe->hash_map & BIT_ULL(*hash))) {
+			wqe->hash_map |= BIT_ULL(*hash);
 			list_del(&work->list);
 			return work;
 		}
-- 
2.20.1
