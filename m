From: Colin King <colin.king@canonical.com>
Date: Tue, 02 Jul 2019 14:40:26 +0000
Subject: [PATCH][next] wil6210: fix wil_cid_valid with negative cid values
Message-Id: <20190702144026.13013-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maya Erez <merez@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several occasions where a negative cid value is passed
into wil_cid_valid and this is converted into a u8 causing the
range check of cid >= 0 to always succeed.  Fix this by making
the cid argument an int to handle any -ve error value of cid.

An example of this behaviour is in wil_cfg80211_dump_station,
where cid is assigned -ENOENT if the call to wil_find_cid_by_idx
fails, and this -ve value is passed to wil_cid_valid.  I believe
that the conversion of -ENOENT to the u8 value 254 which is
greater than wil->max_assoc_sta causes wil_find_cid_by_idx to
currently work fine, but I think is by luck and not the
intended behaviour.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/wil6210/wil6210.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wil6210/wil6210.h b/drivers/net/wireless/ath/wil6210/wil6210.h
index 6f456b311a39..25a1adcb38eb 100644
--- a/drivers/net/wireless/ath/wil6210/wil6210.h
+++ b/drivers/net/wireless/ath/wil6210/wil6210.h
@@ -1144,7 +1144,7 @@ static inline void wil_c(struct wil6210_priv *wil, u32 reg, u32 val)
 /**
  * wil_cid_valid - check cid is valid
  */
-static inline bool wil_cid_valid(struct wil6210_priv *wil, u8 cid)
+static inline bool wil_cid_valid(struct wil6210_priv *wil, int cid)
 {
 	return (cid >= 0 && cid < wil->max_assoc_sta);
 }
-- 
2.20.1
