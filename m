From: =?ISO-8859-1?Q?Christian_K=F6nig?= <deathsimple@vodafone.de>
Date: Fri, 20 Jul 2012 13:45:28 +0000
Subject: Re: [patch] drm/radeon: check for allocation failure in radeon_ring_backup()
Message-Id: <500960F8.6060906@vodafone.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120720111700.GB22245@elgon.mountain>
In-Reply-To: <20120720111700.GB22245@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, =?ISO-8859-1?Q?Michel_D=E4nz?= =?ISO-8859-1?Q?er?= <michel.daenzer@amd.com>, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>

On 20.07.2012 13:17, Dan Carpenter wrote:
> Static checkers complain if this we don't check for allocation failure.
> Also we can use the new kmalloc_array() function here as a cleanup.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
What's the benefit of using kmalloc_array instead of just kmalloc?

Anyway it's:

Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

>
> diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeo=
n/radeon_ring.c
> index 75cbe46..5a0ef24 100644
> --- a/drivers/gpu/drm/radeon/radeon_ring.c
> +++ b/drivers/gpu/drm/radeon/radeon_ring.c
> @@ -402,7 +402,11 @@ unsigned radeon_ring_backup(struct radeon_device *rd=
ev, struct radeon_ring *ring
>   	}
>  =20
>   	/* and then save the content of the ring */
> -	*data =3D kmalloc(size * 4, GFP_KERNEL);
> +	*data =3D kmalloc_array(size, sizeof(uint32_t), GFP_KERNEL);
> +	if (!*data) {
> +		mutex_unlock(&rdev->ring_lock);
> +		return 0;
> +	}
>   	for (i =3D 0; i < size; ++i) {
>   		(*data)[i] =3D ring->ring[ptr++];
>   		ptr &=3D ring->ptr_mask;
>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
