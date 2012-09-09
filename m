From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 09 Sep 2012 20:31:42 +0000
Subject: [patch v2] [media] rc-core: prevent divide by zero bug in s_tx_carrier()
Message-Id: <20120909203142.GA12296@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Sean Young <sean@mess.org>, David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>, Ben Hutchings <ben@decadent.org.uk>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Several of the drivers use carrier as a divisor in their s_tx_carrier()
functions.  We should do a sanity check here like we do for
LIRC_SET_REC_CARRIER.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Ben Hutchings pointed out that my first patch was not a complete
    fix.

diff --git a/drivers/media/rc/ir-lirc-codec.c b/drivers/media/rc/ir-lirc-codec.c
index 6ad4a07..28dc0f0 100644
--- a/drivers/media/rc/ir-lirc-codec.c
+++ b/drivers/media/rc/ir-lirc-codec.c
@@ -211,6 +211,9 @@ static long ir_lirc_ioctl(struct file *filep, unsigned int cmd,
 		if (!dev->s_tx_carrier)
 			return -EINVAL;
 
+		if (val <= 0)
+			return -EINVAL;
+
 		return dev->s_tx_carrier(dev, val);
 
 	case LIRC_SET_SEND_DUTY_CYCLE:
