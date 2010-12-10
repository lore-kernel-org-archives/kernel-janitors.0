From: Dan Carpenter <error27@gmail.com>
Date: Fri, 10 Dec 2010 12:41:18 +0000
Subject: [patch] Staging: rtl8192u: add missing curly braces
Message-Id: <20101210124118.GD10623@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The if condition was ignored in the original code and we just used the
default channel.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
index 1285888..20f8c34 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
@@ -509,9 +509,10 @@ void ieee80211_softmac_scan_wq(struct work_struct *work)
 		if (watchdog++ > MAX_CHANNEL_NUMBER)
 		{
 		//if current channel is not in channel map, set to default channel.
-			if (!channel_map[ieee->current_network.channel]);
+			if (!channel_map[ieee->current_network.channel]) {
 				ieee->current_network.channel = 6;
 				goto out; /* no good chans */
+			}
 		}
 	}while(!channel_map[ieee->current_network.channel]);
 	if (ieee->scanning = 0 )
