From: Dan Carpenter <error27@gmail.com>
Date: Sun, 29 May 2011 19:53:12 +0000
Subject: [patch 1/2] ptp: return -EFAULT on copy_to_user() errors
Message-Id: <20110529195312.GA3099@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richard.cochran@omicron.at>
Cc: "David S. Miller" <davem@davemloft.net>, John Stultz <john.stultz@linaro.org>, Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

copy_to_user() returns the number of bytes remaining, but we want a
negative error code here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
index a8d03ae..93fa22d 100644
--- a/drivers/ptp/ptp_chardev.c
+++ b/drivers/ptp/ptp_chardev.c
@@ -46,7 +46,8 @@ long ptp_ioctl(struct posix_clock *pc, unsigned int cmd, unsigned long arg)
 		caps.n_ext_ts = ptp->info->n_ext_ts;
 		caps.n_per_out = ptp->info->n_per_out;
 		caps.pps = ptp->info->pps;
-		err = copy_to_user((void __user *)arg, &caps, sizeof(caps));
+		if (copy_to_user((void __user *)arg, &caps, sizeof(caps)))
+			err = -EFAULT;
 		break;
 
 	case PTP_EXTTS_REQUEST:
