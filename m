From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jan 2012 06:34:00 +0000
Subject: [patch] [media] cx231xx: dereferencing NULL after allocation failure
Message-Id: <20120113063400.GC23737@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Devin Heitmueller <dheitmueller@kernellabs.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, =?iso-8859-1?Q?M=E1rcio?= A Alves <froooozen@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

"dev" is NULL here so we should use "nr" instead of "dev->devno".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/video/cx231xx/cx231xx-cards.c b/drivers/media/video/cx231xx/cx231xx-cards.c
index 919ed77..875a7ce 100644
--- a/drivers/media/video/cx231xx/cx231xx-cards.c
+++ b/drivers/media/video/cx231xx/cx231xx-cards.c
@@ -1052,7 +1052,7 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (dev = NULL) {
 		cx231xx_err(DRIVER_NAME ": out of memory!\n");
-		clear_bit(dev->devno, &cx231xx_devused);
+		clear_bit(nr, &cx231xx_devused);
 		return -ENOMEM;
 	}
 
