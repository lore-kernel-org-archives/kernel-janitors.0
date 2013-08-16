From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Aug 2013 07:16:59 +0000
Subject: [patch] USB: mos7720: use GFP_ATOMIC under spinlock
Message-Id: <20130816071659.GA6053@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The write_parport_reg_nonblock() function shouldn't sleep because it's
called with spinlocks held.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index b013001..248fda6 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -374,7 +374,7 @@ static int write_parport_reg_nonblock(struct mos7715_parport *mos_parport,
 		kfree(urbtrack);
 		return -ENOMEM;
 	}
-	urbtrack->setup = kmalloc(sizeof(*urbtrack->setup), GFP_KERNEL);
+	urbtrack->setup = kmalloc(sizeof(*urbtrack->setup), GFP_ATOMIC);
 	if (!urbtrack->setup) {
 		usb_free_urb(urbtrack->urb);
 		kfree(urbtrack);
