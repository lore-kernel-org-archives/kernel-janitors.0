From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 30 Jan 2016 14:39:06 +0000
Subject: [patch] mac80211: free sinfo on error path
Message-Id: <20160130143906.GD3462@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a missing kfree(sinfo) on error in sta_info_insert_finish().

Fixes: 5fe74014172d ('mac80211: avoid excessive stack usage in sta_info')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index 6c198e6..1502efb 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -562,6 +562,7 @@ static int sta_info_insert_finish(struct sta_info *sta) __acquires(RCU)
  out_err:
 	mutex_unlock(&local->sta_mtx);
 	rcu_read_lock();
+	kfree(sinfo);
 	return err;
 }
 
