From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Mon, 06 Nov 2017 08:44:14 +0000
Subject: Re: [PATCH] drm/amd/display: small cleanup in destruct()
Message-Id: <031c92ca-86b0-718d-bf93-18d50db00ce9@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171106070733.owgzad3bpuabfkkk@mwanda>
In-Reply-To: <20171106070733.owgzad3bpuabfkkk@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>
Cc: Andrey Grodzovsky <Andrey.Grodzovsky-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Bhawanpreet Lakha <Bhawanpreet.Lakha-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dmytro Laktyushkin <Dmytro.Laktyushkin-5C7GfCeVMHo@public.gmane.org>, Hersen Wu <hersenxs.wu-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tony Cheng <tony.cheng-5C7GfCeVMHo@public.gmane.org>

Am 06.11.2017 um 08:07 schrieb Dan Carpenter:
> Static analysis tools get annoyed that we don't indent this if
> statement.  Actually, the if statement isn't required because kfree()
> can handle NULL pointers just fine.  The DCE110STRENC_FROM_STRENC()
> macro is a wrapper around container_of() but it's basically a no-op or a
> cast.  Anyway, it's not really appropriate here so it should be removed
> as well.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

> ---
> v2: in v1 I just added a tab
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/driv=
ers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> index d911590d08bc..4c4bd72d4e40 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> @@ -725,10 +725,8 @@ static void destruct(struct dcn10_resource_pool *poo=
l)
>   		}
>   	}
>  =20
> -	for (i =3D 0; i < pool->base.stream_enc_count; i++) {
> -		if (pool->base.stream_enc[i] !=3D NULL)
> -		kfree(DCE110STRENC_FROM_STRENC(pool->base.stream_enc[i]));
> -	}
> +	for (i =3D 0; i < pool->base.stream_enc_count; i++)
> +		kfree(pool->base.stream_enc[i]);
>  =20
>   	for (i =3D 0; i < pool->base.audio_count; i++) {
>   		if (pool->base.audios[i])


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
