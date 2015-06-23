From: =?windows-1252?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Date: Tue, 23 Jun 2015 11:56:09 +0000
Subject: Re: [patch -next] drm/radeon: missing break statement
Message-Id: <55894959.5050409@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150623115148.GA6302@mwanda>
In-Reply-To: <20150623115148.GA6302@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On 23.06.2015 13:51, Dan Carpenter wrote:
> There was a merge problem in linux-next 4598d330d29e ('Merge
> remote-tracking branch 'drm/drm-next'').  We need to add a break
> statement.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch, fortunately only an issue in drm-next.

Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

>
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon=
/radeon_kms.c
> index b4b457d..4a119c2 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -578,6 +578,7 @@ static int radeon_info_ioctl(struct drm_device *dev, =
void *data, struct drm_file
>   		break;
>   	case RADEON_INFO_VA_UNMAP_WORKING:
>   		*value =3D true;
> +		break;
>   	case RADEON_INFO_GPU_RESET_COUNTER:
>   		*value =3D atomic_read(&rdev->gpu_reset_counter);
>   		break;

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
