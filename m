From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Nov 2016 13:40:32 +0000
Subject: Re: [patch] [media] uvcvideo: freeing an error pointer
Message-Id: <3d5d23d6-14ab-5c22-978a-15b5546fdca9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161125102835.GA5856@mwanda>
In-Reply-To: <20161125102835.GA5856@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

> A recent cleanup introduced a potential dereference of -EFAULT when we
> call kfree(map->menu_info).
>=20
> Fixes: 4cc5bed1caeb ("[media] uvcvideo: Use memdup_user() rather than dup=
licating its implementation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for your information.


> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc=
_v4l2.c
> index a7e12fd..3e7e283 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -66,14 +66,14 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain =
*chain,
>  		if (xmap->menu_count =3D 0 ||
>  		    xmap->menu_count > UVC_MAX_CONTROL_MENU_ENTRIES) {
>  			ret =3D -EINVAL;
> -			goto done;
> +			goto free_map;
>  		}
> =20
>  		size =3D xmap->menu_count * sizeof(*map->menu_info);
>  		map->menu_info =3D memdup_user(xmap->menu_info, size);
>  		if (IS_ERR(map->menu_info)) {
>  			ret =3D PTR_ERR(map->menu_info);
> -			goto done;
> +			goto free_map;
>  		}
> =20
>  		map->menu_count =3D xmap->menu_count;
> @@ -83,13 +83,13 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain =
*chain,
>  		uvc_trace(UVC_TRACE_CONTROL, "Unsupported V4L2 control type "
>  			  "%u.\n", xmap->v4l2_type);
>  		ret =3D -ENOTTY;
> -		goto done;
> +		goto free_map;
>  	}
> =20
>  	ret =3D uvc_ctrl_add_mapping(chain, map);
> =20
> -done:
>  	kfree(map->menu_info);
> +free_map:
>  	kfree(map);
> =20
>  	return ret;
>=20

Did your update suggestion become also relevant just because the correspond=
ing
update step =93[PATCH 2/2] uvc_v4l2: One function call less in uvc_ioctl_ct=
rl_map()
after error detection=94 which I offered as another change possibility on 2=
016-08-19
was rejected on 2016-11-22?

https://patchwork.linuxtv.org/patch/36528/
https://patchwork.kernel.org/patch/9289897/
https://lkml.kernel.org/r/<8f89ec37-1556-4c09-f0b7-df87b4169320@users.sourc=
eforge.net>

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
