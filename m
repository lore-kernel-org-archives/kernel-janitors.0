From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Sat, 13 Jun 2015 06:41:18 +0000
Subject: [PATCH 1/2] staging: wilc1000: remove BOOL_T typedef
Message-Id: <1434177679-9831-1-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, Chaehyun Lim <chaehyun.lim@gmail.com>

Remove BOOL_T typedef.

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
 drivers/staging/wilc1000/host_interface.c | 6 +++---
 drivers/staging/wilc1000/itypes.h         | 9 ---------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index 17ab5cd..ca59f1b 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -7698,7 +7698,7 @@ static void *host_int_ParseJoinBssParam(tstrNetworkInfo *ptstrNetworkInfo)
 			/* HT Cap. IE */
 			else if (pu8IEs[index] = HT_CAPABILITY_IE) {
 				/* if IE found set the flag */
-				pNewJoinBssParam->ht_capable = BTRUE;
+				pNewJoinBssParam->ht_capable = true;
 				index += pu8IEs[index + 1] + 2; /* ID,Length bytes and IE body */
 				/* PRINT_D(HOSTINF_DBG,"HT_CAPABALE\n"); */
 				continue;
@@ -7709,11 +7709,11 @@ static void *host_int_ParseJoinBssParam(tstrNetworkInfo *ptstrNetworkInfo)
 				   ((pu8IEs[index + 6] = 0x00) || (pu8IEs[index + 6] = 0x01)) && /* OUI Sub Type */
 				   (pu8IEs[index + 7] = 0x01)) {
 				/* Presence of WMM Info/Param element indicates WMM capability */
-				pNewJoinBssParam->wmm_cap = BTRUE;
+				pNewJoinBssParam->wmm_cap = true;
 
 				/* Check if Bit 7 is set indicating U-APSD capability */
 				if (pu8IEs[index + 8] & (1 << 7)) {
-					pNewJoinBssParam->uapsd_cap = BTRUE;
+					pNewJoinBssParam->uapsd_cap = true;
 				}
 				index += pu8IEs[index + 1] + 2;
 				continue;
diff --git a/drivers/staging/wilc1000/itypes.h b/drivers/staging/wilc1000/itypes.h
index 2441853..d64ae35 100644
--- a/drivers/staging/wilc1000/itypes.h
+++ b/drivers/staging/wilc1000/itypes.h
@@ -36,13 +36,4 @@
 #ifndef ITYPES_H
 #define ITYPES_H
 
-/*****************************************************************************/
-/* Enums                                                                     */
-/*****************************************************************************/
-
-typedef enum {
-	BFALSE = 0,
-	BTRUE  = 1
-} BOOL_T;
-
 #endif /* ITYPES_H */
-- 
1.9.1

