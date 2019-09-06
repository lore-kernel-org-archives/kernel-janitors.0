From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Date: Fri, 06 Sep 2019 17:16:27 +0000
Subject: Re: [PATCH -next] gpio: creg-snps: use devm_platform_ioremap_resource() to simplify code
Message-Id: <BY5PR12MB4034937150040335D9C68FF9DEBA0@BY5PR12MB4034.namprd12.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906131032.22148-1-yuehaibing@huawei.com>
In-Reply-To: <20190906131032.22148-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi YueHaibing,

thanks,
Acked-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>

---
 Eugeniy Paltsev


________________________________________
From: YueHaibing <yuehaibing@huawei.com>
Sent: Friday, September 6, 2019 16:10
To: Eugeniy.Paltsev@synopsys.com; linus.walleij@linaro.org; bgolaszewski@baylibre.com
Cc: linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org; YueHaibing
Subject: [PATCH -next] gpio: creg-snps: use devm_platform_ioremap_resource() to simplify code

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpio/gpio-creg-snps.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index 8cbc94d..ff19a8a 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -137,7 +137,6 @@ static int creg_gpio_probe(struct platform_device *pdev)
        const struct of_device_id *match;
        struct device *dev = &pdev->dev;
        struct creg_gpio *hcg;
-       struct resource *mem;
        u32 ngpios;
        int ret;

@@ -145,8 +144,7 @@ static int creg_gpio_probe(struct platform_device *pdev)
        if (!hcg)
                return -ENOMEM;

-       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-       hcg->regs = devm_ioremap_resource(dev, mem);
+       hcg->regs = devm_platform_ioremap_resource(pdev, 0);
        if (IS_ERR(hcg->regs))
                return PTR_ERR(hcg->regs);

--
2.7.4
