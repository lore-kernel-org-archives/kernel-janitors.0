From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Wed, 04 Oct 2017 19:44:32 +0000
Subject: Re: [PATCH 1/5] cris: nand: Delete an error message for a failed memory allocation in crisv32_nand_f
Message-Id: <20171004214432.20833a0ff3b9c8fdced2ebaa@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
        <92a95fe3-5b8d-5dd9-a7bf-131a999e74c6@users.sourceforge.net>
In-Reply-To: <92a95fe3-5b8d-5dd9-a7bf-131a999e74c6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-cris-kernel@axis.com, Boris Brezillon <boris.brezillon@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Krzysztof Halasa <khalasa@piap.pl>, Mikael Starvik <starvik@axis.com>, Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello Markus,

On Wed, 4 Oct 2017 20:45:14 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.

what exactly has the software detected?
I cannot find, how this error is reported otherwise, it seems
to me that the message is not that superflous.

The patches 2..4 look to me as an exercise without any practical meaning.
Indeed, that's not how new code should be posted, but if we start
rewriting all the legacy code, this will produce huge and completely
unnecessary patch traffic.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 2 --
>  arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> index 925a98eb6d68..259aa1f46fbe 100644
> --- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> +++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> @@ -136,8 +136,6 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
>  	/* Allocate memory for MTD device structure and private data */
>  	wrapper = kzalloc(sizeof(struct mtd_info_wrapper), GFP_KERNEL);
>  	if (!wrapper) {
> -		printk(KERN_ERR "Unable to allocate CRISv32 NAND MTD "
> -			"device structure.\n");
>  		err = -ENOMEM;
>  		return NULL;
>  	}
> diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> index 53b56a429dde..1baf16ee74e8 100644
> --- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> +++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> @@ -111,8 +111,6 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
>  	/* Allocate memory for MTD device structure and private data */
>  	wrapper = kzalloc(sizeof(struct mtd_info_wrapper), GFP_KERNEL);
>  	if (!wrapper) {
> -		printk(KERN_ERR "Unable to allocate CRISv32 NAND MTD "
> -			"device structure.\n");
>  		err = -ENOMEM;
>  		return NULL;
>  	}

-- 
Alexander Sverdlin.
