From: Jason Yan <yanaijie@huawei.com>
Date: Mon, 07 Sep 2020 01:37:05 +0000
Subject: Re: [PATCH] scsi: libsas: Fix error path in sas_notify_lldd_dev_found()
Message-Id: <c2e1730d-fe83-7c6a-6011-4bc6c4848f57@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200905125836.GF183976@mwanda>
In-Reply-To: <20200905125836.GF183976@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, John Garry <john.garry@huawei.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


=D4=DA 2020/9/5 20:58, Dan Carpenter =D0=B4=B5=C0:
> In sas_notify_lldd_dev_found(), if we can't find a device, then it seems
> like the wrong thing to mark the device as found and to increment the
> reference count.  None of the callers ever drop the reference in that
> situation.
>=20
> Fixes: 735f7d2fedf5 ("[SCSI] libsas: fix domain_device leak")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/scsi/libsas/sas_discover.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/scsi/libsas/sas_discover.c b/drivers/scsi/libsas/sas=
_discover.c
> index cd7c7d269f6f..d0f9e90e3279 100644
> --- a/drivers/scsi/libsas/sas_discover.c
> +++ b/drivers/scsi/libsas/sas_discover.c
> @@ -182,10 +182,11 @@ int sas_notify_lldd_dev_found(struct domain_device =
*dev)
>   		pr_warn("driver on host %s cannot handle device %016llx, error:%d\n",
>   			dev_name(sas_ha->dev),
>   			SAS_ADDR(dev->sas_addr), res);
> +		return res;
>   	}
>   	set_bit(SAS_DEV_FOUND, &dev->state);
>   	kref_get(&dev->kref);
> -	return res;
> +	return 0;
>   }
>  =20
>  =20
>=20

Hi Dan, thanks for finding this,

Reviewed-by: Jason Yan <yanaijie@huawei.com>
