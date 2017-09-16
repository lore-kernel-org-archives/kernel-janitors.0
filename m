From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 10:53:38 +0000
Subject: [PATCH 3/3] [media] mr800: Delete an unnecessary variable initialisation in usb_amradio_probe()
Message-Id: <89894f97-d8de-8687-0697-6e7fab1e922c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7efe75db-dbb4-0fe7-509d-908b81072ca1@users.sourceforge.net>
In-Reply-To: <7efe75db-dbb4-0fe7-509d-908b81072ca1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Alexey Klimov <klimov.linux@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 11:39:50 +0200

The variable "retval" will eventually be set to an appropriate value
a bit later. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/radio/radio-mr800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/radio-mr800.c b/drivers/media/radio/radio-mr800.c
index 7c4554ce1cf0..a1f4dc9be284 100644
--- a/drivers/media/radio/radio-mr800.c
+++ b/drivers/media/radio/radio-mr800.c
@@ -511,5 +511,5 @@ static int usb_amradio_probe(struct usb_interface *intf,
 				const struct usb_device_id *id)
 {
 	struct amradio_device *radio;
-	int retval = 0;
+	int retval;
 
-- 
2.14.1

