From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Mon, 06 Nov 2017 11:51:35 +0000
Subject: Re: [PATCH] drm/amd/display: checking for NULL instead of IS_ERR()
Message-Id: <823814f1-4133-bffa-fe34-c676a2466d1d@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171106114340.w6li3f4iltg24bdp@mwanda>
In-Reply-To: <20171106114340.w6li3f4iltg24bdp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@linux.ie>, Harry Wentland <harry.wentland@amd.com>, Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, Tony Cheng <Tony.Cheng@amd.com>, "Leo (Sunpeng) Li" <sunpeng.li@amd.com>, Tom St Denis <tom.stdenis@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

Am 06.11.2017 um 12:43 schrieb Dan Carpenter:
> backlight_device_register() never returns NULL, it returns error
> pointers on error so the check here is wrong.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 33a15a1d818c..75f9383f5b9b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1296,7 +1296,7 @@ amdgpu_dm_register_backlight_device(struct amdgpu_d=
isplay_manager *dm)
>   			&amdgpu_dm_backlight_ops,
>   			&props);
>  =20
> -	if (NULL =3D dm->backlight_dev)
> +	if (IS_ERR(dm->backlight_dev))
>   		DRM_ERROR("DM: Backlight registration failed!\n");
>   	else
>   		DRM_DEBUG_DRIVER("DM: Registered Backlight device: %s\n", bl_name);


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
