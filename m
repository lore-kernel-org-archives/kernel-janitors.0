From: Connor Kuehl <connor.kuehl@canonical.com>
Date: Thu, 03 Oct 2019 21:05:51 +0000
Subject: Re: [PATCH] staging: rtl8188eu: fix null dereference when kzalloc fails
Message-Id: <ac882530-4197-7813-ca24-49738eebb0c8@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190927214415.899-1-connor.kuehl@canonical.com>
 <20191001131122.GC22609@kadam>
In-Reply-To: <20191001131122.GC22609@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Larry.Finger@lwfinger.net

On 10/1/19 6:11 AM, Dan Carpenter wrote:
> 
> There is another one earlier in the function as well.
> 
> drivers/staging/rtl8188eu/os_dep/usb_intf.c
>     336
>     337          pnetdev = rtw_init_netdev(padapter);
>     338          if (!pnetdev)
>     339                  goto free_adapter;
>     340          SET_NETDEV_DEV(pnetdev, dvobj_to_dev(dvobj));
>     341          padapter = rtw_netdev_priv(pnetdev);
>     342
>     343          if (padapter->registrypriv.monitor_enable) {
>     344                  pmondev = rtl88eu_mon_init();
>     345                  if (!pmondev)
>     346                          netdev_warn(pnetdev, "Failed to initialize monitor interface");
> 
> goto free_adapter.
> 
>     347                  padapter->pmondev = pmondev;
>     348          }
>     349
>     350          padapter->HalData = kzalloc(sizeof(struct hal_data_8188e), GFP_KERNEL);
>     351          if (!padapter->HalData)
>     352                  DBG_88E("cant not alloc memory for HAL DATA\n");
>     353
> 
>>   	padapter->HalData = kzalloc(sizeof(struct hal_data_8188e), GFP_KERNEL);
>> -	if (!padapter->HalData)
>> -		DBG_88E("cant not alloc memory for HAL DATA\n");
>> +	if (!padapter->HalData) {
>> +		DBG_88E("Failed to allocate memory for HAL data\n");
> 
> Remove this debug printk.
> 
>> +		goto free_adapter;
>> +	}

Hi Dan,

Sorry for such a late response! By the time I saw the e-mail with your 
feedback I also saw another e-mail saying this patch was accepted into a 
staging-linus tree. I'll address your comments in a separate patch.

Thank you,

Connor
