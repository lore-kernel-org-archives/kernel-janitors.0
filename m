From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Apr 2016 10:03:30 +0000
Subject: [patch] [media] cx231xx: silence uninitialized variable warning
Message-Id: <20160422100330.GF11398@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Terry Heo <terryheo@google.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We print an uninitialized "actlen" variable on the error path.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/cx231xx/cx231xx-core.c b/drivers/media/usb/cx231xx/cx231xx-core.c
index f497888..6741fd0 100644
--- a/drivers/media/usb/cx231xx/cx231xx-core.c
+++ b/drivers/media/usb/cx231xx/cx231xx-core.c
@@ -752,7 +752,8 @@ EXPORT_SYMBOL_GPL(cx231xx_set_mode);
 int cx231xx_ep5_bulkout(struct cx231xx *dev, u8 *firmware, u16 size)
 {
 	int errCode = 0;
-	int actlen, ret = -ENOMEM;
+	int actlen = -1;
+	int ret = -ENOMEM;
 	u32 *buffer;
 
 	buffer = kzalloc(4096, GFP_KERNEL);
