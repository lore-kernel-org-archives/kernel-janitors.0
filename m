From: Daniel Mack <daniel@caiaq.de>
Date: Tue, 29 Jun 2010 10:39:53 +0000
Subject: Re: [PATCH 02/25] n2-drv: remove casts from void*
Message-Id: <20100629103953.GR10432@buzzloop.caiaq.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277806502-30772-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1277806502-30772-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.hengli.com.au>, Grant Likely <grant.likely@secretlab.ca>, Sean MacLennan <smaclennan@pikatech.com>, Jiri Kosina <jkosina@suse.cz>, linux-kernel@vger.kernel.org

On Tue, Jun 29, 2010 at 02:15:01PM +0400, Kulikov Vasiliy wrote:
> Remove unnesessary casts from void*.

I have no idea how I made it to this list of recipients, but the change
looks sane to me :)


Daniel


> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/char/hw_random/n2-drv.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/char/hw_random/n2-drv.c b/drivers/char/hw_random/n2-drv.c
> index 0f9cbf1..101d5f2 100644
> --- a/drivers/char/hw_random/n2-drv.c
> +++ b/drivers/char/hw_random/n2-drv.c
> @@ -387,7 +387,7 @@ static int n2rng_init_control(struct n2rng *np)
>  
>  static int n2rng_data_read(struct hwrng *rng, u32 *data)
>  {
> -	struct n2rng *np = (struct n2rng *) rng->priv;
> +	struct n2rng *np = rng->priv;
>  	unsigned long ra = __pa(&np->test_data);
>  	int len;
>  
> -- 
> 1.7.0.4
> 
