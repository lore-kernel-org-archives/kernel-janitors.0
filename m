From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Nov 2017 19:48:36 +0000
Subject: [PATCH] staging: rtl8712: remove redundant zero assignment to val32
Message-Id: <20171107194836.9088-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable val32 is being assigned a zero value that is never read
since val32 is being updated immediately afterwards.  Remove this
redundant assignment, cleans up clang warning:

drivers/staging/rtl8712/hal_init.c:339:2: warning: Value stored
to 'val32' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8712/hal_init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8712/hal_init.c b/drivers/staging/rtl8712/hal_init.c
index de832b0b5eec..2a3f0746ee2c 100644
--- a/drivers/staging/rtl8712/hal_init.c
+++ b/drivers/staging/rtl8712/hal_init.c
@@ -336,7 +336,6 @@ uint rtl8712_hal_init(struct _adapter *padapter)
 		    r8712_read32(padapter, RCR));
 	val32 = r8712_read32(padapter, RCR);
 	r8712_write32(padapter, RCR, (val32 | BIT(25))); /* Append PHY status */
-	val32 = 0;
 	val32 = r8712_read32(padapter, 0x10250040);
 	r8712_write32(padapter,  0x10250040, (val32 & 0x00FFFFFF));
 	/* for usb rx aggregation */
-- 
2.14.1

