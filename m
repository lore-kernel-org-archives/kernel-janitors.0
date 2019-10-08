From: Jerome Pouiller <Jerome.Pouiller@silabs.com>
Date: Tue, 08 Oct 2019 20:14:53 +0000
Subject: Re: [PATCH][next] staging: wfx: fix spelling mistake "hexdecimal" -> "hexadecimal"
Message-Id: <5156069.1LFZ7Sz98S@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191008082205.19740-1-colin.king@canonical.com>
In-Reply-To: <20191008082205.19740-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tuesday 8 October 2019 10:22:05 CEST Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a spelling mistake in the documentation and a module parameter
> description. Fix these.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  .../devicetree/bindings/net/wireless/siliabs,wfx.txt            | 2 +-
>  drivers/staging/wfx/main.c                                      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/wfx/Documentation/devicetree/bindings/net/wi=
reless/siliabs,wfx.txt b/drivers/staging/wfx/Documentation/devicetree/bindi=
ngs/net/wireless/siliabs,wfx.txt
> index 15965c9b4180..26de6762b942 100644
> --- a/drivers/staging/wfx/Documentation/devicetree/bindings/net/wireless/=
siliabs,wfx.txt
> +++ b/drivers/staging/wfx/Documentation/devicetree/bindings/net/wireless/=
siliabs,wfx.txt
> @@ -89,7 +89,7 @@ Some properties are recognized either by SPI and SDIO v=
ersions:
>     this property, driver will disable most of power saving features.
>   - config-file: Use an alternative file as PDS. Default is `wf200.pds`. =
Only
>     necessary for development/debug purpose.
> - - slk_key: String representing hexdecimal value of secure link key to u=
se.
> + - slk_key: String representing hexadecimal value of secure link key to =
use.
>     Must contains 64 hexadecimal digits. Not supported in current version.
>=20
>  WFx driver also supports `mac-address` and `local-mac-address` as descri=
bed in
> diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
> index fe9a89703897..d2508bc950fa 100644
> --- a/drivers/staging/wfx/main.c
> +++ b/drivers/staging/wfx/main.c
> @@ -48,7 +48,7 @@ MODULE_PARM_DESC(gpio_wakeup, "gpio number for wakeup. =
-1 for none.");
>=20
>  static char *slk_key;
>  module_param(slk_key, charp, 0600);
> -MODULE_PARM_DESC(slk_key, "secret key for secure link (expect 64 hexdeci=
mal digits).");
> +MODULE_PARM_DESC(slk_key, "secret key for secure link (expect 64 hexadec=
imal digits).");
>=20
>  #define RATETAB_ENT(_rate, _rateid, _flags) { \
>         .bitrate  =3D (_rate),   \
> --
> 2.20.1
>=20

Thank you!

Acked-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>

--=20
J=E9r=F4me Pouiller
