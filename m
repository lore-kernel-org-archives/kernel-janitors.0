From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Date: Fri, 21 Apr 2017 19:22:11 +0000
Subject: Re: [PATCH] pinctrl-armada-xp: Use devm_kmalloc_array() in armada_xp_pinctrl_probe()
Message-Id: <efa23d0481504229be1dd3678fa8078a@svr-chch-ex1.atlnz.lc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d109d375-6e91-420d-eb9a-fcaea4fbc5f7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Rob Herring <robh@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Markus,

On 15/04/17 05:04, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 14 Apr 2017 18:48:15 +0200
>
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus use the corresponding function "devm_kmalloc_array".
>
>   This issue was detected by using the Coccinelle software.
>
> * Replace the specification of a data type by a pointer dereference
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
>
> * Delete the local variable "nregs" which became unnecessary with
>   this refactoring.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-xp.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c b/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
> index b854f1ee5de5..457c54c8fed3 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-xp.c
> @@ -574,7 +574,6 @@ static int armada_xp_pinctrl_probe(struct platform_device *pdev)
>  	struct mvebu_pinctrl_soc_info *soc = &armada_xp_pinctrl_info;
>  	const struct of_device_id *match =
>  		of_match_device(armada_xp_pinctrl_of_match, &pdev->dev);
> -	int nregs;
>
>  	if (!match)
>  		return -ENODEV;
> @@ -628,10 +627,11 @@ static int armada_xp_pinctrl_probe(struct platform_device *pdev)
>  		break;
>  	}
>
> -	nregs = DIV_ROUND_UP(soc->nmodes, MVEBU_MPPS_PER_REG);
> -
> -	mpp_saved_regs = devm_kmalloc(&pdev->dev, nregs * sizeof(u32),
> -				      GFP_KERNEL);
> +	mpp_saved_regs = devm_kmalloc_array(&pdev->dev,
> +					    DIV_ROUND_UP(soc->nmodes,
> +							 MVEBU_MPPS_PER_REG),
> +					    sizeof(*mpp_saved_regs),
> +					    GFP_KERNEL);

I personally think having nregs makes the code a bit more readable but 
that's just me.

With or without a change

Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

>  	if (!mpp_saved_regs)
>  		return -ENOMEM;
>
>

