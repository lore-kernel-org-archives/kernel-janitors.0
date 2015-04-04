From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 04 Apr 2015 16:07:12 +0000
Subject: Re: [PATCH 2/2] staging: emxx_udc: test returned value
Message-Id: <20150404160712.GA19278@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428159570-19467-1-git-send-email-Julia.Lawall@lip6.fr>
 <1428159570-19467-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428159570-19467-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sat, Apr 04, 2015 at 04:59:30PM +0200, Julia Lawall wrote:
> Put NULL test on the result of the previous call instead on one of its
> arguments.  A simplified version of the semantic match that finds this
> problem is as follows (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> r@
> expression *e1;
> expression *e2;
> identifier f;
> statement S1,S2;
> @@
> 
> e1 = f(...,e2,...);
> (
> if (e1 = NULL || ...) S1 else S2
> |
> *if (e2 = NULL || ...) S1 else S2
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/staging/emxx_udc/emxx_udc.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
> index fbf82bc..7de1e9e 100644
> --- a/drivers/staging/emxx_udc/emxx_udc.c
> +++ b/drivers/staging/emxx_udc/emxx_udc.c
> @@ -2998,7 +2998,7 @@ static void  nbu2ss_ep_fifo_flush(struct usb_ep *_ep)
>  	}
>  
>  	ep = container_of(_ep, struct nbu2ss_ep, ep);
> -	if (!_ep) {
> +	if (!ep) {

This is actually even worse, container_of() can't return NULL.  Or if it
does, something is really wrong (it can only happen if the field happens
to be the first field in the structure and the original pointer was
NULL).  So I would say that all tests for container_of (and
functions/macros that are just wrappers around container_of()) can just
be deleted as they will never be triggered.

Not to say that this patch is wrong at all, I'll go apply it, and you
should add it to the lists of tests in the kernel source, but you should
also consider making a test to catch container_of() results.

Hm, now that I know coccinelle, I guess I should be able to do this :)

thanks,

greg k-h
