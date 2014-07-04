From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Fri, 04 Jul 2014 23:40:13 +0000
Subject: [PATCH] staging: rtl8192ee: Correct bitmask in comparsion
Message-Id: <1404517213-4067-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Larry.Finger@lwfinger.net, linux-kernel@vger.kernel.org, drivers_staging@kernel-bugs.osdl.org
Cc: Andrey Utkin <andrey.krieger.utkin@gmail.com>

See https://bugzilla.kernel.org/show_bug.cgi?idx041
---8<---
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/staging/rtl8192ee/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192ee/base.c b/drivers/staging/rtl8192ee/base.c
index a7c69f7..71ed12e 100644
--- a/drivers/staging/rtl8192ee/base.c
+++ b/drivers/staging/rtl8192ee/base.c
@@ -827,7 +827,7 @@ static u8 _rtl_get_vht_highest_n_rate(struct ieee80211_hw *hw,
 	u16 map = le16_to_cpu(sta->vht_cap.vht_mcs.tx_mcs_map);
 
 	if ((get_rf_type(rtlphy) = RF_2T2R) &&
-	    (map & 0x000c) != 0x000c0) {
+	    (map & 0x000c) != 0x000c) {
 		if ((map & 0x000c) >> 2 = IEEE80211_VHT_MCS_SUPPORT_0_7)
 			hw_rate  			rtlpriv->cfg->maps[RTL_RC_VHT_RATE_2SS_MCS7];
-- 
1.8.3.2

