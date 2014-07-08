From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Tue, 08 Jul 2014 13:54:59 +0000
Subject: [PATCH] staging: rtl8192ee: Correct bitmask in comparsion
Message-Id: <1404827699-7295-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1404517213-4067-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1404517213-4067-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
Cc: gregkh@linuxfoundation.org, gulsah.1004@gmail.com, Larry.Finger@lwfinger.net, paulmck@linux.vnet.ibm.com, linville@tuxdriver.com, dan.carpenter@oracle.com, Andrey Utkin <andrey.krieger.utkin@gmail.com>

The issue is discovered by static checker. The proposed change (0x000c0
-> 0x000c) is likely correct because:
1. 16-bit `map` holds value coming from struct
ieee80211_vht_mcs_info.tx_mcs_map, which is described so: "TX MCS map 2
bits for each stream, total 8 streams". The changed code refers to case
of 2 TX streams, and 0x000c mask filters two bits related to the second
stream. Some codelines below 0x0003 mask is used to test first stream.
2. Mask 0x000c is used 3 more times in that place.
3. Specifying 5 digits of hex value is uncommon, especially while working
with `u16` variable. So likely the trailing zero is a typo.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?idx041
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

