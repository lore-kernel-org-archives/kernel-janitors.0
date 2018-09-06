From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Sep 2018 12:32:07 +0000
Subject: [PATCH] staging: rtl8723bs: check for i out of range before accessing szLine[i]
Message-Id: <20180906123207.20164-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Quytelda Kahja <quytelda@tamalin.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently szLine[i] is being accessed before the index i is being
ranged checked.  Fix this by checking the range first.  Also, evaluate
the length of the string szLine just once rather than multiple times and
move the loop variable i to an inner scope and make it an int.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 0d2c61b67d0e..0833cce43dd3 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -2919,7 +2919,6 @@ int PHY_ConfigRFWithTxPwrTrackParaFile(struct adapter *Adapter, char *pFileName)
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 	int	rlen = 0, rtStatus = _FAIL;
 	char *szLine, *ptmp;
-	u32 i = 0;
 
 	if (!(Adapter->registrypriv.load_phy_file & LOAD_RF_TXPWR_TRACK_PARA_FILE))
 		return rtStatus;
@@ -2958,8 +2957,10 @@ int PHY_ConfigRFWithTxPwrTrackParaFile(struct adapter *Adapter, char *pFileName)
 				char band[5] = "", path[5] = "", sign[5] = "";
 				char chnl[5] = "", rate[10] = "";
 				char data[300] = ""; /*  100 is too small */
+				const int len = strlen(szLine);
+				int i;
 
-				if (strlen(szLine) < 10 || szLine[0] != '[')
+				if (len < 10 || szLine[0] != '[')
 					continue;
 
 				strncpy(band, szLine+1, 2);
@@ -2973,7 +2974,7 @@ int PHY_ConfigRFWithTxPwrTrackParaFile(struct adapter *Adapter, char *pFileName)
 				if (!ParseQualifiedString(szLine, &i, chnl, '[', ']')) {
 					/* DBG_871X("Fail to parse channel group!\n"); */
 				}
-				while (szLine[i] != '{' && i < strlen(szLine))
+				while (i < len && szLine[i] != '{')
 					i++;
 				if (!ParseQualifiedString(szLine, &i, data, '{', '}')) {
 					/* DBG_871X("Fail to parse data!\n"); */
-- 
2.17.1
