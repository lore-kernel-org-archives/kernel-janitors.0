From: Dan Carpenter <error27@gmail.com>
Date: Fri, 12 Nov 2010 05:11:13 +0000
Subject: [patch] Staging: rtl8712: signedness bug in init
Message-Id: <20101112051113.GF3533@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

PollingCnt is 20 and that means we loop 20 times and then run the
timeout code.  After the end of the loop PollingCnt should be -1 but
because it's an unsigned char, it's actually 255 and the timeout
code never runs.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/rtl8712/usb_halinit.c b/drivers/staging/rtl8712/usb_halinit.c
index f6569dc..0e9483b 100644
--- a/drivers/staging/rtl8712/usb_halinit.c
+++ b/drivers/staging/rtl8712/usb_halinit.c
@@ -37,7 +37,7 @@ u8 r8712_usb_hal_bus_init(struct _adapter *padapter)
 {
 	u8 val8 = 0;
 	u8 ret = _SUCCESS;
-	u8 PollingCnt = 20;
+	int PollingCnt = 20;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 
 	if (pregistrypriv->chip_version = RTL8712_FPGA) {
