From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 26 Nov 2010 17:06:47 +0000
Subject: [PATCH] power: gpio-charger: fix potential NULL dereference
Message-Id: <1290791209-21493-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290192114-11659-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1290192114-11659-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, Anton Vorontsov <cbouatmailru@gmail.com>, linux-kernel@vger.kernel.org

kzalloc() may fail, if so return with -ENOMEM.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/power/gpio-charger.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/power/gpio-charger.c b/drivers/power/gpio-charger.c
index fccbe99..41e4687 100644
--- a/drivers/power/gpio-charger.c
+++ b/drivers/power/gpio-charger.c
@@ -87,6 +87,8 @@ static int __devinit gpio_charger_probe(struct platform_device *pdev)
 	}
 
 	gpio_charger = kzalloc(sizeof(*gpio_charger), GFP_KERNEL);
+	if (gpio_charger = NULL)
+		return -ENOMEM;
 
 	charger = &gpio_charger->charger;
 
-- 
1.7.0.4

