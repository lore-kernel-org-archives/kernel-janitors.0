From: Ben Dooks <ben-linux@fluff.org>
Date: Mon, 19 Oct 2009 11:25:51 +0000
Subject: Re: [PATCH 13/14] arch/arm/plat-s3c24xx: Move dereference after
Message-Id: <20091019112551.GA13389@fluff.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0910170842310.9213@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0910170842310.9213@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Sat, Oct 17, 2009 at 08:42:49AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> If the NULL test on buf is needed, then the dereference should be after the
> NULL test.
> 
> A simplified version of the semantic match that detects this problem is as
> follows (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @match exists@
> expression x, E;
> identifier fld;
> @@
> 
> * x->fld
>   ... when != \(x = E\|&x\)
> * x = NULL
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

I'll apply it to next-s3c24xx-fixes unless someone else wants to
pick it up for inclusion.
 
> ---
>  arch/arm/plat-s3c24xx/dma.c         |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.c
> index 196b191..f046f8c 100644
> --- a/arch/arm/plat-s3c24xx/dma.c
> +++ b/arch/arm/plat-s3c24xx/dma.c
> @@ -208,14 +208,14 @@ s3c2410_dma_loadbuffer(struct s3c2410_dma_chan *chan,
>  {
>  	unsigned long reload;
>  
> -	pr_debug("s3c2410_chan_loadbuffer: loading buff %p (0x%08lx,0x%06x)\n",
> -		 buf, (unsigned long)buf->data, buf->size);
> -
>  	if (buf = NULL) {
>  		dmawarn("buffer is NULL\n");
>  		return -EINVAL;
>  	}
>  
> +	pr_debug("s3c2410_chan_loadbuffer: loading buff %p (0x%08lx,0x%06x)\n",
> +		 buf, (unsigned long)buf->data, buf->size);
> +
>  	/* check the state of the channel before we do anything */
>  
>  	if (chan->load_state = S3C2410_DMALOAD_1LOADED) {
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
