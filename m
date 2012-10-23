From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 23 Oct 2012 19:57:06 +0000
Subject: [PATCH 03/23] usbvision: Replace memcpy with struct assignment
Message-Id: <1351022246-8201-3-git-send-email-elezegarcia@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Julia.Lawall@lip6.fr, kernel-janitors@vger.kernel.org, Ezequiel Garcia <elezegarcia@gmail.com>, Peter Senna Tschudin <peter.senna@gmail.com>

This kind of memcpy() is error-prone. Its replacement with a struct
assignment is prefered because it's type-safe and much easier to read.

Found by coccinelle. Hand patched and reviewed.
Tested by compilation only.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier struct_name;
struct struct_name to;
struct struct_name from;
expression E;
@@
-memcpy(&(to), &(from), E);
+to = from;
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/media/usb/usbvision/usbvision-i2c.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/usbvision/usbvision-i2c.c b/drivers/media/usb/usbvision/usbvision-i2c.c
index 89fec02..ba262a3 100644
--- a/drivers/media/usb/usbvision/usbvision-i2c.c
+++ b/drivers/media/usb/usbvision/usbvision-i2c.c
@@ -189,8 +189,7 @@ int usbvision_i2c_register(struct usb_usbvision *usbvision)
 	if (usbvision->registered_i2c)
 		return 0;
 
-	memcpy(&usbvision->i2c_adap, &i2c_adap_template,
-	       sizeof(struct i2c_adapter));
+	usbvision->i2c_adap = i2c_adap_template;
 
 	sprintf(usbvision->i2c_adap.name, "%s-%d-%s", i2c_adap_template.name,
 		usbvision->dev->bus->busnum, usbvision->dev->devpath);
-- 
1.7.4.4

