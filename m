From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 May 2016 06:46:22 +0000
Subject: [patch] ptp: oops in ptp_ioctl()
Message-Id: <20160526064622.GA6776@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>, Muhammad Falak R Wani <falakreyaz@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If we pass ERR_PTR(-EFAULT) to kfree() then it's going to oops.

Fixes: 2ece068e1b1d ('ptp: use memdup_user().')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
index 0b1ac6b..d637c93 100644
--- a/drivers/ptp/ptp_chardev.c
+++ b/drivers/ptp/ptp_chardev.c
@@ -211,6 +211,7 @@ long ptp_ioctl(struct posix_clock *pc, unsigned int cmd, unsigned long arg)
 		sysoff = memdup_user((void __user *)arg, sizeof(*sysoff));
 		if (IS_ERR(sysoff)) {
 			err = PTR_ERR(sysoff);
+			sysoff = NULL;
 			break;
 		}
 		if (sysoff->n_samples > PTP_MAX_SAMPLES) {
