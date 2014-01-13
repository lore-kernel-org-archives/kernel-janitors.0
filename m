From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Jan 2014 19:05:23 +0000
Subject: [patch] p54: clamp properly instead of just truncating
Message-Id: <20140113190523.GA9341@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The call to clamp_t() first truncates the variable signed 8 bit and as a
result, the actual clamp is a no-op.

Fixes: 0d78156eef1d ('p54: improve site survey')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/p54/txrx.c b/drivers/net/wireless/p54/txrx.c
index 9c96831c0b5c..153c61539ec8 100644
--- a/drivers/net/wireless/p54/txrx.c
+++ b/drivers/net/wireless/p54/txrx.c
@@ -586,7 +586,7 @@ static void p54_rx_stats(struct p54_common *priv, struct sk_buff *skb)
 	chan = priv->curchan;
 	if (chan) {
 		struct survey_info *survey = &priv->survey[chan->hw_value];
-		survey->noise = clamp_t(s8, priv->noise, -128, 127);
+		survey->noise = clamp(priv->noise, -128, 127);
 		survey->channel_time = priv->survey_raw.active;
 		survey->channel_time_tx = priv->survey_raw.tx;
 		survey->channel_time_busy = priv->survey_raw.tx +
