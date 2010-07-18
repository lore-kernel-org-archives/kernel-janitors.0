From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Sun, 18 Jul 2010 16:46:30 +0000
Subject: Re: [PATCH] drivers/mtd: remove makefile subdirectory processing
Message-Id: <1279471590.16247.57.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100714042509.GA7775@caffeine.csclub.uwaterloo.ca>
In-Reply-To: <20100714042509.GA7775@caffeine.csclub.uwaterloo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kyle Spaans <kspaans@uwaterloo.ca>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

On Wed, 2010-07-14 at 00:25 -0400, Kyle Spaans wrote:
> Remove redundant config checks when the subdirectory's Makefile is already
> conditionally processed. Add more conditional processing when the subdirectory
> can be selected/deselected as a whole.
> 
> Signed-off-by: Kyle Spaans <kspaans@uwaterloo.ca>
> Reviewed-by: Robert P. J. Day <rpjday@crashcourse.ca>
> ---

This does not apply to the mtd-2.6.git tree [1]. Also I spotted that

...
 
> +obj-$(CONFIG_MTD_TESTS)		+= tests/
> +obj-$(CONFIG_MTD_LPDDR)		+= lpddr/
> +obj-$(CONFIG_MTD_NAND)		+= nand/
> +obj-$(CONFIG_MTD_ONENAND)	+= onenand/
>  obj-$(CONFIG_MTD_BI)		+= ubi/

This cannot be right, because we have UBI, not 'BI'.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

