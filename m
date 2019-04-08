From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Apr 2019 08:15:13 +0000
Subject: [PATCH v2 2/2] io_uring: Potential Oops in io_sq_offload_start()
Message-Id: <20190408081513.GB15239@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190404104527.GX4038@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>
Cc: Amritha Nambiar <amritha.nambiar@intel.com>, Willem de Bruijn <willemb@google.com>, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>

The "p->sq_thread_cpu" variable is an integer which comes from the user.
We can't pass values greater than NR_CPUS to cpu_possible() or it could
lead to an out of bound read and possibly an Oops.

The recently added cpu_possible_safe() function can handle unfiltered
input so lets use that instead.  This patch also removes the call to
array_index_nospec() since that is handled in cpu_possible_safe().

Fixes: 6c271ce2f1d5 ("io_uring: add submission polling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
No change.

 fs/io_uring.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index c0fecb9d889f..9789887b0d36 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2240,16 +2240,13 @@ static int io_sq_offload_start(struct io_ring_ctx *ctx,
 		ctx->sq_thread_idle = HZ;
 
 	ret = -EINVAL;
-	if (!cpu_possible(p->sq_thread_cpu))
+	if (!cpu_possible_safe(p->sq_thread_cpu))
 		goto err;
 
 	if (ctx->flags & IORING_SETUP_SQPOLL) {
 		if (p->flags & IORING_SETUP_SQ_AFF) {
-			int cpu;
-
-			cpu = array_index_nospec(p->sq_thread_cpu, NR_CPUS);
 			ctx->sqo_thread = kthread_create_on_cpu(io_sq_thread,
-							ctx, cpu,
+							ctx, p->sq_thread_cpu,
 							"io_uring-sq");
 		} else {
 			ctx->sqo_thread = kthread_create(io_sq_thread, ctx,
-- 
2.17.1
