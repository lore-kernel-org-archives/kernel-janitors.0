From: Greg KH <greg@kroah.com>
Date: Tue, 21 Sep 2010 00:07:47 +0000
Subject: Re: [PATCH] Staging: wlan-ng: p80211netdev.c cleanup
Message-Id: <20100921000747.GA15932@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284834652-26171-1-git-send-email-lkml@Think-Future.com>
In-Reply-To: <1284834652-26171-1-git-send-email-lkml@Think-Future.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nils Radtke <lkml@Think-Future.com>
Cc: gregkh@suse.de, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sat, Sep 18, 2010 at 08:30:52PM +0200, Nils Radtke wrote:
> Effected preliminary cleanup lead by the idea of kerneljanitor.org .
> As recommended I'm asking for approval of the location of cleanup
> and the manner it happened to know I'm heading in the right
> direction.
> 
> Compiles. Not tested.
> 
> Signed-off-by: Nils Radtke <lkml@Think-Future.com>
> ---
>  drivers/staging/wlan-ng/p80211netdev.c |   50 +++++++++++++++++++-------------
>  1 files changed, 30 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-ng/p80211netdev.c
> index aa1792c..8104e11 100644
> --- a/drivers/staging/wlan-ng/p80211netdev.c
> +++ b/drivers/staging/wlan-ng/p80211netdev.c
> @@ -176,25 +176,30 @@ static struct net_device_stats *p80211knetdev_get_stats(netdevice_t * netdev)
>  ----------------------------------------------------------------*/
>  static int p80211knetdev_open(netdevice_t *netdev)
>  {
> -	int result = 0;		/* success */
> +	int ret = 0;

Why rename the variable if you don't have to?

>  	wlandevice_t *wlandev = netdev->ml_priv;
>  
>  	/* Check to make sure the MSD is running */
> -	if (wlandev->msdstate != WLAN_MSD_RUNNING)
> -		return -ENODEV;
> +	if (wlandev->msdstate != WLAN_MSD_RUNNING) {
> +		ret = -ENODEV;
> +		goto end;
> +	}
>  
>  	/* Tell the MSD to open */
> -	if (wlandev->open != NULL) {
> -		result = wlandev->open(wlandev);
> -		if (result = 0) {
> -			netif_start_queue(wlandev->netdev);
> -			wlandev->state = WLAN_DEVICE_OPEN;
> -		}
> -	} else {
> -		result = -EAGAIN;
> +	if (wlandev->open = NULL) {
> +		printk(KERN_ERR "Sorry, got wlandev->open = NULL.\n");
> +		ret = -EAGAIN;
> +		goto end;

Why are you adding new printk() calls?  Please use dev_err() if you
really want to do this.

>  	}
>  
> -	return result;
> +	ret = wlandev->open(wlandev);
> +	if (ret) {
> +		netif_start_queue(wlandev->netdev);
> +		wlandev->state = WLAN_DEVICE_OPEN;
> +	}
> +
> +end:
> +	return ret;

Please clean up properly for errors.

Same goes for other parts of this patch, care to redo it?

thanks,

greg k-h
