From: Andreas Platschek <platschek@ict.tuwien.ac.at>
Date: Mon, 19 May 2014 13:37:25 +0000
Subject: [PATCH] staging: lustre: check length of char array
Message-Id: <0489DD9D42D26E4DB9E1C6DC9A9D2D0951844B5E@ictsrv010.ICT.TUWIEN.AC.AT>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This fixes the following sparse error:

drivers/staging/lustre/lustre/obdclass/llog_ioctl.c:388:39: error: incompatible types for operation (>)
drivers/staging/lustre/lustre/obdclass/llog_ioctl.c:388:39:    left side has type char *ioc_inlbuf2
drivers/staging/lustre/lustre/obdclass/llog_ioctl.c:388:39:    right side has type int

Signed-off-by: Andreas Platschek <platschek@ict.tuwien.ac.at>
---
 drivers/staging/lustre/lustre/obdclass/llog_ioctl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/llog_ioctl.c b/drivers/staging/lustre/lustre/obdclass/llog_ioctl.c
index da558a5..e192aab 100644
--- a/drivers/staging/lustre/lustre/obdclass/llog_ioctl.c
+++ b/drivers/staging/lustre/lustre/obdclass/llog_ioctl.c
@@ -385,7 +385,7 @@ int llog_ioctl(const struct lu_env *env, struct llog_ctxt *ctxt, int cmd,
 			GOTO(out_close, rc = -EINVAL);
 		}
 
-		if (data->ioc_inlbuf2 > 0) {
+		if (data->ioc_inllen2 > 0) {
 			/* remove indicate log from the catalog */
 			rc = str2logid(&plain, data->ioc_inlbuf2,
 				       data->ioc_inllen2);
-- 
1.7.10.4
