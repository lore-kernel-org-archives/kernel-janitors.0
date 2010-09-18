From: Dan Carpenter <error27@gmail.com>
Date: Sat, 18 Sep 2010 20:41:12 +0000
Subject: Re: [PATCH] Staging: wlan-ng: p80211netdev.c cleanup
Message-Id: <20100918204112.GA6236@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284834652-26171-1-git-send-email-lkml@Think-Future.com>
In-Reply-To: <1284834652-26171-1-git-send-email-lkml@Think-Future.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nils Radtke <lkml@Think-Future.com>
Cc: gregkh@suse.de, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sat, Sep 18, 2010 at 08:30:52PM +0200, Nils Radtke wrote:
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

If it was new code then I also would have prefered "ret" I suppose, but
really it's not a good idea to rename things for no reason.

>  	wlandevice_t *wlandev = netdev->ml_priv;
>  
>  	/* Check to make sure the MSD is running */
> -	if (wlandev->msdstate != WLAN_MSD_RUNNING)
> -		return -ENODEV;
> +	if (wlandev->msdstate != WLAN_MSD_RUNNING) {
> +		ret = -ENODEV;
> +		goto end;
> +	}

It's better to just return directly.  This code makes me wonder what
happens after I goto end, but actually nothing happens.  So it's
a little annoying.

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

This printk is not needed.  I haven't looked at this code, but if the
user can trigger this error message then it can be used to flood
/var/log/messages and cause a denial of service attack.

>  
> -	return result;
> +	ret = wlandev->open(wlandev);
> +	if (ret) {

This test is reversed (we return zero on success).  It should be:
	if (ret)
		return ret;
And then the other stuff can be pulled in an indent level.

> +		netif_start_queue(wlandev->netdev);
> +		wlandev->state = WLAN_DEVICE_OPEN;
> +	}
> +
> +end:
> +	return ret;
>  }

The other function had many of the same issues.

The change log for this should have been something like:
	This is a cleanup of p80211knetdev_open().  I rearranged the
	to unify all the return paths so there was just one return
	statement.  I also changed the if statements so I could pull 
	the code in one indent level and simplify things a bit.  And I
	added a couple printk() to the let the user know about errors.

(Except that adding printk()s is a functional change so it goes into a
separate patch instead of hidden inside a "cleanup" patch.  But you get
the idea).

It's always dangerous writing patches when you can't test them. Most of
my patches are one liners because and when people ask me to rewrite them
in a more complicated way I tell them I don't feel comfortable doing
that because I can't test it.

Really though my advice is to start out by fixing bugs instead of
focusing on cleanup.  I've fixed many of the interesting buffer
overflows in main kernel but if you run smatch on staging then there are
a bunch remaining.  Even reading through the false positives is good
practise for reading code.

Here's one the wlan-ng driver that you were working on:

drivers/staging/wlan-ng/prism2fw.c +594 mkpdrlist(9)
	error: buffer overflow 'pda16' 512 <= 512
drivers/staging/wlan-ng/prism2fw.c +634 mkpdrlist(49)
	error: buffer overflow 'pda16' 512 <= 512

   592          curroff = 0;
   593          while (curroff < (HFA384x_PDA_LEN_MAX / 2) &&
                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	We check that the array offset is within bounds here

   594                 le16_to_cpu(pda16[curroff + 1]) != HFA384x_PDR_END_OF_PDA) {
                                         ^^^^^^^^^^^
	and then we add one here which puts us out of bounds.

   595                  pda->rec[pda->nrec] = (hfa384x_pdrec_t *) &(pda16[curroff]);
   596  

Fixing overflows is way more interesting than cleanup patches.  So don't
resend this patch.  The original code works and it's not even that ugly.
You are a true hacker and have more awesome things to do.  That's my
advice to newbie hackers.

regards,
dan carpenter

