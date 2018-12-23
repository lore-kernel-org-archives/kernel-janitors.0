From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Dec 2018 08:57:15 +0000
Subject: [PATCH 20/20] cw1200: drop useless LIST_HEAD
Message-Id: <1545555435-24576-21-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solomon Peachy <pizza@shaftnet.org>
Cc: kernel-janitors@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Drop LIST_HEAD where the variable it declares has never
been used.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
@@
- LIST_HEAD(x);
  ... when != x
// </smpl>

Fixes: a910e4a94f692 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Successfully 0-day tested on 151 configurations.

 drivers/net/wireless/st/cw1200/queue.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/st/cw1200/queue.c b/drivers/net/wireless/st/cw1200/queue.c
index 7c31b63b8258..7895efefa95d 100644
--- a/drivers/net/wireless/st/cw1200/queue.c
+++ b/drivers/net/wireless/st/cw1200/queue.c
@@ -283,7 +283,6 @@ int cw1200_queue_put(struct cw1200_queue *queue,
 		     struct cw1200_txpriv *txpriv)
 {
 	int ret = 0;
-	LIST_HEAD(gc_list);
 	struct cw1200_queue_stats *stats = queue->stats;
 
 	if (txpriv->link_id >= queue->stats->map_capacity)
