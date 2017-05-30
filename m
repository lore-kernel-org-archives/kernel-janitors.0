From: Colin King <colin.king@canonical.com>
Date: Tue, 30 May 2017 11:02:06 +0000
Subject: [PATCH][V2] gpiolib: remove unused variable 'i'
Message-Id: <20170530110206.785-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Fixes smatch warning:unused variable 'i' [-Wunused-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpiolib.c                   | 2 --
 sound/soc/generic/audio-graph-scu-card.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index be8097097326..62ffb4e293d2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1471,8 +1471,6 @@ static struct gpio_chip *find_chip_by_name(const char *name)
 
 static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
 {
-	int i;
-
 	if (!gpiochip->irq_need_valid_mask)
 		return 0;
 

