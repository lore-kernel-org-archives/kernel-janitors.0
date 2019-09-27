From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Sep 2019 09:20:00 +0000
Subject: [PATCH] usbip: clean up an indentation issue
Message-Id: <20190927092000.19373-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a return statement that is indented incorrectly, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/usbip/stub_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
index 36010a82b359..b1c2f6781cb3 100644
--- a/drivers/usb/usbip/stub_tx.c
+++ b/drivers/usb/usbip/stub_tx.c
@@ -291,7 +291,7 @@ static int stub_send_ret_submit(struct stub_device *sdev)
 				kfree(iov);
 				usbip_event_add(&sdev->ud,
 						SDEV_EVENT_ERROR_TCP);
-			   return -1;
+				return -1;
 			}
 		}
 
-- 
2.20.1
