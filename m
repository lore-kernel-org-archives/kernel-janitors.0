From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 20:42:49 +0000
Subject: [PATCH 2/2] [media] ma901: Improve a size determination in usb_ma901radio_probe()
Message-Id: <a684cb0b-b478-b64e-e1d8-fe18a45d9885@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6d4d9e92-9ac5-1e46-99ed-2b7d93bd7121@users.sourceforge.net>
In-Reply-To: <6d4d9e92-9ac5-1e46-99ed-2b7d93bd7121@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Alexey Klimov <klimov.linux@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 22:23:42 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/radio/radio-ma901.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-ma901.c b/drivers/media/radio/radio-ma901.c
index c386fbd63703..61d1657f1ee7 100644
--- a/drivers/media/radio/radio-ma901.c
+++ b/drivers/media/radio/radio-ma901.c
@@ -357,5 +357,5 @@ static int usb_ma901radio_probe(struct usb_interface *intf,
 		|| strncmp(dev->manufacturer, "www.masterkit.ru", 16) != 0))
 		return -ENODEV;
 
-	radio = kzalloc(sizeof(struct ma901radio_device), GFP_KERNEL);
+	radio = kzalloc(sizeof(*radio), GFP_KERNEL);
 	if (!radio) {
-- 
2.14.1

