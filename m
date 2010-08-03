From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Tue, 03 Aug 2010 01:10:22 +0000
Subject: [PATCH] wireless: ipw2100: check result of kzalloc()
Message-Id: <1280797822.11158.55.camel@lovely.krouter>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, Zhu Yi <yi.zhu@intel.com>, "David S. Miller" <davem@davemloft.net>, Reinette Chatre <reinette.chatre@intel.com>, linux-wireless <linux-wireless@vger.kernel.org>

If kzalloc() fails return with -ENOMEM from ipw2100_net_init() which is
called by register_netdev.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/net/wireless/ipw2x00/ipw2100.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/net/wireless/ipw2x00/ipw2100.c b/drivers/net/wireless/ipw2x00/ipw2100.c
index 0bd4dfa..908c176 100644
--- a/drivers/net/wireless/ipw2x00/ipw2100.c
+++ b/drivers/net/wireless/ipw2x00/ipw2100.c
@@ -1924,6 +1924,8 @@ static int ipw2100_net_init(struct net_device *dev)
 		bg_band->channels  			kzalloc(geo->bg_channels *
 				sizeof(struct ieee80211_channel), GFP_KERNEL);
+		if (!bg_band->channels)
+			return -ENOMEM;
 		/* translate geo->bg to bg_band.channels */
 		for (i = 0; i < geo->bg_channels; i++) {
 			bg_band->channels[i].band = IEEE80211_BAND_2GHZ;
-- 
1.7.1



