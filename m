From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Date: Wed, 27 Dec 2017 15:40:12 +0000
Subject: Re: [PATCH 11/12] drm/amd/powerplay: drop unneeded newline
Message-Id: <0378ac3c-752c-12b4-6f7c-046b208ff6d7@daenzer.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
 <1514386305-7402-12-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-12-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On 2017-12-27 03:51 PM, Julia Lawall wrote:
> PP_ASSERT_WITH_CODE prints a newline at the end of the message string,
> so the message string does not need to include a newline explicitly.
> Done using Coccinelle.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
>=20
> I couldn't figure out how to configure the kernel to get any of this code
> to compile.

Just enabling CONFIG_DRM_AMDGPU should be enough AFAICT.


--=20
Earthling Michel D=C3=A4nzer               |               http://www.amd.c=
om
Libre software enthusiast             |             Mesa and X developer
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
