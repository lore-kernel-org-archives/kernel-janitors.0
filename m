From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Wed, 23 Aug 2017 08:39:14 +0000
Subject: Re: [PATCH] drm/amdgpu: check memory allocation failure
Message-Id: <9a4b653f-6445-f8d3-70c9-91ca9b059839@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170823055236.25451-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170823055236.25451-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, alexander.deucher@amd.com, airlied@linux.ie, Monk.Liu@amd.com, David1.Zhou@amd.com, AlexBin.Xie@amd.com, Jerry.Zhang@amd.com, airlied@redhat.com, marek.olsak@amd.com, john@fastquake.com, andresx7@gmail.com, ray.huang@amd.com
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org

Am 23.08.2017 um 07:52 schrieb Christophe JAILLET:
> Check memory allocation failure and return -ENOMEM in such a case.
>
> 'num_post_dep_syncobjs' still has to be set to 0 before the test in order
> to have it initialized if 'amdgpu_cs_parser_fini()' is called to free
> resources.
>
> The calling graph would be, in such a case!
>     failure in amdgpu_cs_process_syncobj_out_dep()
>        ---> error code returned by amdgpu_cs_dependencies()
>           --> amdgpu_cs_parser_fini() is called
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 15d4a28d73bb..baa90df90aea 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1079,6 +1079,9 @@ static int amdgpu_cs_process_syncobj_out_dep(struct=
 amdgpu_cs_parser *p,
>   					     GFP_KERNEL);
>   	p->num_post_dep_syncobjs =3D 0;
>  =20
> +	if (!p->post_dep_syncobjs)
> +		return -ENOMEM;
> +
>   	for (i =3D 0; i < num_deps; ++i) {
>   		p->post_dep_syncobjs[i] =3D drm_syncobj_find(p->filp, deps[i].handle);
>   		if (!p->post_dep_syncobjs[i])


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
