From: Sabin Mihai Rapan <sabin.rapan@gmail.com>
Date: Thu, 31 May 2018 11:03:12 +0000
Subject: [PATCH 1/3] staging: rtlwifi: Fix "Trafic"->"Traffic"
Message-Id: <20180531110314.3760-1-sabin.rapan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Sabin Mihai Rapan <sabin.rapan@gmail.com>

Trivial fix to spelling mistake in comment text.

Signed-off-by: Sabin Mihai Rapan <sabin.rapan@gmail.com>
---
 drivers/staging/rtlwifi/phydm/phydm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtlwifi/phydm/phydm.c b/drivers/staging/rtlwifi/phydm/phydm.c
index 8b2a180cc13c..2b61b12e6b21 100644
--- a/drivers/staging/rtlwifi/phydm/phydm.c
+++ b/drivers/staging/rtlwifi/phydm/phydm.c
@@ -160,7 +160,7 @@ static void phydm_traffic_load_decision(void *dm_void)
 {
 	struct phy_dm_struct *dm = (struct phy_dm_struct *)dm_void;
 
-	/*---TP & Trafic-load calculation---*/
+	/*---TP & Traffic-load calculation---*/
 
 	if (dm->last_tx_ok_cnt > *dm->num_tx_bytes_unicast)
 		dm->last_tx_ok_cnt = *dm->num_tx_bytes_unicast;
-- 
2.17.0

