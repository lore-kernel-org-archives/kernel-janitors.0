From: Dan Carpenter <error27@gmail.com>
Date: Tue, 10 Aug 2010 06:15:52 +0000
Subject: [patch] Staging: rtl8192e: add curly braces to if statement
Message-Id: <20100810061451.GC18431@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In the original code there was some extra semicolons after the if
statement:
	if (!channel_map[ieee->current_network.channel]);
						       ^^^
From the indenting it looked like that should be curly braces instead.

Also I made some white space changes to stop checkpatch.pl from
complaining.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/rtl8192e/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192e/ieee80211/ieee80211_softmac.c
index b7ec1dd..f6d81fe 100644
--- a/drivers/staging/rtl8192e/ieee80211/ieee80211_softmac.c
+++ b/drivers/staging/rtl8192e/ieee80211/ieee80211_softmac.c
@@ -527,16 +527,16 @@ void ieee80211_softmac_scan_wq(struct work_struct *work)
 	do{
 		ieee->current_network.channel  			(ieee->current_network.channel + 1) % MAX_CHANNEL_NUMBER;
-		if (watchdog++ > MAX_CHANNEL_NUMBER)
-		{
-		//if current channel is not in channel map, set to default channel.
-		#ifdef ENABLE_DOT11D
-      			if (!channel_map[ieee->current_network.channel]);
-		#else
-			if (!ieee->channel_map[ieee->current_network.channel]);
-		#endif
+		if (watchdog++ > MAX_CHANNEL_NUMBER) {
+			/* if current channel is not in channel map, set to default channel. */
+#ifdef ENABLE_DOT11D
+			if (!channel_map[ieee->current_network.channel]) {
+#else
+			if (!ieee->channel_map[ieee->current_network.channel]) {
+#endif
 				ieee->current_network.channel = 6;
 				goto out; /* no good chans */
+			}
 		}
 #ifdef ENABLE_DOT11D
         }while(!channel_map[ieee->current_network.channel]);
