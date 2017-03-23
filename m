From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Mar 2017 10:40:49 +0000
Subject: [PATCH] leds: mt6323: Fix an off by one bug in probe
Message-Id: <20170323104049.GC20154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

It should be ">= MT6323_MAX_LEDS" instead of ">".  Also "reg" is a u32
so it can't be negative and we can remove the test for negative values.

Fixes: 216ec6cc4c19 ("leds: Add LED support for MT6323 PMIC")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index 48081bccbea5..8893c74e9a1f 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -417,7 +417,7 @@ static int mt6323_led_probe(struct platform_device *pdev)
 			goto put_child_node;
 		}
 
-		if (reg < 0 || reg > MT6323_MAX_LEDS || leds->led[reg]) {
+		if (reg >= MT6323_MAX_LEDS || leds->led[reg]) {
 			dev_err(dev, "Invalid led reg %u\n", reg);
 			ret = -EINVAL;
 			goto put_child_node;
