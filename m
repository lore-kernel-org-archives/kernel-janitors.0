From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Oct 2016 07:34:18 +0000
Subject: [patch] ntb_perf: potential info leak in debugfs
Message-Id: <20161014073418.GD15168@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is a static checker warning, not something I'm desperately
concerned about.  But snprintf() returns the number of bytes that
would have been copied if there were space.  We really care about the
number of bytes that actually were copied so we should use scnprintf()
instead.

It probably won't overrun, and in that case we may as well just use
sprintf() but these sorts of things make static checkers and code
reviewers happier.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/ntb/test/ntb_perf.c b/drivers/ntb/test/ntb_perf.c
index 6a50f20..2d9ca58 100644
--- a/drivers/ntb/test/ntb_perf.c
+++ b/drivers/ntb/test/ntb_perf.c
@@ -589,7 +589,7 @@ static ssize_t debugfs_run_read(struct file *filp, char __user *ubuf,
 		return -ENOMEM;
 
 	if (mutex_is_locked(&perf->run_mutex)) {
-		out_off = snprintf(buf, 64, "running\n");
+		out_off = scnprintf(buf, 64, "running\n");
 		goto read_from_buf;
 	}
 
@@ -600,14 +600,14 @@ static ssize_t debugfs_run_read(struct file *filp, char __user *ubuf,
 			break;
 
 		if (pctx->status) {
-			out_off += snprintf(buf + out_off, 1024 - out_off,
+			out_off += scnprintf(buf + out_off, 1024 - out_off,
 					    "%d: error %d\n", i,
 					    pctx->status);
 			continue;
 		}
 
 		rate = div64_u64(pctx->copied, pctx->diff_us);
-		out_off += snprintf(buf + out_off, 1024 - out_off,
+		out_off += scnprintf(buf + out_off, 1024 - out_off,
 			"%d: copied %llu bytes in %llu usecs, %llu MBytes/s\n",
 			i, pctx->copied, pctx->diff_us, rate);
 	}
