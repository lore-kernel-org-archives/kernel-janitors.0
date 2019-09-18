From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 05:57:05 +0000
Subject: [PATCH] ARM: zx: Use devm_platform_ioremap_resource() in zx296702_pd_probe()
Message-Id: <30b6c588-6c4b-c8ff-6414-a3fc53867bfe@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org, Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 07:40:26 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/mach-zx/zx296702-pm-domain.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm/mach-zx/zx296702-pm-domain.c b/arch/arm/mach-zx/zx296702-pm-domain.c
index 7a08bf9dd792..ba4f556b7a13 100644
--- a/arch/arm/mach-zx/zx296702-pm-domain.c
+++ b/arch/arm/mach-zx/zx296702-pm-domain.c
@@ -152,7 +152,6 @@ static struct generic_pm_domain *zx296702_pm_domains[] = {
 static int zx296702_pd_probe(struct platform_device *pdev)
 {
 	struct genpd_onecell_data *genpd_data;
-	struct resource *res;
 	int i;

 	genpd_data = devm_kzalloc(&pdev->dev, sizeof(*genpd_data), GFP_KERNEL);
@@ -161,14 +160,7 @@ static int zx296702_pd_probe(struct platform_device *pdev)

 	genpd_data->domains = zx296702_pm_domains;
 	genpd_data->num_domains = ARRAY_SIZE(zx296702_pm_domains);
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "no memory resource defined\n");
-		return -ENODEV;
-	}
-
-	pcubase = devm_ioremap_resource(&pdev->dev, res);
+	pcubase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pcubase)) {
 		dev_err(&pdev->dev, "ioremap fail.\n");
 		return -EIO;
--
2.23.0
