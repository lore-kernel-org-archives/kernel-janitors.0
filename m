From: Chanwoo Choi <cw00.choi@samsung.com>
Date: Wed, 18 May 2016 10:57:28 +0000
Subject: Re: [patch] PM / devfreq: exynos-nocp: Checking for IS_ERR instead of NULL
Message-Id: <573C4A98.9060500@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160518103707.GA9436@mwanda>
In-Reply-To: <20160518103707.GA9436@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 2016년 05월 18일 19:37, Dan Carpenter wrote:
> The platform_get_resource() function returns NULL on error, it never
> returns error pointers.
> 
> Fixes: 0179a913875a ('PM / devfreq: event: Add new Exynos NoC probe driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/devfreq/event/exynos-nocp.c b/drivers/devfreq/event/exynos-nocp.c
> index 6b6a5f3..03b35d5 100644
> --- a/drivers/devfreq/event/exynos-nocp.c
> +++ b/drivers/devfreq/event/exynos-nocp.c
> @@ -220,8 +220,8 @@ static int exynos_nocp_parse_dt(struct platform_device *pdev,
>  
>  	/* Maps the memory mapped IO to control nocp register */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (IS_ERR(res))
> -		return PTR_ERR(res);
> +	if (!res)
> +		return -ENXIO;
>  
>  	base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(base))

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi


