From: John Garry <john.garry@huawei.com>
Date: Wed, 08 Aug 2018 14:16:57 +0000
Subject: Re: [PATCH] scsi: aic94xx: fix an error code in aic94xx_init()
Message-Id: <7b63e8da-2a3b-b375-08e0-784117843a93@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180808115640.at6qjutsykgexdt4@kili.mountain>
In-Reply-To: <20180808115640.at6qjutsykgexdt4@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 08/08/2018 12:56, Dan Carpenter wrote:
> We accidentally return success instead of -ENODEV on this error path.

Sorry to nitpick, but - as I see - the only way for 
sas_domain_attach_transport() to fail is if the kzalloc() in 
sas_attach_transport() fails, so should this be -ENOMEM? Other drivers 
return this error code for this scenario.

Thanks,
John

>
> Fixes: 2908d778ab3e ("[SCSI] aic94xx: new driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
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
> +		err = -ENODEV;
>  		goto out_destroy_caches;
> +	}
>
>  	err = pci_register_driver(&aic94xx_pci_driver);
>  	if (err)
>
>


