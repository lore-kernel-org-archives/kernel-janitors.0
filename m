From: Vasiliy Kulikov <segoon@openwall.com>
Date: Mon, 17 Jan 2011 10:08:49 +0000
Subject: [PATCH] staging: cs5535_gpio: check put_user() return code
Message-Id: <1295258929-31350-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Ben Gardner <bgardner@wabtec.com>, Andres Salomon <dilinger@queued.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

put_user() may fail, if so return -EFAULT.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/staging/cs5535_gpio/cs5535_gpio.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/cs5535_gpio/cs5535_gpio.c b/drivers/staging/cs5535_gpio/cs5535_gpio.c
index 0cf1e5f..b25f9d1 100644
--- a/drivers/staging/cs5535_gpio/cs5535_gpio.c
+++ b/drivers/staging/cs5535_gpio/cs5535_gpio.c
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

