From: Colin King <colin.king@canonical.com>
Date: Tue, 22 May 2018 16:44:24 +0000
Subject: [PATCH] staging: rtlwifi: fix spelling mistake: "Platfoem" -> "Platform"
Message-Id: <20180522164424.8971-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510150741.20677-1-colin.king@canonical.com>
In-Reply-To: <20180510150741.20677-1-colin.king@canonical.com>
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
index a89bc59cf63b..b46791a727c7 100644
--- a/drivers/staging/rtlwifi/phydm/phydm_rainfo.c
+++ b/drivers/staging/rtlwifi/phydm/phydm_rainfo.c
@@ -711,7 +711,7 @@ void phydm_update_hal_ra_mask(void *dm_void, u32 wireless_mode, u8 rf_type,
 	phydm_BW = phydm_trans_platform_bw(dm, BW);
 
 	ODM_RT_TRACE(dm, ODM_COMP_RA_MASK,
-		     "Platfoem original RA Mask = (( 0x %x | %x ))\n",
+		     "Platform original RA Mask = (( 0x %x | %x ))\n",
 		     ratr_bitmap_msb, ratr_bitmap);
 
 	switch (wireless_mode) {
-- 
2.17.0

