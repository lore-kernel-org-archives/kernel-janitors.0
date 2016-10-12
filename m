From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Wed, 12 Oct 2016 09:20:41 +0000
Subject: Re: [patch] drm/amdgpu: potential NULL dereference in debugfs code
Message-Id: <0d178bc4-49e3-4073-2ccc-d0d196d6f5db@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012061730.GP12841@mwanda>
In-Reply-To: <20161012061730.GP12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>, Tom St Denis <tom.stdenis@amd.com>
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Junwei Zhang <Jerry.Zhang@amd.com>, Monk Liu <Monk.Liu@amd.com>

Am 12.10.2016 um 08:17 schrieb Dan Carpenter:
> debugfs_create_file() returns NULL on error, it only returns error
> pointers if debugfs isn't enabled in the config and we checked for that
> earlier so it can't happen.
>
> Fixes: 4f4824b55650 ('drm/amd/amdgpu: Convert ring debugfs entries to bin=
ary')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>.

>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_ring.c
> index 85aeb0a..8d16eaf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -371,8 +371,8 @@ static int amdgpu_debugfs_ring_init(struct amdgpu_dev=
ice *adev,
>   	ent =3D debugfs_create_file(name,
>   				  S_IFREG | S_IRUGO, root,
>   				  ring, &amdgpu_debugfs_ring_fops);
> -	if (IS_ERR(ent))
> -		return PTR_ERR(ent);
> +	if (!ent)
> +		return -ENOMEM;
>  =20
>   	i_size_write(ent->d_inode, ring->ring_size + 12);
>   	ring->ent =3D ent;


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
