From: Colin King <colin.king@canonical.com>
Date: Sat, 08 Feb 2020 16:31:32 +0000
Subject: [PATCH] usb: gadget: remove redundant assignment to variable status
Message-Id: <20200208163132.29592-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable status is being assigned with a value that is never read, it is
assigned a new value immediately afterwards. The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 6677ae932de0..349deae7cabd 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -752,8 +752,6 @@ f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	audio->out_ep = ep;
 	audio->out_ep->desc = &as_out_ep_desc;
 
-	status = -ENOMEM;
-
 	/* copy descriptors, and track endpoint copies */
 	status = usb_assign_descriptors(f, f_audio_desc, f_audio_desc, NULL,
 					NULL);
-- 
2.25.0
