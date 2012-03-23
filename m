From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 23 Mar 2012 14:56:13 +0000
Subject: Re: [PATCH] staging: wlags49_h2: Replace kmalloc+memset by kzalloc and add error handling.
Message-Id: <20120323145613.GB11617@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120323095158.GB3181@mwanda>
In-Reply-To: <20120323095158.GB3181@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Mar 23, 2012 at 03:11:45PM +0530, santosh nayak wrote:
> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> Replace kmalloc+memset pair by kzalloc() in 'wl_wds_device_alloc()'.
> Add error handling to avoid null derefernce.
> 
> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
> ---
>  drivers/staging/wlags49_h2/wl_netdev.c |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/wlags49_h2/wl_netdev.c b/drivers/staging/wlags49_h2/wl_netdev.c
> index 9c16f54..426ba04 100644
> --- a/drivers/staging/wlags49_h2/wl_netdev.c
> +++ b/drivers/staging/wlags49_h2/wl_netdev.c
> @@ -1511,8 +1511,12 @@ void wl_wds_device_alloc( struct wl_private *lp )
>      for( count = 0; count < NUM_WDS_PORTS; count++ ) {
>          struct net_device *dev_wds = NULL;
>  
> -        dev_wds = kmalloc( sizeof( struct net_device ), GFP_KERNEL );
> -        memset( dev_wds, 0, sizeof( struct net_device ));
> +	dev_wds = kzalloc(sizeof(struct net_device), GFP_KERNEL);
> +	if (unlikely(!dev_wds)) {

NEVER use unlikely unless you are working on scheduler code, or
something else equally time critical.  So, take this into consideration,
and Dan's comments, and please redo this, I can't take it as-is.

thanks,

greg k-h
