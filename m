From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2016 11:13:04 +0000
Subject: [patch] md/r5cache: enable IRQs on error path
Message-Id: <20161124111304.GI17225@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaohua Li <shli@kernel.org>, Song Liu <songliubraving@fb.com>
Cc: linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to re-enable the IRQs here before returning.

Fixes: a39f7afde358 ("md/r5cache: write-out phase and reclaim support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/md/raid5-cache.c b/drivers/md/raid5-cache.c
index 2a60ce4..6610134 100644
--- a/drivers/md/raid5-cache.c
+++ b/drivers/md/raid5-cache.c
@@ -1029,7 +1029,7 @@ static sector_t r5c_calculate_new_cp(struct r5conf *conf)
 	spin_lock_irqsave(&log->stripe_in_journal_lock, flags);
 	if (list_empty(&conf->log->stripe_in_journal_list)) {
 		/* all stripes flushed */
-		spin_unlock(&log->stripe_in_journal_lock);
+		spin_unlock_irqrestore(&log->stripe_in_journal_lock, flags);
 		return log->next_checkpoint;
 	}
 	sh = list_first_entry(&conf->log->stripe_in_journal_list,
