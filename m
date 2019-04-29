From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 29 Apr 2019 13:58:12 +0000
Subject: [PATCH] mac80211: remove set but not used variable 'old'
Message-Id: <20190429140754.76537-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, alexander@wetzel-home.de
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

net/mac80211/key.c: In function 'ieee80211_set_tx_key':
net/mac80211/key.c:271:24: warning:
 variable 'old' set but not used [-Wunused-but-set-variable]

It is not used since introduction in
commit 96fc6efb9ad9 ("mac80211: IEEE 802.11 Extended Key ID support")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/mac80211/key.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/mac80211/key.c b/net/mac80211/key.c
index 20bf9db7a388..89f09a09efdb 100644
--- a/net/mac80211/key.c
+++ b/net/mac80211/key.c
@@ -268,11 +268,9 @@ int ieee80211_set_tx_key(struct ieee80211_key *key)
 {
 	struct sta_info *sta = key->sta;
 	struct ieee80211_local *local = key->local;
-	struct ieee80211_key *old;
 
 	assert_key_lock(local);
 
-	old = key_mtx_dereference(local, sta->ptk[sta->ptk_idx]);
 	sta->ptk_idx = key->conf.keyidx;
 	ieee80211_check_fast_xmit(sta);
