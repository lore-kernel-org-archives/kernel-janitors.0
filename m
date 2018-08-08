From: John Garry <john.garry@huawei.com>
Date: Wed, 08 Aug 2018 16:07:58 +0000
Subject: Re: [PATCH v2] scsi: aic94xx: fix an error code in aic94xx_init()
Message-Id: <e25f55e8-1e64-b367-0d58-a425fd44bb78@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180808142909.lzdbwxxqt5gwzrzl@kili.mountain>
In-Reply-To: <20180808142909.lzdbwxxqt5gwzrzl@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 08/08/2018 15:29, Dan Carpenter wrote:
> We accidentally return success instead of -ENOMEM on this error path.
>
> Fixes: 2908d778ab3e ("[SCSI] aic94xx: new driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

thanks

Reviewed-by: John Garry <john.garry@huawei.com>

> ---
> v2: return -ENOMEM instead of -ENODEV
>
> diff --git a/drivers/scsi/aic94xx/aic94xx_init.c b/drivers/scsi/aic94xx/aic94xx_init.c
> index 80e5b283fd81..cb8191afc1dc 100644
> --- a/drivers/scsi/aic94xx/aic94xx_init.c
> +++ b/drivers/scsi/aic94xx/aic94xx_init.c
> @@ -1030,8 +1030,10 @@ static int __init aic94xx_init(void)
>
>  	aic94xx_transport_template >  		sas_domain_attach_transport(&aic94xx_transport_functions);
> -	if (!aic94xx_transport_template)
> +	if (!aic94xx_transport_template) {
> +		err = -ENOMEM;
>  		goto out_destroy_caches;
> +	}
>
>  	err = pci_register_driver(&aic94xx_pci_driver);
>  	if (err)
>
> .
>


