From: Shawn Guo <shawnguo@kernel.org>
Date: Mon, 07 Oct 2019 11:58:24 +0000
Subject: Re: [PATCH] ARM: zx: Use devm_platform_ioremap_resource() in zx296702_pd_probe()
Message-Id: <20191007115822.GH7150@dragon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <30b6c588-6c4b-c8ff-6414-a3fc53867bfe@web.de>
In-Reply-To: <30b6c588-6c4b-c8ff-6414-a3fc53867bfe@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Himanshu Jha <himanshujha199640@gmail.com>, Jun Nie <jun.nie@linaro.org>, linux-arm-kernel@lists.infradead.org

On Wed, Sep 18, 2019 at 07:57:05AM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 07:40:26 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Shawn Guo <shawnguo@kernel.org>

@Arnd, can you please help apply it to arm-soc tree?

Shawn

> ---
>  arch/arm/mach-zx/zx296702-pm-domain.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/arch/arm/mach-zx/zx296702-pm-domain.c b/arch/arm/mach-zx/zx296702-pm-domain.c
> index 7a08bf9dd792..ba4f556b7a13 100644
> --- a/arch/arm/mach-zx/zx296702-pm-domain.c
> +++ b/arch/arm/mach-zx/zx296702-pm-domain.c
> @@ -152,7 +152,6 @@ static struct generic_pm_domain *zx296702_pm_domains[] = {
>  static int zx296702_pd_probe(struct platform_device *pdev)
>  {
>  	struct genpd_onecell_data *genpd_data;
> -	struct resource *res;
>  	int i;
> 
>  	genpd_data = devm_kzalloc(&pdev->dev, sizeof(*genpd_data), GFP_KERNEL);
> @@ -161,14 +160,7 @@ static int zx296702_pd_probe(struct platform_device *pdev)
> 
>  	genpd_data->domains = zx296702_pm_domains;
>  	genpd_data->num_domains = ARRAY_SIZE(zx296702_pm_domains);
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev, "no memory resource defined\n");
> -		return -ENODEV;
> -	}
> -
> -	pcubase = devm_ioremap_resource(&pdev->dev, res);
> +	pcubase = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(pcubase)) {
>  		dev_err(&pdev->dev, "ioremap fail.\n");
>  		return -EIO;
> --
> 2.23.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
