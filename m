From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Dec 2018 14:50:11 +0000
Subject: [PATCH] mailbox: ti-msgmgr: Off by one in ti_msgmgr_of_xlate()
Message-Id: <20181203145011.7s3udfz4cug3ph3k@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>, Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The > comparison should be >= or we access one element beyond the end
of the array.

(The inst->qinsts[] array is allocated in the ti_msgmgr_probe() function
and it has ->num_valid_queues elements.)

Fixes: a2b79838b891 ("mailbox: ti-msgmgr: Add support for Secure Proxy")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mailbox/ti-msgmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
index 713d701b6568..6f6addd51d14 100644
--- a/drivers/mailbox/ti-msgmgr.c
+++ b/drivers/mailbox/ti-msgmgr.c
@@ -547,7 +547,7 @@ static struct mbox_chan *ti_msgmgr_of_xlate(struct mbox_controller *mbox,
 	}
 
 	if (d->is_sproxy) {
-		if (req_pid > d->num_valid_queues)
+		if (req_pid >= d->num_valid_queues)
 			goto err;
 		qinst = &inst->qinsts[req_pid];
 		return qinst->chan;
-- 
2.11.0
