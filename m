From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Mon, 23 Nov 2009 18:30:26 +0000
Subject: Re: [PATCH 5/8] drivers/usb/host/xhci-mem.c: introduce missing
Message-Id: <20091123183026.GB6412@xanatos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911211251210.23681@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911211251210.23681@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Acked-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>

Please CC me on xHCI code cleanups.  Thanks for catching this!

On Sat, Nov 21, 2009 at 12:51:47PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Error handling code following a kzalloc should free the allocated data.
> 
> The semantic match that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @r exists@
> local idexpression x;
> statement S;
> expression E;
> identifier f,f1,l;
> position p1,p2;
> expression *ptr != NULL;
> @@
> 
> x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
> ...
> if (x = NULL) S
> <... when != x
>      when != if (...) { <+...x...+> }
> (
> x->f1 = E
> |
>  (x->f1 = NULL || ...)
> |
>  f(...,x->f1,...)
> )
> ...>
> (
>  return \(0\|<+...x...+>\|ptr\);
> |
>  return@p2 ...;
> )
> 
> @script:python@
> p1 << r.p1;
> p2 << r.p2;
> @@
> 
> print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
>  drivers/usb/host/xhci-mem.c         |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index fd05247..33f8157 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -779,14 +779,17 @@ struct xhci_command *xhci_alloc_command(struct xhci_hcd *xhci,
>  
>  	command->in_ctx >  		xhci_alloc_container_ctx(xhci, XHCI_CTX_TYPE_INPUT, mem_flags);
> -	if (!command->in_ctx)
> +	if (!command->in_ctx) {
> +		kfree(command);
>  		return NULL;
> +	}
>  
>  	if (allocate_completion) {
>  		command->completion >  			kzalloc(sizeof(struct completion), mem_flags);
>  		if (!command->completion) {
>  			xhci_free_container_ctx(xhci, command->in_ctx);
> +			kfree(command);
>  			return NULL;
>  		}
>  		init_completion(command->completion);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
