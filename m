From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Oct 2016 09:52:03 +0000
Subject: [PATCH 52/54] md/raid10: Replace a seq_printf() call by seq_puts() in raid10_status()
Message-Id: <69fc2ab2-ddde-068f-1aca-398aa4ce811e@users.sourceforge.net>
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
Date: Wed, 5 Oct 2016 21:41:09 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Prefer seq_puts to seq_printf

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/raid10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 82d79f5..554b6d2 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -1502,7 +1502,7 @@ static void raid10_status(struct seq_file *seq, struct mddev *mddev)
 		seq_printf(seq, "%s", rdev && test_bit(In_sync, &rdev->flags) ? "U" : "_");
 	}
 	rcu_read_unlock();
-	seq_printf(seq, "]");
+	seq_puts(seq, "]");
 }
 
 /* check if there are enough drives for
-- 
2.10.1

