From: David Daney <ddaney.cavm@gmail.com>
Date: Thu, 14 Jul 2016 15:38:46 +0000
Subject: Re: [patch] MIPS: OCTEON: Off by one in octeon_irq_gpio_map()
Message-Id: <5787B206.3030902@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160714101429.GA18175@mwanda>
In-Reply-To: <20160714101429.GA18175@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, Rob Herring <robh@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, linux-mips@linux-mips.org, kernel-janitors@vger.kernel.org

On 07/14/2016 03:14 AM, Dan Carpenter wrote:
> It should be >= ARRAY_SIZE() instead of > ARRAY_SIZE().
>
> Fixes: 64b139f97c01 ('MIPS: OCTEON: irq: add CIB and other fixes')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch.  This would probably only matter if a malformed device tree, 
or buggy device driver were encountered.

Acked-by: David Daney <david.daney@cavium.com>


>
> diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
> index 368eb49..75a4add 100644
> --- a/arch/mips/cavium-octeon/octeon-irq.c
> +++ b/arch/mips/cavium-octeon/octeon-irq.c
> @@ -1260,7 +1260,7 @@ static int octeon_irq_gpio_map(struct irq_domain *d,
>
>   	line = (hw + gpiod->base_hwirq) >> 6;
>   	bit = (hw + gpiod->base_hwirq) & 63;
> -	if (line > ARRAY_SIZE(octeon_irq_ciu_to_irq) ||
> +	if (line >= ARRAY_SIZE(octeon_irq_ciu_to_irq) ||
>   		octeon_irq_ciu_to_irq[line][bit] != 0)
>   		return -EINVAL;
>
>

