From: Kevin Hilman <khilman@ti.com>
Date: Tue, 01 Feb 2011 22:22:19 +0000
Subject: Re: [PATCH v2] arm: mach-omap2: potential NULL dereference
Message-Id: <87lj1zpf8k.fsf@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1295258922-31242-1-git-send-email-segoon@openwall.com>
	<4D341C35.80506@bfs.de> <20110119125721.GA9203@albatros>
In-Reply-To: <20110119125721.GA9203@albatros> (Vasiliy Kulikov's message of
	"Wed, 19 Jan 2011 15:57:22 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Vasiliy Kulikov <segoon@openwall.com> writes:

> kzalloc() may fail, if so return -ENOMEM.  Also Walter Harms suggested
> to use kasprintf() instead of kzalloc+strcpy+strcat.
>
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
> ---
>  Cannot compile this driver, so it is not tested at all.

Boot tested on 3430/n900 and 3630/Zoom3.

Queueing for 2.6.39 (branch: for_2.6.39/pm-misc)

Kevin

>  arch/arm/mach-omap2/smartreflex.c |    8 +++++---
>  1 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-omap2/smartreflex.c b/arch/arm/mach-omap2/smartreflex.c
> index 77ecebf..697d8d4 100644
> --- a/arch/arm/mach-omap2/smartreflex.c
> +++ b/arch/arm/mach-omap2/smartreflex.c
> @@ -260,9 +260,11 @@ static int sr_late_init(struct omap_sr *sr_info)
>  	if (sr_class->class_type = SR_CLASS2 &&
>  		sr_class->notify_flags && sr_info->irq) {
>  
> -		name = kzalloc(SMARTREFLEX_NAME_LEN + 1, GFP_KERNEL);
> -		strcpy(name, "sr_");
> -		strcat(name, sr_info->voltdm->name);
> +		name = kasprintf(GFP_KERNEL, "sr_%s", sr_info->voltdm->name);
> +		if (name = NULL) {
> +			ret = -ENOMEM;
> +			goto error;
> +		}
>  		ret = request_irq(sr_info->irq, sr_interrupt,
>  				0, name, (void *)sr_info);
>  		if (ret)
