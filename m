From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 Oct 2019 13:11:22 +0000
Subject: Re: [PATCH] staging: rtl8188eu: fix null dereference when kzalloc fails
Message-Id: <20191001131122.GC22609@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190927214415.899-1-connor.kuehl@canonical.com>
In-Reply-To: <20190927214415.899-1-connor.kuehl@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Connor Kuehl <connor.kuehl@canonical.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Larry.Finger@lwfinger.net

On Fri, Sep 27, 2019 at 02:44:15PM -0700, Connor Kuehl wrote:
> If kzalloc() returns NULL, the error path doesn't stop the flow of
> control from entering rtw_hal_read_chip_version() which dereferences the
> null pointer. Fix this by adding a 'goto' to the error path to more
> gracefully handle the issue and avoid proceeding with initialization
> steps that we're no longer prepared to handle.
> 
> Also update the debug message to be more consistent with the other debug
> messages in this function.
> 
> Addresses-Coverity: ("Dereference after null check")
> 
> Signed-off-by: Connor Kuehl <connor.kuehl@canonical.com>
> ---
>  drivers/staging/rtl8188eu/os_dep/usb_intf.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
> index 664d93a7f90d..4fac9dca798e 100644
> --- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
> @@ -348,8 +348,10 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
>  	}
>  

There is another one earlier in the function as well.

drivers/staging/rtl8188eu/os_dep/usb_intf.c
   336  
   337          pnetdev = rtw_init_netdev(padapter);
   338          if (!pnetdev)
   339                  goto free_adapter;
   340          SET_NETDEV_DEV(pnetdev, dvobj_to_dev(dvobj));
   341          padapter = rtw_netdev_priv(pnetdev);
   342  
   343          if (padapter->registrypriv.monitor_enable) {
   344                  pmondev = rtl88eu_mon_init();
   345                  if (!pmondev)
   346                          netdev_warn(pnetdev, "Failed to initialize monitor interface");

goto free_adapter.

   347                  padapter->pmondev = pmondev;
   348          }
   349  
   350          padapter->HalData = kzalloc(sizeof(struct hal_data_8188e), GFP_KERNEL);
   351          if (!padapter->HalData)
   352                  DBG_88E("cant not alloc memory for HAL DATA\n");
   353  

>  	padapter->HalData = kzalloc(sizeof(struct hal_data_8188e), GFP_KERNEL);
> -	if (!padapter->HalData)
> -		DBG_88E("cant not alloc memory for HAL DATA\n");
> +	if (!padapter->HalData) {
> +		DBG_88E("Failed to allocate memory for HAL data\n");

Remove this debug printk.

> +		goto free_adapter;
> +	}


regards,
dan carpenter
