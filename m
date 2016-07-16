From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 16 Jul 2016 07:04:40 +0000
Subject: [PATCH] usb: gadget: uvc: Fix return value in case of error
Message-Id: <1468652680-15781-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: laurent.pinchart@ideasonboard.com, balbi@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If this memory allocation fail, we will return 0, which means success.
Return -ENOMEM instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/function/uvc_configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 66753ba..31125a4 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -2023,7 +2023,7 @@ static int uvcg_streaming_class_allow_link(struct config_item *src,
 	if (!data) {
 		kfree(*class_array);
 		*class_array = NULL;
-		ret = PTR_ERR(data);
+		ret = -ENOMEM;
 		goto unlock;
 	}
 	cl_arr = *class_array;
-- 
2.7.4


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

