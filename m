From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 28 Sep 2018 02:17:48 +0000
Subject: [PATCH -next] gpio: omap: Remove set but not used variable 'dev'
Message-Id: <1538101068-160486-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpio/gpio-omap.c: In function 'gpio_omap_cpu_notifier':
drivers/gpio/gpio-omap.c:1327:17: warning:
 variable 'dev' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpio/gpio-omap.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index c0d7ae7..e67d612 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1324,11 +1324,9 @@ static int gpio_omap_cpu_notifier(struct notifier_block *nb,
 				  unsigned long cmd, void *v)
 {
 	struct gpio_bank *bank;
-	struct device *dev;
 	unsigned long flags;
 
 	bank = container_of(nb, struct gpio_bank, nb);
-	dev = bank->chip.parent;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	switch (cmd) {
