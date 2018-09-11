From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 11 Sep 2018 12:28:24 +0000
Subject: [PATCH] qtnfmac: remove set but not used variable 'vif'
Message-Id: <1536668904-13110-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Igor Mitsyanko <imitsyanko@quantenna.com>, Avinash Patil <avinashp@quantenna.com>, Sergey Matyukevich <smatyukevich@quantenna.com>, Kalle Valo <kvalo@codeaurora.org>, Sergei Maksimenko <smaksimenko@quantenna.com>, Vasily Ulyanov <vulyanov@quantenna.com>, Andrey Shevchenko <ashevchenko@quantenna.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/quantenna/qtnfmac/cfg80211.c: In function 'qtnf_dump_survey':
drivers/net/wireless/quantenna/qtnfmac/cfg80211.c:694:19: warning:
 variable 'vif' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/quantenna/qtnfmac/cfg80211.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
index 4aa332f..452d4b7 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
@@ -691,11 +691,8 @@ static int qtnf_set_default_key(struct wiphy *wiphy, struct net_device *dev,
 	const struct cfg80211_chan_def *chandef = &wdev->chandef;
 	struct ieee80211_channel *chan;
 	struct qtnf_chan_stats stats;
-	struct qtnf_vif *vif;
 	int ret;
 
-	vif = qtnf_netdev_get_priv(dev);
-
 	sband = wiphy->bands[NL80211_BAND_2GHZ];
 	if (sband && idx >= sband->n_channels) {
 		idx -= sband->n_channels;
