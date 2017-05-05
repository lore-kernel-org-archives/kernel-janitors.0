From: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
Date: Fri, 05 May 2017 15:29:46 +0000
Subject: Re: [PATCH] cxl: Unlock on error in probe
Message-Id: <88932312-cbb5-40b0-da84-430535314389@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170505053458.csrwd2kjber44r4o@mwanda>
In-Reply-To: <20170505053458.csrwd2kjber44r4o@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Ian Munsie <imunsie@au1.ibm.com>, Christophe Lombard <clombard@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org



Le 05/05/2017 =E0 07:34, Dan Carpenter a =E9crit :
> We should unlock if get_cxl_adapter() fails.
>
> Fixes: 594ff7d067ca ("cxl: Support to flash a new image on the adapter fr=
om a guest")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Acked-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>

Thanks!

   Fred



> diff --git a/drivers/misc/cxl/flash.c b/drivers/misc/cxl/flash.c
> index 7c61c70ba3f6..37475abea3e6 100644
> --- a/drivers/misc/cxl/flash.c
> +++ b/drivers/misc/cxl/flash.c
> @@ -401,8 +401,10 @@ static int device_open(struct inode *inode, struct f=
ile *file)
>  	if (down_interruptible(&sem) !=3D 0)
>  		return -EPERM;
>
> -	if (!(adapter =3D get_cxl_adapter(adapter_num)))
> -		return -ENODEV;
> +	if (!(adapter =3D get_cxl_adapter(adapter_num))) {
> +		rc =3D -ENODEV;
> +		goto err_unlock;
> +	}
>
>  	file->private_data =3D adapter;
>  	continue_token =3D 0;
> @@ -446,6 +448,8 @@ static int device_open(struct inode *inode, struct fi=
le *file)
>  		free_page((unsigned long) le);
>  err:
>  	put_device(&adapter->dev);
> +err_unlock:
> +	up(&sem);
>
>  	return rc;
>  }
>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
