From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Nov 2012 17:35:09 +0000
Subject: [patch 1/2] [media] rc: unlock on error in show_protocols()
Message-Id: <20121127173509.GE1059@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Douglas Bagnall <douglas@paradise.net.nz>, David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>, Jarod Wilson <jarod@redhat.com>, Ezequiel Garcia <elezegarcia@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently introduced a new return -ENODEV in this function but we need
to unlock before returning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 601d1ac1..d593bc6 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -789,8 +789,10 @@ static ssize_t show_protocols(struct device *device,
 	} else if (dev->raw) {
 		enabled = dev->raw->enabled_protocols;
 		allowed = ir_raw_get_allowed_protocols();
-	} else
+	} else {
+		mutex_unlock(&dev->lock);
 		return -ENODEV;
+	}
 
 	IR_dprintk(1, "allowed - 0x%llx, enabled - 0x%llx\n",
 		   (long long)allowed,
