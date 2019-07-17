From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 17 Jul 2019 06:29:56 +0000
Subject: [PATCH] net: dsa: sja1105: Fix missing unlock on error in sk_buff()
Message-Id: <20190717062956.127446-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing unlock before return from function sk_buff()
in the error handling case.

Fixes: f3097be21bf1 ("net: dsa: sja1105: Add a state machine for RX timestamping")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/dsa/tag_sja1105.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/dsa/tag_sja1105.c b/net/dsa/tag_sja1105.c
index 1d96c9d4a8e9..26363d72d25b 100644
--- a/net/dsa/tag_sja1105.c
+++ b/net/dsa/tag_sja1105.c
@@ -216,6 +216,7 @@ static struct sk_buff
 		if (!skb) {
 			dev_err_ratelimited(dp->ds->dev,
 					    "Failed to copy stampable skb\n");
+			spin_unlock(&sp->data->meta_lock);
 			return NULL;
 		}
 		sja1105_transfer_meta(skb, meta);
