From: Samuel Ortiz <sameo@openedhand.com>
Date: Fri, 06 Feb 2009 14:05:06 +0000
Subject: Re: [PATCH] drivers/mfd: Adjust NULL test
Message-Id: <20090206140505.GH3341@sortiz.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812211907400.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812211907400.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Dec 21, 2008 at 07:08:09PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Since ei is already known to be non-NULL, I assume that what was intended
> was to test the result of kzalloc.
Makes sense, thanks. Applied to my for-linus branch.

Cheers,
Samuel.

 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> expression E,E1;
> identifier f,fld,fld1;
> statement S1,S2;
> @@
> 
> E->fld = f(...);
> ... when != E = E1
>     when != E->fld1 = E1
> if (
> -   E
> +   E->fld
>            = NULL) S1 else S2
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/mfd/htc-egpio.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -u -p a/drivers/mfd/htc-egpio.c b/drivers/mfd/htc-egpio.c
> --- a/drivers/mfd/htc-egpio.c
> +++ b/drivers/mfd/htc-egpio.c
> @@ -307,7 +307,7 @@ static int __init egpio_probe(struct pla
>  
>  	ei->nchips = pdata->num_chips;
>  	ei->chip = kzalloc(sizeof(struct egpio_chip) * ei->nchips, GFP_KERNEL);
> -	if (!ei) {
> +	if (!ei->chip) {
>  		ret = -ENOMEM;
>  		goto fail;
>  	}

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
