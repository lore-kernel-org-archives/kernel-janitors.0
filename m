From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Feb 2017 13:19:10 +0000
Subject: [PATCH] usb: storage: fix infinite wait loop by incrementing loop counter
Message-Id: <20170202131910.31001-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

If jumpshot_get_status continues to return a failed result then the
wait loop will spin forever because the waitcount counter is never
being incremented and we don't ever timeout.  Fix this by incrementing
waitcount.

Cc: <stable@vger.kernel.org>
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/storage/jumpshot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/storage/jumpshot.c b/drivers/usb/storage/jumpshot.c
index 011e527..81d82ce 100644
--- a/drivers/usb/storage/jumpshot.c
+++ b/drivers/usb/storage/jumpshot.c
@@ -311,6 +311,7 @@ static int jumpshot_write_data(struct us_data *us,
 			if (result != USB_STOR_TRANSPORT_GOOD) {
 				// I have not experimented to find the smallest value.
 				//
+				waitcount++;
 				msleep(50); 
 			}
 		} while ((result != USB_STOR_TRANSPORT_GOOD) && (waitcount < 10));
-- 
2.10.2

