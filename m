From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 10:52:30 +0000
Subject: [PATCH 2/3] [media] mr800: Improve a size determination in usb_amradio_probe()
Message-Id: <bb6b93dd-f25b-ff5d-e56c-9aa1abfc635e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7efe75db-dbb4-0fe7-509d-908b81072ca1@users.sourceforge.net>
In-Reply-To: <7efe75db-dbb4-0fe7-509d-908b81072ca1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Alexey Klimov <klimov.linux@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 11:34:11 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/radio/radio-mr800.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/radio/radio-mr800.c b/drivers/media/radio/radio-mr800.c
index 63a9b92ab495..7c4554ce1cf0 100644
--- a/drivers/media/radio/radio-mr800.c
+++ b/drivers/media/radio/radio-mr800.c
@@ -515,4 +515,3 @@ static int usb_amradio_probe(struct usb_interface *intf,
 
-	radio = kzalloc(sizeof(struct amradio_device), GFP_KERNEL);
-
+	radio = kzalloc(sizeof(*radio), GFP_KERNEL);
 	if (!radio) {
-- 
2.14.1

