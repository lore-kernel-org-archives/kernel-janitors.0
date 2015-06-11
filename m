From: =?windows-1252?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Date: Thu, 11 Jun 2015 09:26:04 +0000
Subject: Re: [patch] drm/amdgpu: remove an unnecessary condition
Message-Id: <5579542C.1060003@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150611081924.GA27090@mwanda>
In-Reply-To: <20150611081924.GA27090@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>
Cc: =?windows-1252?Q?Marek_Ol=9A=E1k?= <marek.olsak@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, yanyang1 <young.yang@amd.com>, Ken Wang <Qingqing.Wang@amd.com>

On 11.06.2015 10:19, Dan Carpenter wrote:
> We already checked "if (r)" so there is no need to check again.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hi Dan,

thanks for taking a look into this. This patch and the other two you=20
send today are Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

That code was branched of from Radeon it is possible that the same=20
changes apply there as well. Since it looks like you created those=20
patches at least partially automatically could you run your tool on the=20
Radeon code once more as well?

Thanks in advance,
Christian.

>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_kms.c
> index 5533434..b7d0425 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -111,12 +111,9 @@ int amdgpu_driver_load_kms(struct drm_device *dev, u=
nsigned long flags)
>   	/* Call ACPI methods: require modeset init
>   	 * but failure is not fatal
>   	 */
> -	if (!r) {
> -		acpi_status =3D amdgpu_acpi_init(adev);
> -		if (acpi_status)
> -		dev_dbg(&dev->pdev->dev,
> -				"Error during ACPI methods call\n");
> -	}
> +	acpi_status =3D amdgpu_acpi_init(adev);
> +	if (acpi_status)
> +		dev_dbg(&dev->pdev->dev, "Error during ACPI methods call\n");
>  =20
>   	if (amdgpu_device_is_px(dev)) {
>   		pm_runtime_use_autosuspend(dev->dev);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
