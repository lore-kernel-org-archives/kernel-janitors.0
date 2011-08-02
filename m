From: Andrea Righi <arighi@develer.com>
Date: Tue, 02 Aug 2011 11:33:35 +0000
Subject: Re: [PATCH 1/11] kernel/kfifo.c: trivial: use BUG_ON
Message-Id: <20110802113335.GA4185@thinkpad>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk>
 <1312281304-11847-2-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-2-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Andrew Morton <akpm@linux-foundation.org>, trivial@kernel.org, kernel-janitors@vger.kernel.org, Stefani Seibold <stefani@seibold.net>, "Ira W. Snyder" <iws@ovro.caltech.edu>, linux-kernel@vger.kernel.org

On Tue, Aug 02, 2011 at 12:34:54PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use BUG_ON(x) rather than if(x) BUG();
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ identifier x; @@
> -if (x) BUG();
> +BUG_ON(x);
> 
> @@ identifier x; @@
> -if (!x) BUG();
> +BUG_ON(!x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 

The patch looks good. However, I think we should just get rid of the
BUG_ON() there. If nents is 0, setup_sgl_buf() would just returns 0 and
nothing critical will happen.

Also consider that in __kfifo_dma_in_prepare(), the equivalent of
__kfifo_dma_in_prepare_r() when recsize is 0, we don't check nents at
all.

-Andrea

> ---
>  kernel/kfifo.c |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff -u -p a/kernel/kfifo.c b/kernel/kfifo.c
> --- a/kernel/kfifo.c
> +++ b/kernel/kfifo.c
> @@ -562,8 +562,7 @@ EXPORT_SYMBOL(__kfifo_to_user_r);
>  unsigned int __kfifo_dma_in_prepare_r(struct __kfifo *fifo,
>  	struct scatterlist *sgl, int nents, unsigned int len, size_t recsize)
>  {
> -	if (!nents)
> -		BUG();
> +	BUG_ON(!nents);
>  
>  	len = __kfifo_max_r(len, recsize);
>  
> @@ -586,8 +585,7 @@ EXPORT_SYMBOL(__kfifo_dma_in_finish_r);
>  unsigned int __kfifo_dma_out_prepare_r(struct __kfifo *fifo,
>  	struct scatterlist *sgl, int nents, unsigned int len, size_t recsize)
>  {
> -	if (!nents)
> -		BUG();
> +	BUG_ON(!nents);
>  
>  	len = __kfifo_max_r(len, recsize);
>  
