From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Sep 2014 11:39:41 +0000
Subject: [patch] [media] em28xx-input: NULL dereference on error
Message-Id: <20140925113941.GB3708@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>, Frank Schaefer <fschaefer.oss@googlemail.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We call "kfree(ir->i2c_client);" in the error handling and that doesn't
work if "ir" is NULL.

Fixes: 78e719a5f30b ('[media] em28xx-input: i2c IR decoders: improve i2c_client handling')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
index 581f6da..23f8f6a 100644
--- a/drivers/media/usb/em28xx/em28xx-input.c
+++ b/drivers/media/usb/em28xx/em28xx-input.c
@@ -712,8 +712,10 @@ static int em28xx_ir_init(struct em28xx *dev)
 	em28xx_info("Registering input extension\n");
 
 	ir = kzalloc(sizeof(*ir), GFP_KERNEL);
+	if (!ir)
+		return -ENOMEM;
 	rc = rc_allocate_device();
-	if (!ir || !rc)
+	if (!rc)
 		goto error;
 
 	/* record handles to ourself */
