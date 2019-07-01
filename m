From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jul 2019 19:27:25 +0000
Subject: [PATCH] blk-mq: Use seq_puts() in __blk_mq_debugfs_rq_show()
Message-Id: <81847ca5-fac5-710c-29d5-f70b58f6437d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 Jul 2019 21:21:04 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function “seq_puts”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 block/blk-mq-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 748164f4e8b1..bc1b70aeb2ca 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -331,7 +331,7 @@ int __blk_mq_debugfs_rq_show(struct seq_file *m, struct request *rq)
 	if (strcmp(op_str, "UNKNOWN") == 0)
 		seq_printf(m, "%u", op);
 	else
-		seq_printf(m, "%s", op_str);
+		seq_puts(m, op_str);
 	seq_puts(m, ", .cmd_flags=");
 	blk_flags_show(m, rq->cmd_flags & ~REQ_OP_MASK, cmd_flag_name,
 		       ARRAY_SIZE(cmd_flag_name));
--
2.22.0
