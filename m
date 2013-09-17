From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Sep 2013 10:47:54 +0000
Subject: [patch] pinctrl: remove an unnecessary cast
Message-Id: <20130917104754.GA29918@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

sizeof() is already size_t so there is no need to cast here.  Generally,
casting inside the min() macro instead of using min_t() is considered
bad style.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index a138965..abe66d4 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -508,7 +508,7 @@ static int pinconf_dbg_config_write(struct file *file,
 	int i;
 
 	/* Get userspace string and assure termination */
-	buf_size = min(count, (size_t)(sizeof(buf)-1));
+	buf_size = min(count, sizeof(buf) - 1);
 	if (copy_from_user(buf, user_buf, buf_size))
 		return -EFAULT;
 	buf[buf_size] = 0;
