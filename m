From: Dan Carpenter <error27@gmail.com>
Date: Tue, 04 Jan 2011 06:02:27 +0000
Subject: [patch v2] Staging: xgfib: put parenthesis in the right place
Message-Id: <20110104060227.GA1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In the original code the parenthesis are in the wrong position, so the
conditions are always true.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2:  white space changes.
Compile tested only.

diff --git a/drivers/staging/xgifb/vb_setmode.c b/drivers/staging/xgifb/vb_setmode.c
index 7016fdd..e19b932 100644
--- a/drivers/staging/xgifb/vb_setmode.c
+++ b/drivers/staging/xgifb/vb_setmode.c
@@ -3954,8 +3954,8 @@ void XGI_GetCRT2ResInfo(unsigned short ModeNo, unsigned short ModeIdIndex,
 unsigned char XGI_IsLCDDualLink(struct vb_device_info *pVBInfo)
 {
 
-	if ((((pVBInfo->VBInfo & SetCRT2ToLCD) | SetCRT2ToLCDA))
-			&& (pVBInfo->LCDInfo & SetLCDDualLink)) /* shampoo0129 */
+	if ((pVBInfo->VBInfo & (SetCRT2ToLCD | SetCRT2ToLCDA)) &&
+			(pVBInfo->LCDInfo & SetLCDDualLink)) /* shampoo0129 */
 		return 1;
 
 	return 0;
@@ -8773,7 +8773,7 @@ unsigned short XGI_GetVCLK2Ptr(unsigned short ModeNo,
 
 	if (pVBInfo->IF_DEF_LVDS = 0) {
 		CRT2Index = CRT2Index >> 6; /*  for LCD */
-		if (((pVBInfo->VBInfo & SetCRT2ToLCD) | SetCRT2ToLCDA)) { /*301b*/
+		if (pVBInfo->VBInfo & (SetCRT2ToLCD | SetCRT2ToLCDA)) { /*301b*/
 			if (pVBInfo->LCDResInfo != Panel1024x768)
 				VCLKIndex = LCDXlat2VCLK[CRT2Index];
 			else
