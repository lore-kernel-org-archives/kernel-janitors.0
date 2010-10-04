From: Dan Carpenter <error27@gmail.com>
Date: Mon, 04 Oct 2010 19:26:41 +0000
Subject: [patch] staging: rtl8192su: initializing past the end of array
Message-Id: <20101004192641.GF5692@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We go past the end of the array when we initialize this array.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/rtl8192su/r8192S_rtl6052.c b/drivers/staging/rtl8192su/r8192S_rtl6052.c
index 2239809..f8a9536 100644
--- a/drivers/staging/rtl8192su/r8192S_rtl6052.c
+++ b/drivers/staging/rtl8192su/r8192S_rtl6052.c
@@ -827,7 +827,7 @@ extern void PHY_RFShadowRefresh(struct net_device  * dev)
 
 	for (eRFPath = 0; eRFPath < RF6052_MAX_PATH; eRFPath++)
 	{
-		for (Offset = 0; Offset <= RF6052_MAX_REG; Offset++)
+		for (Offset = 0; Offset < RF6052_MAX_REG; Offset++)
 		{
 			RF_Shadow[eRFPath][Offset].Value = 0;
 			RF_Shadow[eRFPath][Offset].Compare = false;
