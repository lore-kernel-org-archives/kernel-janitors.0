From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 05:10:19 +0000
Subject: [PATCH 2/2] usbnet: Improve a size determination in usbnet_write_cmd_async()
Message-Id: <d5ae61d4-8339-29e4-e91c-90ba644d69aa@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a81c2551-ce6c-967d-1120-4307f95b1e65@users.sourceforge.net>
In-Reply-To: <a81c2551-ce6c-967d-1120-4307f95b1e65@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, netdev@vger.kernel.org, Oliver Neukum <oneukum@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 06:42:33 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/usb/usbnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 802ba68d37d1..b73c2a40501c 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -2129,6 +2129,6 @@ int usbnet_write_cmd_async(struct usbnet *dev, u8 cmd, u8 reqtype,
 	}
 
-	req = kmalloc(sizeof(struct usb_ctrlrequest), GFP_ATOMIC);
+	req = kmalloc(sizeof(*req), GFP_ATOMIC);
 	if (!req)
 		goto fail_free_buf;
 
-- 
2.13.0

