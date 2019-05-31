From: Colin King <colin.king@canonical.com>
Date: Fri, 31 May 2019 13:53:47 +0000
Subject: [PATCH] usb: cdc-wdm: remove redundant assignment to rv
Message-Id: <20190531135347.18026-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rv is assigned with a value that is never read and
it is re-assigned a new value on the next statement. The
assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/class/cdc-wdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 9e9caff905d5..a7824a51f86d 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -949,7 +949,7 @@ struct usb_driver *usb_cdc_wdm_register(struct usb_interface *intf,
 					int bufsize,
 					int (*manage_power)(struct usb_interface *, int))
 {
-	int rv = -EINVAL;
+	int rv;
 
 	rv = wdm_create(intf, ep, bufsize, manage_power);
 	if (rv < 0)
-- 
2.20.1
