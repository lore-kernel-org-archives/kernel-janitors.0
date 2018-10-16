From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 16 Oct 2018 02:35:30 +0000
Subject: [PATCH net-next] mac80211: fix missing unlock on error in ieee80211_mark_sta_auth()
Message-Id: <1539657330-35956-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, Jouni Malinen <jouni@codeaurora.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing unlock before return from function
ieee80211_mark_sta_auth() in the error handling case.

Fixes: fc107a933071 ("mac80211: Helper function for marking STA authenticated")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/mac80211/mlme.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index d2bc8d5..755ca4d 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -2778,10 +2778,12 @@ static bool ieee80211_mark_sta_auth(struct ieee80211_sub_if_data *sdata,
 	sta = sta_info_get(sdata, bssid);
 	if (!sta) {
 		WARN_ONCE(1, "%s: STA %pM not found", sdata->name, bssid);
+		mutex_unlock(&sdata->local->sta_mtx);
 		return false;
 	}
 	if (sta_info_move_state(sta, IEEE80211_STA_AUTH)) {
 		sdata_info(sdata, "failed moving %pM to auth\n", bssid);
+		mutex_unlock(&sdata->local->sta_mtx);
 		return false;
 	}
 	mutex_unlock(&sdata->local->sta_mtx);
