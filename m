From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 19 Nov 2010 18:41:54 +0000
Subject: [PATCH] power: gpio-charger: fix potential NULL dereference
Message-Id: <1290192114-11659-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, Anton Vorontsov <cbouatmailru@gmail.com>, linux-kernel@vger.kernel.org

kzalloc() result is not compared with NULL.  It might lead to NULL
pointer dereference in OOM situation.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/power/gpio-charger.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/power/gpio-charger.c b/drivers/power/gpio-charger.c
index fccbe99..b07a71c 100644
--- a/drivers/power/gpio-charger.c
+++ b/drivers/power/gpio-charger.c
@@ -87,6 +87,10 @@ static int __devinit gpio_charger_probe(struct platform_device *pdev)
 	}
 
 	gpio_charger = kzalloc(sizeof(*gpio_charger), GFP_KERNEL);
+	if (!gpio_charger) {
+		dev_err(&pdev->dev, "kzalloc failed\n");
+		return -ENOMEM;
+	}
 
 	charger = &gpio_charger->charger;
 
-- 
1.7.0.4

