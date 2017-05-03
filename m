From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 May 2017 18:36:15 +0000
Subject: [PATCH 2/2] blk-mq-debugfs: Add spaces in queue_poll_stat_show()
Message-Id: <49822157-111d-0f44-3a5f-bd070cf7ebc7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <507a3eee-6dfe-c218-1056-38221bd22be7@users.sourceforge.net>
In-Reply-To: <507a3eee-6dfe-c218-1056-38221bd22be7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-block@vger.kernel.org, Bart Van Assche <bart.vanassche@sandisk.com>, Jens Axboe <axboe@kernel.dk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 May 2017 20:18:22 +0200

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 block/blk-mq-debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 2265b70b1121..34cdd5f2b511 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -156,12 +156,12 @@ static int queue_poll_stat_show(struct seq_file *m, void *v)
 	struct request_queue *q = m->private;
 	int bucket;
 
-	for (bucket = 0; bucket < BLK_MQ_POLL_STATS_BKTS/2; bucket++) {
-		seq_printf(m, "read  (%d Bytes): ", 1 << (9+bucket));
-		print_stat(m, &q->poll_stat[2*bucket]);
+	for (bucket = 0; bucket < BLK_MQ_POLL_STATS_BKTS / 2; bucket++) {
+		seq_printf(m, "read  (%d Bytes): ", 1 << (9 + bucket));
+		print_stat(m, &q->poll_stat[2 * bucket]);
 		seq_putc(m, '\n');
-		seq_printf(m, "write (%d Bytes): ",  1 << (9+bucket));
-		print_stat(m, &q->poll_stat[2*bucket+1]);
+		seq_printf(m, "write (%d Bytes): ",  1 << (9 + bucket));
+		print_stat(m, &q->poll_stat[2 * bucket + 1]);
 		seq_putc(m, '\n');
 	}
 	return 0;
-- 
2.12.2

