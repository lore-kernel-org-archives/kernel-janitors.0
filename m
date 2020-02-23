From: Colin King <colin.king@canonical.com>
Date: Sun, 23 Feb 2020 15:14:38 +0000
Subject: [PATCH] staging: rtl8723bs: remove temporary variable CrystalCap
Message-Id: <20200223151438.415542-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently variable CrystalCap is being initialized with the value
0x20 that is never read so that is redundant and can be removed.
Clean up the code by removing the need for variable CrystalCap
since the calculation of the return value is relatively simple.

Addresses-Coverity: ("Unused Value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 95edd148ac24..34d83b238265 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -40,16 +40,11 @@ static void odm_SetCrystalCap(void *pDM_VOID, u8 CrystalCap)
 static u8 odm_GetDefaultCrytaltalCap(void *pDM_VOID)
 {
 	PDM_ODM_T pDM_Odm = (PDM_ODM_T)pDM_VOID;
-	u8 CrystalCap = 0x20;
 
 	struct adapter *Adapter = pDM_Odm->Adapter;
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
-	CrystalCap = pHalData->CrystalCap;
-
-	CrystalCap = CrystalCap & 0x3f;
-
-	return CrystalCap;
+	return pHalData->CrystalCap & 0x3f;
 }
 
 static void odm_SetATCStatus(void *pDM_VOID, bool ATCStatus)
-- 
2.25.0
