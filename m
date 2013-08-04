From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Sun, 04 Aug 2013 18:53:02 +0000
Subject: [PATCH] Staging:xgifb:Fixed a warning of Space before semicolon
Message-Id: <1375641662-17378-1-git-send-email-kumargauravgupta3@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375586968-10733-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1375586968-10733-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: arnaud.patard@rtp-net.org, gregkh@linuxfoundation.org, aaro.koskinen@iki.fi, dan.carpenter@oracle.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Kumar Gaurav <kumargauravgupta3@gmail.com>

Fixed issue by removing Space before semicolon

Signed-off-by: Kumar Gaurav <kumargauravgupta3@gmail.com>
---
 drivers/staging/xgifb/vb_setmode.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/xgifb/vb_setmode.h b/drivers/staging/xgifb/vb_setmode.h
index 2c0a31c..679a822 100644
--- a/drivers/staging/xgifb/vb_setmode.h
+++ b/drivers/staging/xgifb/vb_setmode.h
@@ -13,7 +13,7 @@ extern void XGI_GetVBType(struct vb_device_info *);
 extern void XGI_SenseCRT1(struct vb_device_info *);
 extern unsigned char XGISetModeNew(struct xgifb_video_info *xgifb_info,
 				   struct xgi_hw_device_info *HwDeviceExtension,
-				   unsigned short ModeNo) ;
+				   unsigned short ModeNo);
 
 extern unsigned char XGI_SearchModeID(unsigned short ModeNo,
 				      unsigned short *ModeIdIndex,
-- 
1.7.9.5

