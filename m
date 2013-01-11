From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Jan 2013 06:48:41 +0000
Subject: [patch] [media] cx231xx: add a missing break statement
Message-Id: <20130111064841.GB13207@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@iki.fi>, Jesper Juhl <jj@chaosbits.net>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains about the fall through here.  From the
context it looks like we should add a break statement.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Untested.

diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 93dfc18..06376d9 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1751,6 +1751,7 @@ static int vidioc_s_register(struct file *file, void *priv,
 							0x02,
 							(u16)reg->reg, 1,
 							value, 1, 2);
+					break;
 			case 0x322:
 					ret  						cx231xx_write_i2c_master(dev,
