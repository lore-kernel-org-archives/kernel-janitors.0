From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Oct 2018 15:05:32 +0000
Subject: [PATCH] staging: rtl8723bs: fix spelling mistake "Abnrormal" -> "Abnormal"
Message-Id: <20181012150532.21361-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170411131708.20268-1-colin.king@canonical.com>
In-Reply-To: <20170411131708.20268-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/hal/odm_DIG.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index a12fdce77eae..4fa6cd315cf7 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -655,7 +655,7 @@ void odm_DIG(void *pDM_VOID)
 				ODM_COMP_DIG,
 				ODM_DBG_LOUD,
 				(
-					"odm_DIG(): Abnrormal #beacon (%d) case in STA mode: Force lower bound to 0x%x !!!!!!\n\n",
+					"odm_DIG(): Abnormal #beacon (%d) case in STA mode: Force lower bound to 0x%x !!!!!!\n\n",
 					pDM_Odm->PhyDbgInfo.NumQryBeaconPkt,
 					pDM_DigTable->rx_gain_range_min
 				)
@@ -671,7 +671,7 @@ void odm_DIG(void *pDM_VOID)
 			ODM_COMP_DIG,
 			ODM_DBG_LOUD,
 			(
-				"odm_DIG(): Abnrormal lower bound case: Force lower bound to 0x%x !!!!!!\n\n",
+				"odm_DIG(): Abnormal lower bound case: Force lower bound to 0x%x !!!!!!\n\n",
 				pDM_DigTable->rx_gain_range_min
 			)
 		);
-- 
2.17.1
