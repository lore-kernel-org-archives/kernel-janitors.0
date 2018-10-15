From: Colin King <colin.king@canonical.com>
Date: Mon, 15 Oct 2018 22:34:33 +0000
Subject: [PATCH] drivers: staging: rtl*: fix spelling mistake "Orginial" -> "Original"
Message-Id: <20181015223433.27972-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to common spelling mistakes in some rtl* drivers

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/hal/odm.c                  | 8 ++++----
 drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c   | 8 ++++----
 drivers/staging/rtlwifi/phydm/phydm_edcaturbocheck.c | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/odm.c b/drivers/staging/rtl8188eu/hal/odm.c
index 5a0c38ecb15e..9c8fa61c92ac 100644
--- a/drivers/staging/rtl8188eu/hal/odm.c
+++ b/drivers/staging/rtl8188eu/hal/odm.c
@@ -1025,10 +1025,10 @@ void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm)
 	pDM_Odm->DM_EDCA_Table.bIsCurRDLState = false;
 	Adapter->recvpriv.bIsAnyNonBEPkts = false;
 
-	ODM_RT_TRACE(pDM_Odm, ODM_COMP_EDCA_TURBO, ODM_DBG_LOUD, ("Orginial VO PARAM: 0x%x\n", usb_read32(Adapter, ODM_EDCA_VO_PARAM)));
-	ODM_RT_TRACE(pDM_Odm, ODM_COMP_EDCA_TURBO, ODM_DBG_LOUD, ("Orginial VI PARAM: 0x%x\n", usb_read32(Adapter, ODM_EDCA_VI_PARAM)));
-	ODM_RT_TRACE(pDM_Odm, ODM_COMP_EDCA_TURBO, ODM_DBG_LOUD, ("Orginial BE PARAM: 0x%x\n", usb_read32(Adapter, ODM_EDCA_BE_PARAM)));
-	ODM_RT_TRACE(pDM_Odm, ODM_COMP_EDCA_TURBO, ODM_DBG_LOUD, ("Orginial BK PARAM: 0x%x\n", usb_read32(Adapter, ODM_EDCA_BK_PARAM)));
+	ODM_RT_TRACE(pDM_Odm, ODM_COMP_EDCA_TURBO, ODM_DBG_LOUD, ("Original VO PARAM: 0x%x\n", usb_read32(Adapter, ODM_EDCA_VO_PARAM)));
+	ODM_RT_TRACE(pDM_Odm, ODM_COMP_EDCA_TURBO, ODM_DBG_LOUD, ("Original VI PARAM: 0x%x\n", usb_read32(Adapter, ODM_EDCA_VI_PARAM)));
+	ODM_RT_TRACE(pDM_Odm, ODM_COMP_EDCA_TURBO, ODM_DBG_LOUD, ("Original BE PARAM: 0x%x\n", usb_read32(Adapter, ODM_EDCA_BE_PARAM)));
+	ODM_RT_TRACE(pDM_Odm, ODM_COMP_EDCA_TURBO, ODM_DBG_LOUD, ("Original BK PARAM: 0x%x\n", usb_read32(Adapter, ODM_EDCA_BK_PARAM)));
 }	/*  ODM_InitEdcaTurbo */
 
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm)
diff --git a/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c b/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
index 0e674f39ef03..b7ebce7a6ff9 100644
--- a/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
+++ b/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
@@ -39,16 +39,16 @@ void ODM_EdcaTurboInit(void *pDM_VOID)
 	Adapter->recvpriv.bIsAnyNonBEPkts = false;
 
 	ODM_RT_TRACE(pDM_Odm, ODM_COMP_EDCA_TURBO, ODM_DBG_LOUD,
-		     ("Orginial VO PARAM: 0x%x\n",
+		     ("Original VO PARAM: 0x%x\n",
 		      rtw_read32(pDM_Odm->Adapter, ODM_EDCA_VO_PARAM)));
 	ODM_RT_TRACE(pDM_Odm, ODM_COMP_EDCA_TURBO, ODM_DBG_LOUD,
-		     ("Orginial VI PARAM: 0x%x\n",
+		     ("Original VI PARAM: 0x%x\n",
 		      rtw_read32(pDM_Odm->Adapter, ODM_EDCA_VI_PARAM)));
 	ODM_RT_TRACE(pDM_Odm, ODM_COMP_EDCA_TURBO, ODM_DBG_LOUD,
-		     ("Orginial BE PARAM: 0x%x\n",
+		     ("Original BE PARAM: 0x%x\n",
 		      rtw_read32(pDM_Odm->Adapter, ODM_EDCA_BE_PARAM)));
 	ODM_RT_TRACE(pDM_Odm, ODM_COMP_EDCA_TURBO, ODM_DBG_LOUD,
-		     ("Orginial BK PARAM: 0x%x\n",
+		     ("Original BK PARAM: 0x%x\n",
 		      rtw_read32(pDM_Odm->Adapter, ODM_EDCA_BK_PARAM)));
 }	/*  ODM_InitEdcaTurbo */
 
diff --git a/drivers/staging/rtlwifi/phydm/phydm_edcaturbocheck.c b/drivers/staging/rtlwifi/phydm/phydm_edcaturbocheck.c
index cd12512628c0..b5bd4fb20c90 100644
--- a/drivers/staging/rtlwifi/phydm/phydm_edcaturbocheck.c
+++ b/drivers/staging/rtlwifi/phydm/phydm_edcaturbocheck.c
@@ -25,13 +25,13 @@ void odm_edca_turbo_init(void *dm_void)
 	dm->dm_edca_table.is_current_turbo_edca = false;
 	dm->dm_edca_table.is_cur_rdl_state = false;
 
-	ODM_RT_TRACE(dm, ODM_COMP_EDCA_TURBO, "Orginial VO PARAM: 0x%x\n",
+	ODM_RT_TRACE(dm, ODM_COMP_EDCA_TURBO, "Original VO PARAM: 0x%x\n",
 		     odm_read_4byte(dm, ODM_EDCA_VO_PARAM));
-	ODM_RT_TRACE(dm, ODM_COMP_EDCA_TURBO, "Orginial VI PARAM: 0x%x\n",
+	ODM_RT_TRACE(dm, ODM_COMP_EDCA_TURBO, "Original VI PARAM: 0x%x\n",
 		     odm_read_4byte(dm, ODM_EDCA_VI_PARAM));
-	ODM_RT_TRACE(dm, ODM_COMP_EDCA_TURBO, "Orginial BE PARAM: 0x%x\n",
+	ODM_RT_TRACE(dm, ODM_COMP_EDCA_TURBO, "Original BE PARAM: 0x%x\n",
 		     odm_read_4byte(dm, ODM_EDCA_BE_PARAM));
-	ODM_RT_TRACE(dm, ODM_COMP_EDCA_TURBO, "Orginial BK PARAM: 0x%x\n",
+	ODM_RT_TRACE(dm, ODM_COMP_EDCA_TURBO, "Original BK PARAM: 0x%x\n",
 		     odm_read_4byte(dm, ODM_EDCA_BK_PARAM));
 
 } /* ODM_InitEdcaTurbo */
-- 
2.19.1
