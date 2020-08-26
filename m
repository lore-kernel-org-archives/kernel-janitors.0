From: Roger Quadros <rogerq@ti.com>
Date: Wed, 26 Aug 2020 13:05:12 +0000
Subject: Re: [PATCH] memory: omap-gpmc: Fix a couple off by ones
Message-Id: <919395fe-8108-94f5-3370-a573da8313f9@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200825104707.GB278587@mwanda>
In-Reply-To: <20200825104707.GB278587@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 25/08/2020 13:47, Dan Carpenter wrote:
> These comparisons should be >= instead of > to prevent reading one
> element beyond the end of the gpmc_cs[] array.
> 
> Fixes: cdd6928c589a ("ARM: OMAP2+: Add device-tree support for NOR flash")
> Fixes: f37e4580c409 ("ARM: OMAP2: Dynamic allocator for GPMC memory space")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Roger Quadros <rogerq@ti.com>

> ---
>   drivers/memory/omap-gpmc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index cd9e80748591..fd245b82163a 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -989,7 +989,7 @@ static int gpmc_cs_remap(int cs, u32 base)
>   	int ret;
>   	u32 old_base, size;
>   
> -	if (cs > gpmc_cs_num) {
> +	if (cs >= gpmc_cs_num) {
>   		pr_err("%s: requested chip-select is disabled\n", __func__);
>   		return -ENODEV;
>   	}
> @@ -1024,7 +1024,7 @@ int gpmc_cs_request(int cs, unsigned long size, unsigned long *base)
>   	struct resource *res = &gpmc->mem;
>   	int r = -1;
>   
> -	if (cs > gpmc_cs_num) {
> +	if (cs >= gpmc_cs_num) {
>   		pr_err("%s: requested chip-select is disabled\n", __func__);
>   		return -ENODEV;
>   	}
> 

cheers,
-roger

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
