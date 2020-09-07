From: John Garry <john.garry@huawei.com>
Date: Mon, 07 Sep 2020 08:54:51 +0000
Subject: Re: [PATCH] scsi: libsas: Fix error path in sas_notify_lldd_dev_found()
Message-Id: <4ef45b15-34fd-80e9-1adb-53044ca9fa84@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200905125836.GF183976@mwanda>
In-Reply-To: <20200905125836.GF183976@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jason Yan <yanaijie@huawei.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/09/2020 13:58, Dan Carpenter wrote:
> In sas_notify_lldd_dev_found(), if we can't find a device, 

nit: the callback is for the LLDD is to allocate resources, device 
context etc., for that domain_device, and not find the device. The 
device has been found at this point.

 > then it seems
> like the wrong thing to mark the device as found and to increment the
> reference count.  None of the callers ever drop the reference in that
> situation.
> 
> Fixes: 735f7d2fedf5 ("[SCSI] libsas: fix domain_device leak")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/scsi/libsas/sas_discover.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/libsas/sas_discover.c b/drivers/scsi/libsas/sas_discover.c
> index cd7c7d269f6f..d0f9e90e3279 100644
> --- a/drivers/scsi/libsas/sas_discover.c
> +++ b/drivers/scsi/libsas/sas_discover.c
> @@ -182,10 +182,11 @@ int sas_notify_lldd_dev_found(struct domain_device *dev)
>   		pr_warn("driver on host %s cannot handle device %016llx, error:%d\n",
>   			dev_name(sas_ha->dev),
>   			SAS_ADDR(dev->sas_addr), res);
> +		return res;
>   	}
>   	set_bit(SAS_DEV_FOUND, &dev->state);
>   	kref_get(&dev->kref);
> -	return res;
> +	return 0;

This looks ok.

>   }

Thanks,
John

>   
>   
> 
