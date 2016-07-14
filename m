From: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 14 Jul 2016 21:31:34 +0000
Subject: Re: [patch] mtd: nand: omap2: Cleanup a curly brace issue
Message-Id: <20160714213134.GA108554@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160714212608.GA10856@mwanda>
In-Reply-To: <20160714212608.GA10856@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Teresa Remmet <t.remmet@phytec.de>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

On Fri, Jul 15, 2016 at 12:26:08AM +0300, Dan Carpenter wrote:
> It doesn't affect runtime, but curly braces were obviously intended.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, but you're just a tad late ;)

http://patchwork.ozlabs.org/patch/648283/

Nice to point out that technically, the behavior doesn't really change
though.

Brian

> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index a36ad3d..ab7c340 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1655,10 +1655,11 @@ static int omap_get_dt_info(struct device *dev, struct omap_nand_info *info)
>  
>  	/* detect availability of ELM module. Won't be present pre-OMAP4 */
>  	info->elm_of_node = of_parse_phandle(child, "ti,elm-id", 0);
> -	if (!info->elm_of_node)
> +	if (!info->elm_of_node) {
>  		info->elm_of_node = of_parse_phandle(child, "elm_id", 0);
>  		if (!info->elm_of_node)
>  			dev_dbg(dev, "ti,elm-id not in DT\n");
> +	}
>  
>  	/* select ecc-scheme for NAND */
>  	if (of_property_read_string(child, "ti,nand-ecc-opt", &s)) {
