From: Colin King <colin.king@canonical.com>
Date: Thu, 10 May 2018 14:32:17 +0000
Subject: [PATCH] rsi: fix spelling mistake: "thead" -> "thread"
Message-Id: <20180510143217.23488-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Amitkumar Karwar <amit.karwar@redpinesignals.com>, Prameela Rani Garnepudi <prameela.j04cs@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in rsi_dbg debug message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/rsi/rsi_91x_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_core.c b/drivers/net/wireless/rsi/rsi_91x_core.c
index 1f1b97220d43..3644d7d99463 100644
--- a/drivers/net/wireless/rsi/rsi_91x_core.c
+++ b/drivers/net/wireless/rsi/rsi_91x_core.c
@@ -485,7 +485,7 @@ void rsi_core_xmit(struct rsi_common *common, struct sk_buff *skb)
 	}
 
 	rsi_core_queue_pkt(common, skb);
-	rsi_dbg(DATA_TX_ZONE, "%s: ==> Scheduling TX thead <==\n", __func__);
+	rsi_dbg(DATA_TX_ZONE, "%s: ==> Scheduling TX thread <==\n", __func__);
 	rsi_set_event(&common->tx_thread.event);
 
 	return;
-- 
2.17.0

