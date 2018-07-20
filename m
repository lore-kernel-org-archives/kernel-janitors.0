From: Colin King <colin.king@canonical.com>
Date: Fri, 20 Jul 2018 18:32:29 +0000
Subject: [PATCH] staging: rtl8712: remove redundant pointer 'nic'
Message-Id: <20180720183229.27529-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer 'nic' is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'nic' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8712/rtl8712_led.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_led.c b/drivers/staging/rtl8712/rtl8712_led.c
index e9077347837e..0aa97c9dcced 100644
--- a/drivers/staging/rtl8712/rtl8712_led.c
+++ b/drivers/staging/rtl8712/rtl8712_led.c
@@ -89,9 +89,6 @@ static void BlinkWorkItemCallback(struct work_struct *work);
 static void InitLed871x(struct _adapter *padapter, struct LED_871x *pLed,
 		 enum LED_PIN_871x	LedPin)
 {
-	struct  net_device *nic;
-
-	nic = padapter->pnetdev;
 	pLed->padapter = padapter;
 	pLed->LedPin = LedPin;
 	pLed->CurrLedState = LED_STATE_OFF;
-- 
2.17.1

