From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Jan 2015 09:57:08 +0000
Subject: [patch] staging: lustre: potential underflow in mdc_iocontrol()
Message-Id: <20150106095708.GB8698@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains that "data->ioc_plen2" is a user controlled value and,
since we cast to signed int, the limit check can underflow.  It's not
very serious because probably the copy_to_user() would return -EFAULT
on every arch that matters instead of creating an info leak.  Also I
haven't followed it through to see if the value is really user
controlled.

But definitely it would be safer to cast to unsigned so let's do that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/lustre/lustre/mdc/mdc_request.c b/drivers/staging/lustre/lustre/mdc/mdc_request.c
index 3b0f245..05d05ce 100644
--- a/drivers/staging/lustre/lustre/mdc/mdc_request.c
+++ b/drivers/staging/lustre/lustre/mdc/mdc_request.c
@@ -1908,8 +1908,8 @@ static int mdc_iocontrol(unsigned int cmd, struct obd_export *exp, int len,
 
 		/* copy UUID */
 		if (copy_to_user(data->ioc_pbuf2, obd2cli_tgt(obd),
-				     min((int) data->ioc_plen2,
-					 (int) sizeof(struct obd_uuid)))) {
+				 min_t(size_t, data->ioc_plen2,
+					       sizeof(struct obd_uuid)))) {
 			rc = -EFAULT;
 			goto out;
 		}
@@ -1921,8 +1921,8 @@ static int mdc_iocontrol(unsigned int cmd, struct obd_export *exp, int len,
 			goto out;
 
 		if (copy_to_user(data->ioc_pbuf1, &stat_buf,
-				     min((int) data->ioc_plen1,
-					 (int) sizeof(stat_buf)))) {
+				 min_t(size_t, data->ioc_plen1,
+					       sizeof(stat_buf)))) {
 			rc = -EFAULT;
 			goto out;
 		}
