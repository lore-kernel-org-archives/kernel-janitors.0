From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 20 Sep 2020 11:26:18 +0000
Subject: [PATCH 06/14] block: drop double zeroing
Message-Id: <1600601186-7420-7-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: kernel-janitors@vger.kernel.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org

sg_init_table zeroes its first argument, so the allocation of that argument
doesn't have to.

the semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
@@

x - kzalloc
+ kmalloc
 (...)
...
sg_init_table(x,...)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 block/bsg-lib.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/block/bsg-lib.c b/block/bsg-lib.c
--- a/block/bsg-lib.c
+++ b/block/bsg-lib.c
@@ -207,7 +207,7 @@ static int bsg_map_buffer(struct bsg_buf
 
 	BUG_ON(!req->nr_phys_segments);
 
-	buf->sg_list = kzalloc(sz, GFP_KERNEL);
+	buf->sg_list = kmalloc(sz, GFP_KERNEL);
 	if (!buf->sg_list)
 		return -ENOMEM;
 	sg_init_table(buf->sg_list, req->nr_phys_segments);
