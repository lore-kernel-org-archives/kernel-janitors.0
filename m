From: Clifton Barnes <clifton.a.barnes@gmail.com>
Date: Sun, 27 Mar 2016 19:13:01 +0000
Subject: [PATCH 3/5] staging: xgifb: fix code indent
Message-Id: <1459105983-17251-3-git-send-email-clifton.a.barnes@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1459105983-17251-1-git-send-email-clifton.a.barnes@gmail.com>
In-Reply-To: <1459105983-17251-1-git-send-email-clifton.a.barnes@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: arnaud.patard@rtp-net.org
Cc: kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Clifton Barnes <clifton.a.barnes@gmail.com>

fix checkpatch.pl warning about 'suspect code indent for conditional
statements'

Signed-off-by: Clifton Barnes <clifton.a.barnes@gmail.com>
---
 drivers/staging/xgifb/vb_setmode.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/xgifb/vb_setmode.c b/drivers/staging/xgifb/vb_setmode.c
index 0f9c300..50c8ea4 100644
--- a/drivers/staging/xgifb/vb_setmode.c
+++ b/drivers/staging/xgifb/vb_setmode.c
@@ -108,9 +108,9 @@ static void XGI_SetATTRegs(unsigned short ModeIdIndex,
 			if (pVBInfo->VBInfo & XGI_SetCRT2ToLCDA) {
 				ARdata = 0;
 			} else if ((pVBInfo->VBInfo &
-				     (SetCRT2ToTV | SetCRT2ToLCD)) &&
-				    (pVBInfo->VBInfo & SetInSlaveMode)) {
-					ARdata = 0;
+				   (SetCRT2ToTV | SetCRT2ToLCD)) &&
+				   (pVBInfo->VBInfo & SetInSlaveMode)) {
+				ARdata = 0;
 			}
 		}
 
@@ -2984,7 +2984,7 @@ static void XGI_SetLockRegs(unsigned short ModeNo, unsigned short ModeIdIndex,
 
 		if ((pVBInfo->VBInfo & SetCRT2ToHiVision) &&
 		    !(pVBInfo->VBType & VB_SIS301LV) && (resinfo = 7))
-				temp -= 2;
+			temp -= 2;
 	}
 
 	/* 0x05 Horizontal Display Start */
-- 
1.9.1

