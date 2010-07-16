From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 16 Jul 2010 16:14:33 +0000
Subject: [PATCH 07/15] staging: tm6000: check kzalloc() result
Message-Id: <1279296873-25023-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Mauro Carvalho Chehab <mchehab@redhat.com>, Stefan Ringel <stefan.ringel@arcor.de>, Michel Ludwig <michel.ludwig@gmail.com>, "Beholder Intl. Ltd. Dmitry Belimov" <d.belimov@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

If kzalloc() fails exit with -ENOMEM.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/tm6000/tm6000-core.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/tm6000/tm6000-core.c b/drivers/staging/tm6000/tm6000-core.c
index 2c38199..9c2829e 100644
--- a/drivers/staging/tm6000/tm6000-core.c
+++ b/drivers/staging/tm6000/tm6000-core.c
@@ -40,8 +40,11 @@ int tm6000_read_write_usb(struct tm6000_core *dev, u8 req_type, u8 req,
 	static int   ini = 0, last = 0, n = 0;
 	u8	     *data = NULL;
 
-	if (len)
+	if (len) {
 		data = kzalloc(len, GFP_KERNEL);
+		if (data = NULL)
+			return -ENOMEM;
+	}
 
 
 	if (req_type & USB_DIR_IN)
-- 
1.7.0.4

