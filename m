From: Dan Carpenter <error27@gmail.com>
Date: Thu, 26 May 2011 08:55:08 +0000
Subject: [patch] [media] rc/redrat3: dereferencing null pointer
Message-Id: <20110526085508.GG14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Jarod Wilson <jarod@redhat.com>, "open list:MEDIA INPUT INFRA..." <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org

In the original code, if the allocation failed we dereference "rr3"
when it was NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 5147767..4582ef7 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1186,7 +1186,7 @@ static int __devinit redrat3_dev_probe(struct usb_interface *intf,
 	rr3 = kzalloc(sizeof(*rr3), GFP_KERNEL);
 	if (rr3 = NULL) {
 		dev_err(dev, "Memory allocation failure\n");
-		goto error;
+		goto no_endpoints;
 	}
 
 	rr3->dev = &intf->dev;
