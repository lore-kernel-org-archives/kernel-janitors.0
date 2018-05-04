From: Ajay Singh <ajay.kathat@microchip.com>
Date: Fri, 04 May 2018 04:56:08 +0000
Subject: Re: [PATCH] staging: wilc1000: allocate less memory
Message-Id: <20180504101408.261450a5@ajaysk-VirtualBox>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180503105655.GC5315@mwanda>
In-Reply-To: <20180503105655.GC5315@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On Thu, 3 May 2018 13:56:55 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We should be allocating space for hidden_network_info structs.  They
> are slightly smaller than hidden_network structs.  This bug doesn't
> cause a runtime issue beyond the very small ammount of extra memory
> used.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Ajay Singh <ajay.kathat@microchip.com>

Thanks for submitting the changes by using correct structure size
for memory allocation.

> 
> diff --git a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
> b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c index
> 3ca0c97b0627..92322d6f061d 100644 ---
> a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c +++
> b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c @@ -581,8 +581,8
> @@ wilc_wfi_cfg_alloc_fill_ssid(struct cfg80211_scan_request
> *request, int i; int slot_id = 0;
>  
> -	ntwk->net_info = kcalloc(request->n_ssids,
> -				 sizeof(struct hidden_network),
> GFP_KERNEL);
> +	ntwk->net_info = kcalloc(request->n_ssids,
> sizeof(*ntwk->net_info),
> +				 GFP_KERNEL);
>  	if (!ntwk->net_info)
>  		goto out;
>  
> _______________________________________________
> devel mailing list
> devel@linuxdriverproject.org
> http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

