From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Jul 2010 12:21:02 +0000
Subject: [patch -next] libertas: precedence bug
Message-Id: <20100722122102.GH17585@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dcbw@redhat.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Holger Schurig <holgerschurig@gmail.com>, "David S. Miller" <davem@davemloft.net>, Amitkumar Karwar <akarwar@marvell.com>, Stephen Hemminger <shemminger@vyatta.com>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Negate has precedence over comparison so the original test was always
false.  (Neither 0 nor 1 are equal to NL80211_IFTYPE_MONITOR).

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/libertas/tx.c b/drivers/net/wireless/libertas/tx.c
index 411a3bb..8000ca6 100644
--- a/drivers/net/wireless/libertas/tx.c
+++ b/drivers/net/wireless/libertas/tx.c
@@ -180,7 +180,7 @@ void lbs_send_tx_feedback(struct lbs_private *priv, u32 try_count)
 {
 	struct tx_radiotap_hdr *radiotap_hdr;
 
-	if (!priv->wdev->iftype = NL80211_IFTYPE_MONITOR ||
+	if (priv->wdev->iftype != NL80211_IFTYPE_MONITOR ||
 	    priv->currenttxskb = NULL)
 		return;
 
