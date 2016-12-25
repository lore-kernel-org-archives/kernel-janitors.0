From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 18:39:01 +0000
Subject: [PATCH 08/19] [media] uvc_driver: Rename a jump label in uvc_scan_fallback()
Message-Id: <9b6619ba-da8c-71c4-c700-c2cf1c8e4955@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
In-Reply-To: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 10:57:12 +0100

Adjust jump labels according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index f91965d0da97..c4e954aecdd5 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1698,7 +1698,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
 		return -ENOMEM;
 
 	if (uvc_scan_chain_entity(chain, oterm) < 0)
-		goto error;
+		goto free_chain;
 
 	prev = oterm;
 
@@ -1718,14 +1718,14 @@ static int uvc_scan_fallback(struct uvc_device *dev)
 			continue;
 
 		if (uvc_scan_chain_entity(chain, entity) < 0)
-			goto error;
+			goto free_chain;
 
 		prev->baSourceID[0] = entity->id;
 		prev = entity;
 	}
 
 	if (uvc_scan_chain_entity(chain, iterm) < 0)
-		goto error;
+		goto free_chain;
 
 	prev->baSourceID[0] = iterm->id;
 
@@ -1736,8 +1736,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
 		  uvc_print_chain(chain));
 
 	return 0;
-
-error:
+free_chain:
 	kfree(chain);
 	return -EINVAL;
 }
-- 
2.11.0

