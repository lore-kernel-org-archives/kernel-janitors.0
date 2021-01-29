From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 29 Jan 2021 05:01:51 +0000
Subject: [PATCH] block: drop removed argument from kernel-doc of blk_execute_rq()
Message-Id: <20210129050151.26926-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 684da7628d93 ("block: remove unnecessary argument from
blk_execute_rq") changes the signature of blk_execute_rq(), but misses
to adjust its kernel-doc.

Hence, make htmldocs warns on ./block/blk-exec.c:78:

  warning: Excess function parameter 'q' description in 'blk_execute_rq'

Drop removed argument from kernel-doc of blk_execute_rq() as well.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Jens, please pick this minor fix on your block-next tree.

 block/blk-exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/blk-exec.c b/block/blk-exec.c
index 0ab873f10133..beae70a0e5e5 100644
--- a/block/blk-exec.c
+++ b/block/blk-exec.c
@@ -65,7 +65,6 @@ EXPORT_SYMBOL_GPL(blk_execute_rq_nowait);
 
 /**
  * blk_execute_rq - insert a request into queue for execution
- * @q:		queue to insert the request in
  * @bd_disk:	matching gendisk
  * @rq:		request to insert
  * @at_head:    insert request at head or tail of queue
-- 
2.17.1
