From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 02 Jul 2018 12:41:49 +0000
Subject: Re: [PATCH][next] pinctrl: actions: fix unsigned less than zero comparison
Message-Id: <20180702122949.GA9925@mani>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702121504.6731-1-colin.king@canonical.com>
In-Reply-To: <20180702121504.6731-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hi Colin,

On Mon, Jul 02, 2018 at 01:15:04PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check to see if platform_get_irq failed is performed on the
> unsigned value of pctrl->irq[i] and the check is never true because
> an unsigned cannot be less than zero.  Fix this by assinging the
> signed int ret to the return of platform_get_irq and checking ret
> instead.
> 

Thanks for spotting!

> Detected by CoverityScan, CID#1470247 ("Unsigned comparison against 0")
> 
> Fixes: 6c5d0736e9c0 ("pinctrl: actions: Add interrupt support for OWL S900 SoC")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pinctrl/actions/pinctrl-owl.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
> index 4fa9cc377b3b..133ce9e0000a 100644
> --- a/drivers/pinctrl/actions/pinctrl-owl.c
> +++ b/drivers/pinctrl/actions/pinctrl-owl.c
> @@ -1026,11 +1026,10 @@ int owl_pinctrl_probe(struct platform_device *pdev,
>  	}
>  
>  	for (i = 0; i < pctrl->num_irq ; i++) {
> -		pctrl->irq[i] = platform_get_irq(pdev, i);
> -		if (pctrl->irq[i] < 0) {
> -			ret = pctrl->irq[i];
> +		ret = platform_get_irq(pdev, i);
> +		pctrl->irq[i] = ret;

Can we move this statement below if condition:

ret = platform_get_irq(pdev, i);
if (ret < 0)
	goto err_exit;
pctrl->irq[i] = ret;

This looks slightly better.

Thanks,
Mani

> +		if (ret < 0)
>  			goto err_exit;
> -		}
>  	}
>  
>  	ret = owl_gpio_init(pctrl);
> -- 
> 2.17.1
> 
