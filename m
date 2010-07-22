From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Jul 2010 11:14:19 +0000
Subject: [patch net-next] mac80211: freeing the wrong variable
Message-Id: <20100722111419.GC17585@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd@openwrt.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, "John W. Linville" <linville@tuxdriver.com>, Ming Lei <tom.leiming@gmail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The intent was to free "msp->ratelist" here.  "msp->sample_table" is
always NULL at this point.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/mac80211/rc80211_minstrel_ht.c b/net/mac80211/rc80211_minstrel_ht.c
index b5ace24..0ec0584 100644
--- a/net/mac80211/rc80211_minstrel_ht.c
+++ b/net/mac80211/rc80211_minstrel_ht.c
@@ -748,7 +748,7 @@ minstrel_ht_alloc_sta(void *priv, struct ieee80211_sta *sta, gfp_t gfp)
 	return msp;
 
 error1:
-	kfree(msp->sample_table);
+	kfree(msp->ratelist);
 error:
 	kfree(msp);
 	return NULL;
