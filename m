From: Dave Airlie <airlied@gmail.com>
Date: Thu, 07 Jan 2010 03:47:07 +0000
Subject: Re: [PATCH] drm/radeon/r100.c: check for invalid family
Message-Id: <21d7e9971001061947k16ef1367k3c331a8849ce0109@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1262136291.8733.35.camel@ICE-BOX>
In-Reply-To: <1262136291.8733.35.camel@ICE-BOX>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Dec 30, 2009 at 11:24 AM, Darren Jenkins
<darrenrjenkins@gmail.com> wrote:
> If there is an invalid family the fw_name is NULL and causes an
> NULL pointer dereference.
> This just adds a check for something unexpected.

NAK.

This can't happen, only gpus with those families set can call this function,
so we can't get in here without the correct family, and if we did it would =
be
due to developer error, so oopsing is very appropriate.

Dave.

>
> Coverity CID: 13251
>
> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
>
> diff --git drivers/gpu/drm/radeon/r100.c drivers/gpu/drm/radeon/r100.c
> index 7172746..e4b9770 100644
> --- drivers/gpu/drm/radeon/r100.c
> +++ drivers/gpu/drm/radeon/r100.c
> @@ -584,6 +584,8 @@ static int r100_cp_init_microcode(struct radeon_devic=
e *rdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (rdev->family =3D CHIP_RV570)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0DRM_INFO("Loading R500 Microcode\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fw_name =3D FIRMWARE_R520;
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0err =3D request_firmware(&rdev->me_fw, fw_name, &pdev->dev=
);
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
