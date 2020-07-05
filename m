From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Date: Sun, 05 Jul 2020 11:30:17 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust entry to renaming and conversion
Message-Id: <20200705113017.mostxjvatkqkhqf6@core.my.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200705065917.22285-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200705065917.22285-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: devicetree@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>, Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Joe Perches <joe@perches.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org

Hello Lukas,

On Sun, Jul 05, 2020 at 08:59:17AM +0200, Lukas Bulwahn wrote:
> Commit a74e81a56405 ("drm/panel: rocktech-jh057n00900: Rename the driver =
to
> st7703") and commit 7317f4574492 ("dt-bindings: panel: Convert
> rocktech,jh057n00900 to yaml") renamed and converted the files mentioned =
in
> DRM DRIVER FOR ROCKTECH JH057N00900 PANELS, but did not adjust the entries
> in MAINTAINERS.

A similar patch was already posted:

https://lkml.kernel.org/lkml/20200701184640.1674969-1-megous@megous.com/

thank you and regards,
	o.

> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains:
>=20
>   warning: no file matches  F: \
>   Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
>   warning: no file matches  F: \
>   drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
>=20
> Adjust entries after this file renaming and devicetree conversion.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20200703
>=20
> Ondrej, please ack this patch.
> Sam, please pick this minor non-urgent patch into your -next tree.
>=20
> This is the minimal change to address the warning. You might consider
> changing the name of the section from ROCKTECH to ST7703, change
> maintainers etc.
>=20
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9375edaef11f..8a7b92faff99 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5493,8 +5493,8 @@ DRM DRIVER FOR ROCKTECH JH057N00900 PANELS
>  M:	Guido G=FCnther <agx@sigxcpu.org>
>  R:	Purism Kernel Team <kernel@puri.sm>
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.=
txt
> -F:	drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> +F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.=
yaml
> +F:	drivers/gpu/drm/panel/panel-sitronix-st7703.c
> =20
>  DRM DRIVER FOR SAVAGE VIDEO CARDS
>  S:	Orphan / Obsolete
> --=20
> 2.17.1
>=20
