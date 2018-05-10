From: Colin King <colin.king@canonical.com>
Date: Thu, 10 May 2018 15:07:41 +0000
Subject: [PATCH] staging: rtlwifi: fix spelling mistake: "traking" -> "tracking"
Message-Id: <20180510150741.20677-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in ODM_RT_TRACE message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtlwifi/phydm/phydm_rainfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtlwifi/phydm/phydm_rainfo.c b/drivers/staging/rtlwifi/phydm/phydm_rainfo.c
index 8d0802669928..a89bc59cf63b 100644
--- a/drivers/staging/rtlwifi/phydm/phydm_rainfo.c
+++ b/drivers/staging/rtlwifi/phydm/phydm_rainfo.c
@@ -985,7 +985,7 @@ static void phydm_ra_common_info_update(void *dm_void)
 		}
 		ODM_RT_TRACE(
 			dm, ODM_COMP_RATE_ADAPTIVE,
-			"MACID[%d], Highest Tx order Update for power traking: %d\n",
+			"MACID[%d], Highest Tx order Update for power tracking: %d\n",
 			(ra_tab->highest_client_tx_rate_order),
 			(ra_tab->highest_client_tx_order));
 	}
-- 
2.17.0

