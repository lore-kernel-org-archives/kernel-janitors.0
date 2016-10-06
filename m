From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Oct 2016 09:36:04 +0000
Subject: [PATCH 36/54] md/raid5: Delete four unwanted spaces behind function names
Message-Id: <2c1b7aaa-9872-0547-b22a-fc05d4d9210d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <786843ef-4b6f-eb04-7326-2f6f5b408826@users.sourceforge.net>
In-Reply-To: <786843ef-4b6f-eb04-7326-2f6f5b408826@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-raid@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Guoqing Jiang <gqjiang@suse.com>, Jens Axboe <axboe@fb.com>, Mike Christie <mchristi@redhat.com>, Neil Brown <neilb@suse.com>, Shaohua Li <shli@kernel.org>, Tomasz Majchrzak <tomasz.majchrzak@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 5 Oct 2016 14:37:17 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: space prohibited between function name and open parenthesis '('

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/raid5.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index f7a3369..ebcd692 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -236,7 +236,7 @@ static void return_io(struct bio_list *return_bi)
 	}
 }
 
-static void print_raid5_conf (struct r5conf *conf);
+static void print_raid5_conf(struct r5conf *conf);
 
 static int stripe_operations_active(struct stripe_head *sh)
 {
@@ -7032,17 +7032,22 @@ static void raid5_status(struct seq_file *seq, struct mddev *mddev)
 
 	seq_printf(seq, " level %d, %dk chunk, algorithm %d", mddev->level,
 		conf->chunk_sectors / 2, mddev->layout);
-	seq_printf (seq, " [%d/%d] [", conf->raid_disks, conf->raid_disks - mddev->degraded);
+	seq_printf(seq,
+		   " [%d/%d] [",
+		   conf->raid_disks,
+		   conf->raid_disks - mddev->degraded);
 	rcu_read_lock();
 	for (i = 0; i < conf->raid_disks; i++) {
 		struct md_rdev *rdev = rcu_dereference(conf->disks[i].rdev);
-		seq_printf (seq, "%s", rdev && test_bit(In_sync, &rdev->flags) ? "U" : "_");
+		seq_printf(seq,
+			   "%s",
+			   rdev && test_bit(In_sync, &rdev->flags) ? "U" : "_");
 	}
 	rcu_read_unlock();
 	seq_printf (seq, "]");
 }
 
-static void print_raid5_conf (struct r5conf *conf)
+static void print_raid5_conf(struct r5conf *conf)
 {
 	int i;
 	struct disk_info *tmp;
-- 
2.10.1

