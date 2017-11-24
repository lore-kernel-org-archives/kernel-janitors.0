From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Nov 2017 13:31:54 +0000
Subject: [PATCH] USB: atm: use setup_timer instead of init_timer
Message-Id: <20171124133154.32117-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duncan Sands <duncan.sands@free.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use setup_timer function instead of initializing timer with the
function and data fields.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/atm/usbatm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index 044264aa1f96..ef456cd0d3ab 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -998,9 +998,8 @@ static void usbatm_init_channel(struct usbatm_channel *channel)
 {
 	spin_lock_init(&channel->lock);
 	INIT_LIST_HEAD(&channel->list);
-	channel->delay.function = usbatm_tasklet_schedule;
-	channel->delay.data = (unsigned long) &channel->tasklet;
-	init_timer(&channel->delay);
+	setup_timer(&channel->delay, usbatm_tasklet_schedule,
+		    (unsigned long)&channel->tasklet);
 }
 
 int usbatm_usb_probe(struct usb_interface *intf, const struct usb_device_id *id,
-- 
2.14.1

