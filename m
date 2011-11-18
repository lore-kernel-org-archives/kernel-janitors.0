From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Nov 2011 14:09:06 +0000
Subject: [patch] ath6kl: use a larger buffer for debug output
Message-Id: <20111118140906.GA9685@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This function makes the static checkers grumble.  The return value of
snprintf() is the number of bytes which would have been copied if
there was enough space.  In theory, a %u can take take 10 digits so
len could be larger than 16 and it would be a small information
leak.

We may as well make the buffer larger as well since that is very
easy to do.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ath6kl/debug.c b/drivers/net/wireless/ath/ath6kl/debug.c
index 9eff0d0..e632008 100644
--- a/drivers/net/wireless/ath/ath6kl/debug.c
+++ b/drivers/net/wireless/ath/ath6kl/debug.c
@@ -1551,11 +1551,12 @@ static ssize_t ath6kl_listen_int_read(struct file *file,
 						size_t count, loff_t *ppos)
 {
 	struct ath6kl *ar = file->private_data;
-	char buf[16];
+	char buf[32];
 	int len;
 
 	len = snprintf(buf, sizeof(buf), "%u %u\n", ar->listen_intvl_t,
 					ar->listen_intvl_b);
+	len = min(sizeof(buf), len);
 
 	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
 }
