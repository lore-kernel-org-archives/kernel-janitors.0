From: Sergei Shtylyov <sshtylyov@mvista.com>
Date: Mon, 17 Jan 2011 12:30:56 +0000
Subject: Re: [PATCH] arm: mach-omap2: potential NULL dereference
Message-Id: <4D343680.1030701@ru.mvista.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1295258922-31242-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1295258922-31242-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hello.

On 17-01-2011 13:08, Vasiliy Kulikov wrote:

> kzalloc() may fail, if so return -ENOMEM.

> Signed-off-by: Vasiliy Kulikov<segoon@openwall.com>
[...]

> diff --git a/arch/arm/mach-omap2/smartreflex.c b/arch/arm/mach-omap2/smartreflex.c
> index 77ecebf..871bca9 100644
> --- a/arch/arm/mach-omap2/smartreflex.c
> +++ b/arch/arm/mach-omap2/smartreflex.c
> @@ -260,7 +260,10 @@ static int sr_late_init(struct omap_sr *sr_info)
>   	if (sr_class->class_type = SR_CLASS2&&
>   		sr_class->notify_flags&&  sr_info->irq) {
>
> +		ret = -ENOMEM;
>   		name = kzalloc(SMARTREFLEX_NAME_LEN + 1, GFP_KERNEL);
> +		if (name = NULL)
> +			goto error;

    Why not:

		if (name = NULL) {
			ret = -ENOMEM;
			goto error;
		}

WBR, Sergei
