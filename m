From: Colin King <colin.king@canonical.com>
Date: Wed, 30 Oct 2019 08:02:41 +0000
Subject: [PATCH] mailbox: ti-msgmgr: fix spelling mistake "queuid" -> "queue id"
Message-Id: <20191030080241.11262-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mailbox/ti-msgmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
index 88047d835211..f33b173c0bd0 100644
--- a/drivers/mailbox/ti-msgmgr.c
+++ b/drivers/mailbox/ti-msgmgr.c
@@ -592,7 +592,7 @@ static int ti_msgmgr_queue_setup(int idx, struct device *dev,
 	qinst->queue_id = qd->queue_id;
 
 	if (qinst->queue_id > d->queue_count) {
-		dev_err(dev, "Queue Data [idx=%d] queuid %d > %d\n",
+		dev_err(dev, "Queue Data [idx=%d] queue id %d > %d\n",
 			idx, qinst->queue_id, d->queue_count);
 		return -ERANGE;
 	}
-- 
2.20.1
