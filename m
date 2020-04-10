From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 10 Apr 2020 07:33:49 +0000
Subject: Re: [PATCH] usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
Message-Id: <be8cd229-884a-40e6-3363-7c4680a51b30@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
In-Reply-To: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tang Bin <tangbin@cmss.chinamobile.com>, Li Yang <leoyang.li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Shengju Zhang <zhangshengju@cmss.chinamobile.com>

> If the function "platform_get_irq()" failed, the negative value
> returned will not be detected here, including "-EPROBE_DEFER",

I suggest to adjust this change description.

Wording alternative:
  The negative return value (which could eventually be “-EPROBE_DEFER”)
  will not be detected here from a failed call of the function “platform_get_irq”.


> which causes the application to fail to get the correct error message.

Will another fine-tuning become relevant also for this wording?


> Thus it must be fixed.

Wording alternative:
  Thus adjust the error detection and corresponding exception handling.


> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>

How do you think about to add the tags “Fixes”, “Link” and “Reported-by”?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=c0cc271173b2e1c2d8d0ceaef14e4dfa79eefc0d#n584

usb: gadget: fsl_udc_core: Checking for a failed platform_get_irq() call in fsl_udc_probe()
https://lore.kernel.org/linux-usb/36341bb1-1e00-5eb1-d032-60dcc614ddaf@web.de/
https://lkml.org/lkml/2020/4/8/442

…
> +++ b/drivers/usb/gadget/udc/fsl_udc_core.c
> @@ -2441,8 +2441,8 @@ static int fsl_udc_probe(struct platform_device *pdev)
>  	udc_controller->max_ep = (dccparams & DCCPARAMS_DEN_MASK) * 2;
>
>  	udc_controller->irq = platform_get_irq(pdev, 0);
> -	if (!udc_controller->irq) {
> -		ret = -ENODEV;
> +	if (udc_controller->irq <= 0) {

Will such a failure predicate need any more clarification?

How does this check fit to the current software documentation?


> +		ret = udc_controller->irq ? : -ENODEV;

Will it be clearer to specify values for all cases in such a conditional operator
(instead of leaving one case empty)?

Regards,
Markus
