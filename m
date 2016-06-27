From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jun 2016 14:31:18 +0000
Subject: [patch] mac80211: silence an uninitialize variable warning
Message-Id: <20160627143118.GB19889@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We normally return an unitialized value, but no one checks it so it
doesn't matter.  Anyway, let's silence the static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/mac80211/tdls.c b/net/mac80211/tdls.c
index 1c7d45a..b5d28f1 100644
--- a/net/mac80211/tdls.c
+++ b/net/mac80211/tdls.c
@@ -1747,6 +1747,7 @@ ieee80211_process_tdls_channel_switch_resp(struct ieee80211_sub_if_data *sdata,
 		goto out;
 	}
 
+	ret = 0;
 call_drv:
 	drv_tdls_recv_channel_switch(sdata->local, sdata, &params);
 
