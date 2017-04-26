From: Colin King <colin.king@canonical.com>
Date: Wed, 26 Apr 2017 15:05:39 +0000
Subject: [PATCH] gpio: f7188x: add missing break in switch statement
Message-Id: <20170426150539.11261-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marty Plummer <netz.kernel@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The case statement for f71889a is missing a break statement, add it.

Detected with CoverityScan, CID#1431861 ("Missig break in switch")

Fixes: d69843e416d31 ("gpio: f7188x: Add F71889A GPIO support.")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpio-f7188x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index c013ff5deb70..13350c9d7f5e 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -398,6 +398,7 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 	case f71889a:
 		data->nr_bank = ARRAY_SIZE(f71889a_gpio_bank);
 		data->bank = f71889a_gpio_bank;
+		break;
 	case f71889f:
 		data->nr_bank = ARRAY_SIZE(f71889_gpio_bank);
 		data->bank = f71889_gpio_bank;
-- 
2.11.0

