From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Jul 2019 15:03:41 +0000
Subject: [PATCH] usb: chipidea: udc: remove redundant assignment to variable retval
Message-Id: <20190704150341.759-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Chen <Peter.Chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable retval is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.  Also remove a blank
line.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/chipidea/udc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 6a5ee8e6da10..053432d79bf7 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1746,12 +1746,11 @@ static int ci_udc_start(struct usb_gadget *gadget,
 			 struct usb_gadget_driver *driver)
 {
 	struct ci_hdrc *ci = container_of(gadget, struct ci_hdrc, gadget);
-	int retval = -ENOMEM;
+	int retval;
 
 	if (driver->disconnect = NULL)
 		return -EINVAL;
 
-
 	ci->ep0out->ep.desc = &ctrl_endpt_out_desc;
 	retval = usb_ep_enable(&ci->ep0out->ep);
 	if (retval)
-- 
2.20.1
