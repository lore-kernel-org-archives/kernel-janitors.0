From: Sabin Mihai Rapan <sabin.rapan@gmail.com>
Date: Sat, 02 Jun 2018 09:04:12 +0000
Subject: [PATCH v2 1/3] staging: rtlwifi: Fix "Trafic"->"Traffic"
Message-Id: <20180602090414.5208-1-sabin.rapan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180601060740.GA25648@kroah.com>
In-Reply-To: <20180601060740.GA25648@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Sabin Mihai Rapan <sabin.rapan@gmail.com>

Trivial fix to spelling mistake in comment text.

Signed-off-by: Sabin Mihai Rapan <sabin.rapan@gmail.com>
---
Changes in v2:
 - Added proper to and cc fields to the patch series.

 drivers/staging/rtlwifi/phydm/phydm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtlwifi/phydm/phydm.c b/drivers/staging/rtlwifi/phydm/phydm.c
index 985978d3decc..27635feedba2 100644
--- a/drivers/staging/rtlwifi/phydm/phydm.c
+++ b/drivers/staging/rtlwifi/phydm/phydm.c
@@ -149,7 +149,7 @@ static void phydm_traffic_load_decision(void *dm_void)
 {
 	struct phy_dm_struct *dm = (struct phy_dm_struct *)dm_void;
 
-	/*---TP & Trafic-load calculation---*/
+	/*---TP & Traffic-load calculation---*/
 
 	if (dm->last_tx_ok_cnt > *dm->num_tx_bytes_unicast)
 		dm->last_tx_ok_cnt = *dm->num_tx_bytes_unicast;
-- 
2.17.0

