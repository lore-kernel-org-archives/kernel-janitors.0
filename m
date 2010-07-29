From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 29 Jul 2010 15:55:15 +0000
Subject: [PATCH] char: cs5535_gpio: check put_user() result
Message-Id: <1280418915-5674-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org

put_user() may fail, if so return -EFAULT.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/char/cs5535_gpio.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/char/cs5535_gpio.c b/drivers/char/cs5535_gpio.c
index 4d830dc..fb7b888 100644
--- a/drivers/char/cs5535_gpio.c
+++ b/drivers/char/cs5535_gpio.c
@@ -146,7 +146,8 @@ static ssize_t cs5535_gpio_read(struct file *file, char __user *buf,
 
 	/* add a line-feed if there is room */
 	if ((i = ARRAY_SIZE(rm)) && (count < len)) {
-		put_user('\n', buf + count);
+		if (put_user('\n', buf + count))
+			return -EFAULT;
 		count++;
 	}
 
-- 
1.7.0.4

