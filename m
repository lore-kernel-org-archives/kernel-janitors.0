From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Feb 2016 19:32:38 +0000
Subject: [patch 4/6] staging: gdm72xx: zero out padding
Message-Id: <20160222193238.GD23565@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Alison Schofield <amsfield22@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We pad the start of this buffer with 256 bytes of padding.   It's not
clear to me exactly what's going on or how it's used but let's zero it
out.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gdm72xx/usb_boot.c b/drivers/staging/gdm72xx/usb_boot.c
index 3082987..4431a80 100644
--- a/drivers/staging/gdm72xx/usb_boot.c
+++ b/drivers/staging/gdm72xx/usb_boot.c
@@ -286,7 +286,7 @@ static int em_download_image(struct usb_device *usbdev, const char *img_name,
 		return ret;
 	}
 
-	buf = kmalloc(DOWNLOAD_CHUCK + pad_size, GFP_KERNEL);
+	buf = kzalloc(DOWNLOAD_CHUCK + pad_size, GFP_KERNEL);
 	if (!buf) {
 		release_firmware(firm);
 		return -ENOMEM;
