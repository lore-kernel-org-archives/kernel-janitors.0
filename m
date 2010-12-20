From: Dan Carpenter <error27@gmail.com>
Date: Mon, 20 Dec 2010 13:08:56 +0000
Subject: [patch -next] power/gpio-charger: check for kzalloc() failure
Message-Id: <20101220130856.GZ1936@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Anton Vorontsov <cbouatmailru@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Return -ENOMEM if kzalloc() fails.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/power/gpio-charger.c b/drivers/power/gpio-charger.c
index fccbe99..06a74f0 100644
--- a/drivers/power/gpio-charger.c
+++ b/drivers/power/gpio-charger.c
@@ -87,6 +87,8 @@ static int __devinit gpio_charger_probe(struct platform_device *pdev)
 	}
 
 	gpio_charger = kzalloc(sizeof(*gpio_charger), GFP_KERNEL);
+	if (!gpio_charger)
+		return -ENOMEM;
 
 	charger = &gpio_charger->charger;
 
