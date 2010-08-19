From: Dan Carpenter <error27@gmail.com>
Date: Thu, 19 Aug 2010 09:47:50 +0000
Subject: [patch] V4L/DVB: opera1: remove unneeded NULL check
Message-Id: <20100819094750.GM645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

"fw" is always a non-NULL pointer at this point, and anyway
release_firmware() accepts NULL pointers.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/dvb/dvb-usb/opera1.c b/drivers/media/dvb/dvb-usb/opera1.c
index 6b22ec6..f896337 100644
--- a/drivers/media/dvb/dvb-usb/opera1.c
+++ b/drivers/media/dvb/dvb-usb/opera1.c
@@ -483,9 +483,7 @@ static int opera1_xilinx_load_firmware(struct usb_device *dev,
 		}
 	}
 	kfree(p);
-	if (fw) {
-		release_firmware(fw);
-	}
+	release_firmware(fw);
 	return ret;
 }
 
