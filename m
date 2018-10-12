From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Oct 2018 15:07:27 +0000
Subject: [PATCH] staging: rtlwifi: phydm: fix spelling mistake "Abnrormal" -> "Abnormal"
Message-Id: <20181012150727.21479-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtlwifi/phydm/phydm_dig.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtlwifi/phydm/phydm_dig.c b/drivers/staging/rtlwifi/phydm/phydm_dig.c
index 3115e7bdc749..f10776fbe2d9 100644
--- a/drivers/staging/rtlwifi/phydm/phydm_dig.c
+++ b/drivers/staging/rtlwifi/phydm/phydm_dig.c
@@ -813,7 +813,7 @@ void odm_DIG(void *dm_void)
 			dig_tab->rx_gain_range_min = 0x1c;
 			ODM_RT_TRACE(
 				dm, ODM_COMP_DIG,
-				"DIG: Abnrormal #beacon (%d) case in STA mode: Force lower bound to 0x%x\n",
+				"DIG: Abnormal #beacon (%d) case in STA mode: Force lower bound to 0x%x\n",
 				dm->phy_dbg_info.num_qry_beacon_pkt,
 				dig_tab->rx_gain_range_min);
 		}
@@ -824,7 +824,7 @@ void odm_DIG(void *dm_void)
 		dig_tab->rx_gain_range_min = dig_tab->rx_gain_range_max;
 		ODM_RT_TRACE(
 			dm, ODM_COMP_DIG,
-			"DIG: Abnrormal lower bound case: Force lower bound to 0x%x\n",
+			"DIG: Abnormal lower bound case: Force lower bound to 0x%x\n",
 			dig_tab->rx_gain_range_min);
 	}
 
-- 
2.17.1
