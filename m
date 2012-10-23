From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 23 Oct 2012 19:57:10 +0000
Subject: [PATCH 07/23] hdpvr: Replace memcpy with struct assignment
Message-Id: <1351022246-8201-7-git-send-email-elezegarcia@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Julia.Lawall@lip6.fr, kernel-janitors@vger.kernel.org, Ezequiel Garcia <elezegarcia@gmail.com>, Mike Isely <isely@pobox.com>, Peter Senna Tschudin <peter.senna@gmail.com>

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

Cc: Mike Isely <isely@pobox.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/media/usb/hdpvr/hdpvr-i2c.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-i2c.c b/drivers/media/usb/hdpvr/hdpvr-i2c.c
index 82e819f..2df60bf 100644
--- a/drivers/media/usb/hdpvr/hdpvr-i2c.c
+++ b/drivers/media/usb/hdpvr/hdpvr-i2c.c
@@ -217,8 +217,7 @@ int hdpvr_register_i2c_adapter(struct hdpvr_device *dev)
 
 	hdpvr_activate_ir(dev);
 
-	memcpy(&dev->i2c_adapter, &hdpvr_i2c_adapter_template,
-	       sizeof(struct i2c_adapter));
+	dev->i2c_adapter = hdpvr_i2c_adapter_template;
 	dev->i2c_adapter.dev.parent = &dev->udev->dev;
 
 	i2c_set_adapdata(&dev->i2c_adapter, dev);
-- 
1.7.4.4

