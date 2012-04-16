From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 16 Apr 2012 20:44:52 +0000
Subject: [PATCH] drivers/input/tablet/aiptek.c: adjust error-handling code label
Message-Id: <1334609092-15338-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

At the point of this error-handling code, aiptek->urb has been allocated,
and it does not appear to be less necessary to free it here than in the
error-handling code just below.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/input/tablet/aiptek.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index 205d16a..a33d347 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -1856,7 +1856,7 @@ aiptek_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	if (i = ARRAY_SIZE(speeds)) {
 		dev_info(&intf->dev,
 			 "Aiptek tried all speeds, no sane response\n");
-		goto fail2;
+		goto fail3;
 	}
 
 	/* Associate this driver's struct with the usb interface.

