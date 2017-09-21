From: Colin King <colin.king@canonical.com>
Date: Thu, 21 Sep 2017 22:39:59 +0000
Subject: [PATCH] staging: xgifb: make const array static to shink object code size
Message-Id: <20170921223959.21400-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaud Patard <arnaud.patard@rtp-net.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Walt Feasel <waltfeasel@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate const array LCDARefreshIndex on the stack, instead
make it static.  Makes the object code smaller by 340 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  84949	  12336	      0	  97285	  17c05	drivers/staging/xgifb/vb_setmode.o

After:
   text	   data	    bss	    dec	    hex	filename
  84506	  12432	      0	  96938	  17aaa	drivers/staging/xgifb/vb_setmode.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/xgifb/vb_setmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/xgifb/vb_setmode.c b/drivers/staging/xgifb/vb_setmode.c
index d55ffa61bc40..a6cd0a1e8c05 100644
--- a/drivers/staging/xgifb/vb_setmode.c
+++ b/drivers/staging/xgifb/vb_setmode.c
@@ -5046,7 +5046,7 @@ unsigned short XGI_GetRatePtrCRT2(struct xgi_hw_device_info *pXGIHWDE,
 				  unsigned short ModeIdIndex,
 				  struct vb_device_info *pVBInfo)
 {
-	const u8 LCDARefreshIndex[] = {
+	static const u8 LCDARefreshIndex[] = {
 		0x00, 0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x00 };
 
 	unsigned short RefreshRateTableIndex, i, index, temp;
-- 
2.14.1

