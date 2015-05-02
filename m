From: walter harms <wharms@bfs.de>
Date: Sat, 02 May 2015 09:14:39 +0000
Subject: Re: [PATCH 19/20] staging: lustre: ptlrpc: sec_plain: remove unneeded null test before free
Message-Id: <5544957F.30009@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr> <1430509086-22132-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430509086-22132-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Oleg Drokin <oleg.drokin@intel.com>, kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org



Am 01.05.2015 21:37, schrieb Julia Lawall:
> Kfree can cope with a null argument, so drop null tests.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ expression ptr; @@
> 
> - if (ptr != NULL)
>   kfree(ptr);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/staging/lustre/lustre/ptlrpc/sec_plain.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c b/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c
> index 604e511..989cdcd 100644
> --- a/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c
> +++ b/drivers/staging/lustre/lustre/ptlrpc/sec_plain.c
> @@ -384,8 +384,7 @@ struct ptlrpc_cli_ctx *plain_sec_install_ctx(struct plain_sec *plsec)
>  	if (ctx) {
>  		atomic_inc(&ctx->cc_refcount);
>  
> -		if (ctx_new)
> -			kfree(ctx_new);
> +		kfree(ctx_new);
>  	} else if (ctx_new) {
>  		ctx = ctx_new;
>  

The error handling here is not obvious
the
OBD_ALLOC_PTR(ctx_new);
should have something like
if (!ctx_new)
	return NULL;


just my 2 cents
re,
 wh

> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
