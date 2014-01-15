From: walter harms <wharms@bfs.de>
Date: Wed, 15 Jan 2014 09:04:46 +0000
Subject: Re: [patch] Staging: vt6655-6: potential NULL dereference in hostap_disable_hostapd()
Message-Id: <52D64F2E.2020202@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107075543.GM21844@elgon.mountain>
In-Reply-To: <20131107075543.GM21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 07.11.2013 08:55, schrieb Dan Carpenter:
> We fixed this to use free_netdev() instead of kfree() but unfortunately
> free_netdev() doesn't accept NULL pointers.  Smatch complains about
> this, it's not something I discovered through testing.
> 
> Fixes: 3030d40b5036 ('staging: vt6655: use free_netdev instead of kfree')
> Fixes: 0a438d5b381e ('staging: vt6656: use free_netdev instead of kfree')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/vt6655/hostap.c b/drivers/staging/vt6655/hostap.c
> index aab0012..ab8b2ba 100644
> --- a/drivers/staging/vt6655/hostap.c
> +++ b/drivers/staging/vt6655/hostap.c
> @@ -143,7 +143,8 @@ static int hostap_disable_hostapd(PSDevice pDevice, int rtnl_locked)
>  		DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "%s: Netdevice %s unregistered\n",
>  			pDevice->dev->name, pDevice->apdev->name);
>  	}
> -	free_netdev(pDevice->apdev);
> +	if (pDevice->apdev)
> +		free_netdev(pDevice->apdev);


perhaps the better way is to fix free_netdev() to make it behave like kfree() and friends.

just my 2 cents,
 wh

>  	pDevice->apdev = NULL;
>  	pDevice->bEnable8021x = false;
>  	pDevice->bEnableHostWEP = false;
> diff --git a/drivers/staging/vt6656/hostap.c b/drivers/staging/vt6656/hostap.c
> index ae1676d..67ba48b 100644
> --- a/drivers/staging/vt6656/hostap.c
> +++ b/drivers/staging/vt6656/hostap.c
> @@ -133,7 +133,8 @@ static int hostap_disable_hostapd(struct vnt_private *pDevice, int rtnl_locked)
>              DBG_PRT(MSG_LEVEL_DEBUG, KERN_INFO "%s: Netdevice %s unregistered\n",
>  		       pDevice->dev->name, pDevice->apdev->name);
>  	}
> -	free_netdev(pDevice->apdev);
> +	if (pDevice->apdev)
> +		free_netdev(pDevice->apdev);
>  	pDevice->apdev = NULL;
>      pDevice->bEnable8021x = false;
>      pDevice->bEnableHostWEP = false;
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
