From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 24 Jul 2019 01:54:11 +0000
Subject: [PATCH] carl9170: remove set but not used variable 'udev'
Message-Id: <20190724015411.66525-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Lamparter <chunkeey@googlemail.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/ath/carl9170/usb.c: In function 'carl9170_usb_disconnect':
drivers/net/wireless/ath/carl9170/usb.c:1110:21: warning:
 variable 'udev' set but not used [-Wunused-but-set-variable]

It is not used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/carl9170/usb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/carl9170/usb.c b/drivers/net/wireless/ath/carl9170/usb.c
index 99f1897a775d..486957a04bd1 100644
--- a/drivers/net/wireless/ath/carl9170/usb.c
+++ b/drivers/net/wireless/ath/carl9170/usb.c
@@ -1107,12 +1107,10 @@ static int carl9170_usb_probe(struct usb_interface *intf,
 static void carl9170_usb_disconnect(struct usb_interface *intf)
 {
 	struct ar9170 *ar = usb_get_intfdata(intf);
-	struct usb_device *udev;
 
 	if (WARN_ON(!ar))
 		return;
 
-	udev = ar->udev;
 	wait_for_completion(&ar->fw_load_wait);
 
 	if (IS_INITIALIZED(ar)) {
