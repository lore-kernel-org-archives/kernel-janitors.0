From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
Date: Thu, 20 Aug 2020 09:17:35 +0000
Subject: Re: [PATCH 1/6] staging: wfx/main.h: fix a spelling and grammar mistake
Message-Id: <20227794.A6qR83TFM7@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com>
In-Reply-To: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: gregkh@linuxfoundation.org, Suraj Upadhyay <usuraj35@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thursday 20 August 2020 10:49:33 CEST Suraj Upadhyay wrote:
>=20
> Fix spelling mistake "extention" =3D> "extension".
> And correct the statement in passive-voice by adding "be".
>=20
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>  drivers/staging/wfx/main.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/wfx/main.h b/drivers/staging/wfx/main.h
> index c59d375dd3ad..2457cb595b0f 100644
> --- a/drivers/staging/wfx/main.h
> +++ b/drivers/staging/wfx/main.h
> @@ -19,7 +19,7 @@ struct wfx_dev;
>  struct hwbus_ops;
>=20
>  struct wfx_platform_data {
> -       /* Keyset and ".sec" extention will appended to this string */
> +       /* Keyset and ".sec" extension will be appended to this string */

Already fixed by commit c9638363f02d ("staging: wfx: fix a handful of
spelling mistakes"). But, I am sure there still are spell mistakes in code
of wfx driver :)


--=20
J=E9r=F4me Pouiller
