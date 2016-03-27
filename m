From: Clifton Barnes <clifton.a.barnes@gmail.com>
Date: Sun, 27 Mar 2016 19:13:02 +0000
Subject: [PATCH 4/5] staging: xgifb: fix comparison order
Message-Id: <1459105983-17251-4-git-send-email-clifton.a.barnes@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1459105983-17251-1-git-send-email-clifton.a.barnes@gmail.com>
In-Reply-To: <1459105983-17251-1-git-send-email-clifton.a.barnes@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: arnaud.patard@rtp-net.org
Cc: kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Clifton Barnes <clifton.a.barnes@gmail.com>

fix checkpatch.pl warning about 'Comparisons should place the constant
on the right side of the test'

Signed-off-by: Clifton Barnes <clifton.a.barnes@gmail.com>
---
 drivers/staging/xgifb/vb_setmode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/xgifb/vb_setmode.c b/drivers/staging/xgifb/vb_setmode.c
index 50c8ea4..8bf253c 100644
--- a/drivers/staging/xgifb/vb_setmode.c
+++ b/drivers/staging/xgifb/vb_setmode.c
@@ -1208,7 +1208,7 @@ static void const *XGI_GetLcdPtr(struct XGI330_LCDDataTablStruct const *table,
 		if (pVBInfo->LCDInfo & EnableScalingLCD)
 			tempdx &= (~PanelResInfo);
 
-		if (table[i].PANELID = tempdx) {
+		if (tempdx = table[i].PANELID) {
 			tempbx = table[i].MASK;
 			tempdx = pVBInfo->LCDInfo;
 
@@ -3902,7 +3902,7 @@ static struct XGI301C_Tap4TimingStruct const
 
 	i = 0;
 	while (Tap4TimingPtr[i].DE != 0xFFFF) {
-		if (Tap4TimingPtr[i].DE = tempax)
+		if (tempax = Tap4TimingPtr[i].DE)
 			break;
 		i++;
 	}
-- 
1.9.1

