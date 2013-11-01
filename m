From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Nov 2013 10:34:40 +0000
Subject: [patch -next] [media] cx231xx: use after free on error path in probe
Message-Id: <20131101103440.GP29795@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Alexey Khoroshilov <khoroshilov@ispras.ru>, Alf =?iso-8859-1?Q?H=F8gemark?= <alf@i100.no>, Peter Senna Tschudin <peter.senna@gmail.com>, Johannes Erdfelt <johannes@erdfelt.com>, Ezequiel Garcia <elezegarcia@gmail.com>, Matt Gomboc <gomboc0@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We dereference "dev" after it has already been freed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index e9d017b..528cce9 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1412,8 +1412,8 @@ err_v4l2:
 	usb_set_intfdata(interface, NULL);
 err_if:
 	usb_put_dev(udev);
-	kfree(dev);
 	clear_bit(dev->devno, &cx231xx_devused);
+	kfree(dev);
 	return retval;
 }
 
