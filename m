From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Oct 2018 15:02:36 +0000
Subject: [PATCH] staging: rtl8188eu: fix spelling mistake "Abnornally" -> "Abnormally"
Message-Id: <20181012150236.21201-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180926133405.31199-1-colin.king@canonical.com>
In-Reply-To: <20180926133405.31199-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in ODM_RT_TRACE trace message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/hal/odm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/hal/odm.c b/drivers/staging/rtl8188eu/hal/odm.c
index 5a0c38ecb15e..4ab490c1c13b 100644
--- a/drivers/staging/rtl8188eu/hal/odm.c
+++ b/drivers/staging/rtl8188eu/hal/odm.c
@@ -418,7 +418,7 @@ void odm_DIG(struct odm_dm_struct *pDM_Odm)
 
 	/* 1 Modify DIG lower bound, deal with abnormally large false alarm */
 	if (pFalseAlmCnt->Cnt_all > 10000) {
-		ODM_RT_TRACE(pDM_Odm, ODM_COMP_DIG, ODM_DBG_LOUD, ("dm_DIG(): Abnornally false alarm case.\n"));
+		ODM_RT_TRACE(pDM_Odm, ODM_COMP_DIG, ODM_DBG_LOUD, ("dm_DIG(): Abnormally false alarm case.\n"));
 
 		if (pDM_DigTable->LargeFAHit != 3)
 			pDM_DigTable->LargeFAHit++;
-- 
2.17.1
