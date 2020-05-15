From: Walter Harms <wharms@bfs.de>
Date: Fri, 15 May 2020 12:38:07 +0000
Subject: AW: [PATCH] rtlwifi: rtl8192ee: remove redundant for-loop
Message-Id: <73b8d798ffa048418be8443f90a79377@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200515102226.29819-1-colin.king@canonical.com>
In-Reply-To: <20200515102226.29819-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

if someone has same spare time,
this driver need a bit more love ...

SO far i can see in rtl92ee_phy_iq_calibrate:
* IQK_MATRIX_REG_NUM should be used instead 8 hardcoded.
* the for-loop in the beginning is obfuscating that it sets  simply final_candidate

this can be cleaned:
      reg_e94 = result[final_candidate][0];
      rtlphy->reg_e94 = reg_e94;
      reg_e9c = result[final_candidate][1];
      rtlphy->reg_e9c = reg_e9c;

only reg_e94, reg_ea4 is used later ?

jm2c,
wh 

________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kernel.org> im Auftrag von Colin King <colin.king@canonical.com>
Gesendet: Freitag, 15. Mai 2020 12:22
An: Kalle Valo; David S . Miller; linux-wireless@vger.kernel.org; netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Betreff: [PATCH] rtlwifi: rtl8192ee: remove redundant for-loop

From: Colin Ian King <colin.king@canonical.com>

The for-loop seems to be redundant, the assignments for indexes
0..2 are being over-written by the last index 3 in the loop. Remove
the loop and use index 3 instead.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../net/wireless/realtek/rtlwifi/rtl8192ee/phy.c   | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/phy.c
index 6dba576aa81e..bb291b951f4d 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/phy.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/phy.c
@@ -2866,14 +2866,12 @@ void rtl92ee_phy_iq_calibrate(struct ieee80211_hw *hw, bool b_recovery)
                }
        }

-       for (i = 0; i < 4; i++) {
-               reg_e94 = result[i][0];
-               reg_e9c = result[i][1];
-               reg_ea4 = result[i][2];
-               reg_eb4 = result[i][4];
-               reg_ebc = result[i][5];
-               reg_ec4 = result[i][6];
-       }
+       reg_e94 = result[3][0];
+       reg_e9c = result[3][1];
+       reg_ea4 = result[3][2];
+       reg_eb4 = result[3][4];
+       reg_ebc = result[3][5];
+       reg_ec4 = result[3][6];

        if (final_candidate != 0xff) {
                reg_e94 = result[final_candidate][0];
--
2.25.1
