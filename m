From: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>
Date: Wed, 04 Nov 2015 14:10:32 +0000
Subject: Re: [patch] drm/amdgpu: cleanup on error in amdgpu_cs_ioctl()
Message-Id: <563A11D8.20804@vodafone.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151104132509.GB20966@mwanda>
In-Reply-To: <20151104132509.GB20966@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, Chunming Zhou <david1.zhou@amd.com>
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, "monk.liu" <monk.liu@amd.com>

On 04.11.2015 14:25, Dan Carpenter wrote:
> We recently changed the locking in this function and now there is a
> missing unlock on error.  Also there are some other resources that we
> should probably release as well...
>
> Fixes: f48b2659f521 ('drm/amdgpu: fix the broken vm->mutex V2')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Yeah indeed, thanks for catching this.

Patch is Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

> ---
> I'm not terribly familiar with this code.  Please review this one a bit
> carefully.
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 27ef528..dfc4d02 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -876,8 +876,10 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *da=
ta, struct drm_file *filp)
>   		struct amdgpu_job *job;
>   		struct amdgpu_ring * ring =3D  parser->ibs->ring;
>   		job =3D kzalloc(sizeof(struct amdgpu_job), GFP_KERNEL);
> -		if (!job)
> -			return -ENOMEM;
> +		if (!job) {
> +			r =3D -ENOMEM;
> +			goto out;
> +		}
>   		job->base.sched =3D &ring->sched;
>   		job->base.s_entity =3D &parser->ctx->rings[ring->idx].entity;
>   		job->adev =3D parser->adev;

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
