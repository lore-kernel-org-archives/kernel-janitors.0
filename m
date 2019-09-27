From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Sep 2019 09:40:39 +0000
Subject: [PATCH] net: tap: clean up an indentation issue
Message-Id: <20190927094039.23370-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented too deeply, remove
the extraneous tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/tap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index bcdfb0d88753..a6d63665ad03 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -1190,7 +1190,7 @@ static int tap_get_user_xdp(struct tap_queue *q, struct xdp_buff *xdp)
 	kfree_skb(skb);
 err:
 	rcu_read_lock();
-		tap = rcu_dereference(q->tap);
+	tap = rcu_dereference(q->tap);
 	if (tap && tap->count_tx_dropped)
 		tap->count_tx_dropped(tap);
 	rcu_read_unlock();
-- 
2.20.1
