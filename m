From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Sep 2018 17:30:31 +0000
Subject: [PATCH] staging: rtl8723bs: fix spelling mistake "unvalid" -> "invalid"
Message-Id: <20180924173031.3669-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170411131708.20268-1-colin.king@canonical.com>
In-Reply-To: <20170411131708.20268-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Quytelda Kahja <quytelda@tamalin.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DBG_871X debug messages.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 0833cce43dd3..12c1cd590056 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -3084,7 +3084,7 @@ static int phy_ParsePowerLimitTableFile(struct adapter *Adapter, char *buffer)
 
 			if (colNum > TXPWR_LMT_MAX_REGULATION_NUM) {
 				DBG_871X(
-					"unvalid col number %d (greater than max %d)\n",
+					"invalid col number %d (greater than max %d)\n",
 					colNum, TXPWR_LMT_MAX_REGULATION_NUM
 				);
 				return _FAIL;
@@ -3102,7 +3102,7 @@ static int phy_ParsePowerLimitTableFile(struct adapter *Adapter, char *buffer)
 				/* DBG_871X("regulation %s!\n", regulation[forCnt]); */
 
 				if (regulation_name_cnt = 0) {
-					DBG_871X("unvalid number of regulation!\n");
+					DBG_871X("invalid number of regulation!\n");
 					return _FAIL;
 				}
 			}
-- 
2.17.1
