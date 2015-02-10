From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Tue, 10 Feb 2015 13:55:27 +0000
Subject: Re: [PATCH 1/1] staging: unisys: Remove allocation from declaration line
Message-Id: <20150210134327.GA15535@sudip-PC>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150210130214.GA18429@sloth>
In-Reply-To: <20150210130214.GA18429@sloth>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Benjamin Romer <benjamin.romer@unisys.com>, David Kershner <david.kershner@unisys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, sparmaintainer@unisys.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Tue, Feb 10, 2015 at 02:02:14PM +0100, Quentin Lambert wrote:
> This patch removes allocation from declaration line because
> people are known to gloss over declarations.
> 
> Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
> ---
>  drivers/staging/unisys/visorchipset/visorchipset_main.c | 6 +++---
>  drivers/staging/unisys/visorutil/charqueue.c            | 3 ++-
>  drivers/staging/unisys/visorutil/memregion_direct.c     | 5 +++--
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/unisys/visorchipset/visorchipset_main.c b/drivers/staging/unisys/visorchipset/visorchipset_main.c
> index 82e259d..a6c6bb7 100644
> --- a/drivers/staging/unisys/visorchipset/visorchipset_main.c
> +++ b/drivers/staging/unisys/visorchipset/visorchipset_main.c
> @@ -1604,9 +1604,9 @@ parahotplug_next_expiration(void)
>  static struct parahotplug_request *
>  parahotplug_request_create(struct controlvm_message *msg)
>  {
> -	struct parahotplug_request *req > -	    kmalloc(sizeof(struct parahotplug_request),
> -		    GFP_KERNEL|__GFP_NORETRY);
> +	struct parahotplug_request *req;
> +
> +	req = kmalloc(sizeof(struct parahotplug_request), GFP_KERNEL|__GFP_NORETRY);
if you make it as:
	req = kmalloc(sizeof(*req), GFP_KERNEL|__GFP_NORETRY);
then this will not give you checkpatch warning of line over 80 char.

regards
sudip

>  	if (req = NULL)
>  		return NULL;
<snip>	
>  		return NULL;
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
