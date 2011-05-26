From: Dan Carpenter <error27@gmail.com>
Date: Thu, 26 May 2011 08:52:01 +0000
Subject: [patch] [media] rc: double unlock in rc_register_device()
Message-Id: <20110526085201.GF14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Jarod Wilson <jarod@redhat.com>, David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>, Dmitry Torokhov <dtor@mail.ru>, "open list:MEDIA INPUT INFRA..." <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org

If change_protocol() fails and we goto out_raw, then it calls unlock
twice.  I noticed that the other time we called change_protocol() we
held the &dev->lock, so I changed it to hold it here too.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested only.

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index f57cd56..136a6c6 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -1097,7 +1097,6 @@ int rc_register_device(struct rc_dev *dev)
 		if (rc < 0)
 			goto out_input;
 	}
-	mutex_unlock(&dev->lock);
 
 	if (dev->change_protocol) {
 		rc = dev->change_protocol(dev, rc_map->rc_type);
@@ -1105,6 +1104,8 @@ int rc_register_device(struct rc_dev *dev)
 			goto out_raw;
 	}
 
+	mutex_unlock(&dev->lock);
+
 	IR_dprintk(1, "Registered rc%ld (driver: %s, remote: %s, mode %s)\n",
 		   dev->devno,
 		   dev->driver_name ? dev->driver_name : "unknown",
