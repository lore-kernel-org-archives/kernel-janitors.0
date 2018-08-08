From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Date: Wed, 08 Aug 2018 21:43:02 +0000
Subject: Re: [PATCH] powerpc: fix size calculation using resource_size()
Message-Id: <a5411d3a-8c2c-0a4f-7e3f-baa473c34e92@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180808115724.gh5mbbi6twzqbqao@kili.mountain>
In-Reply-To: <20180808115724.gh5mbbi6twzqbqao@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jia Hongtao <B38951@freescale.com>
Cc: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh@kernel.org>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On 08/08/2018 04:57 AM, Dan Carpenter wrote:
> The problem is the the calculation should be "end - start + 1" but the
> plus one is missing in this calculation.
> 
> Fixes: 8626816e905e ("powerpc: add support for MPIC message register API")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis.  Not tested.

Looks sane to me.

Reviewed-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>

> 
> diff --git a/arch/powerpc/sysdev/mpic_msgr.c b/arch/powerpc/sysdev/mpic_msgr.c
> index eb69a5186243..280e964e1aa8 100644
> --- a/arch/powerpc/sysdev/mpic_msgr.c
> +++ b/arch/powerpc/sysdev/mpic_msgr.c
> @@ -196,7 +196,7 @@ static int mpic_msgr_probe(struct platform_device *dev)
> 
>  	/* IO map the message register block. */
>  	of_address_to_resource(np, 0, &rsrc);
> -	msgr_block_addr = ioremap(rsrc.start, rsrc.end - rsrc.start);
> +	msgr_block_addr = ioremap(rsrc.start, resource_size(&rsrc));
>  	if (!msgr_block_addr) {
>  		dev_err(&dev->dev, "Failed to iomap MPIC message registers");
>  		return -EFAULT;
> 

