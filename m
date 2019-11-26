From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 12:09:39 +0000
Subject: [PATCH] mac80211: airtime: Fix an off by one in ieee80211_calc_rx_airtime()
Message-Id: <20191126120910.ftr4t7me3by32aiz@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <87v9r7ysg0.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Johannes Berg <johannes@sipsolutions.net>, Toke H??iland-J??rgensen <toke@redhat.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Kalle Valo <kvalo@codeaurora.org>

This code was copied from mt76 and inherited an off by one bug from
there.  The > should be >= so that we don't read one element beyond
the end of the array.

Fixes: db3e1c40cf2f ("mac80211: Import airtime calculation code from mt76")
Reported-by: Toke Høiland-Jørgensen <toke@redhat.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/mac80211/airtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index 63cb0028b02d..9fc2968856c0 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -442,7 +442,7 @@ u32 ieee80211_calc_rx_airtime(struct ieee80211_hw *hw,
 			return 0;
 
 		sband = hw->wiphy->bands[status->band];
-		if (!sband || status->rate_idx > sband->n_bitrates)
+		if (!sband || status->rate_idx >= sband->n_bitrates)
 			return 0;
 
 		rate = &sband->bitrates[status->rate_idx];
-- 
2.11.0
