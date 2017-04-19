From: Mark Rutland <mark.rutland@arm.com>
Date: Wed, 19 Apr 2017 08:23:18 +0000
Subject: Re: [PATCH] bus: arm-ccn: Use devm_kcalloc() in arm_ccn_probe()
Message-Id: <20170419082317.GA27829@leverpostej>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3458009f-6489-da7f-c1c1-c834d5b9d41d@users.sourceforge.net>
In-Reply-To: <3458009f-6489-da7f-c1c1-c834d5b9d41d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Ingo Molnar <mingo@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Apr 19, 2017 at 09:29:24AM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 19 Apr 2017 09:12:43 +0200
> 
> Multiplications for the size determination of memory allocations
> indicated that array data structures should be processed.
> Thus use the corresponding function "devm_kcalloc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

This looks reasonable to me. FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

I'll leave the final say to Pawel.

Mark.

> ---
>  drivers/bus/arm-ccn.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/arm-ccn.c b/drivers/bus/arm-ccn.c
> index 4d6a2b7e4d3f..6375bda0b2a1 100644
> --- a/drivers/bus/arm-ccn.c
> +++ b/drivers/bus/arm-ccn.c
> @@ -1520,10 +1520,10 @@ static int arm_ccn_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> -	ccn->node = devm_kzalloc(ccn->dev, sizeof(*ccn->node) * ccn->num_nodes,
> -		GFP_KERNEL);
> -	ccn->xp = devm_kzalloc(ccn->dev, sizeof(*ccn->node) * ccn->num_xps,
> -		GFP_KERNEL);
> +	ccn->node = devm_kcalloc(ccn->dev, ccn->num_nodes, sizeof(*ccn->node),
> +				 GFP_KERNEL);
> +	ccn->xp = devm_kcalloc(ccn->dev, ccn->num_xps, sizeof(*ccn->node),
> +			       GFP_KERNEL);
>  	if (!ccn->node || !ccn->xp)
>  		return -ENOMEM;
>  
> -- 
> 2.12.2
> 
