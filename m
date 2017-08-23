From: Colin King <colin.king@canonical.com>
Date: Wed, 23 Aug 2017 14:34:33 +0000
Subject: [PATCH][next] staging: r8822be: fix memory leak of eeprom_map on error exit return
Message-Id: <20170823143433.21811-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Ping-Ke Shih <pkshih@realtek.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A memory leak of eeprom_map occurs if the call to halmac_eeprom_parser_88xx
fails. Fix this by kfree'ing it before returning.

Detected by CoverityScan, CID#1454569 ("Resource leak")
Fixes: 938a0447f094 ("staging: r8822be: Add code for halmac sub-driver")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtlwifi/halmac/halmac_88xx/halmac_api_88xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtlwifi/halmac/halmac_88xx/halmac_api_88xx.c b/drivers/staging/rtlwifi/halmac/halmac_88xx/halmac_api_88xx.c
index fadb35f3ba88..a6c8a87f755f 100644
--- a/drivers/staging/rtlwifi/halmac/halmac_88xx/halmac_api_88xx.c
+++ b/drivers/staging/rtlwifi/halmac/halmac_88xx/halmac_api_88xx.c
@@ -1950,8 +1950,10 @@ halmac_dump_logical_efuse_map_88xx(struct halmac_adapter *halmac_adapter,
 
 		if (halmac_eeprom_parser_88xx(halmac_adapter,
 					      halmac_adapter->hal_efuse_map,
-					      eeprom_map) != HALMAC_RET_SUCCESS)
+					      eeprom_map) != HALMAC_RET_SUCCESS) {
+			kfree(eeprom_map);
 			return HALMAC_RET_EEPROM_PARSING_FAIL;
+		}
 
 		PLATFORM_EVENT_INDICATION(
 			driver_adapter, HALMAC_FEATURE_DUMP_LOGICAL_EFUSE,
-- 
2.14.1

