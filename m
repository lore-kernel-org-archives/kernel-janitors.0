From: =?ISO-8859-1?Q?G=E1bor_Stefanik?= <netrolller.3d@gmail.com>
Date: Sat, 01 Jan 2011 23:41:33 +0000
Subject: Re: [PATCH 2/2] staging: keucr: Use memcpy() instad of custom
Message-Id: <AANLkTi=B21AWtgOTZTx10GnmNCvpRTJS3+TzYvx3XwUw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1293823712-6273-3-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1293823712-6273-3-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, Dec 31, 2010 at 8:28 PM, Javier Martinez Canillas
<martinez.javier@gmail.com> wrote:
>
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
> ---
> =A0drivers/staging/keucr/smilecc.c | =A0 16 +++++++++-------
> =A01 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/keucr/smilecc.c b/drivers/staging/keucr/smil=
ecc.c
> index daf322a..f9e515d 100644
> --- a/drivers/staging/keucr/smilecc.c
> +++ b/drivers/staging/keucr/smilecc.c
> @@ -182,13 +182,15 @@ BYTE *buf;
> =A0BYTE *redundant_ecc;
> =A0BYTE *calculate_ecc;
> =A0{
> - =A0 =A0DWORD err;
> -
> - =A0 =A0err=3Dcorrect_data(buf,redundant_ecc,*(calculate_ecc+1),*(calcul=
ate_ecc),*(calculate_ecc+2));
> - =A0 =A0if (err=3D1) StringCopy(calculate_ecc,redundant_ecc,3);
> - =A0 =A0 =A0 =A0if (err=3D0 || err=3D1 || err=3D2)
> - =A0 =A0 =A0 =A0 =A0 =A0return(0);
> - =A0 =A0return(-1);
> + =A0 =A0 =A0 DWORD err;
> + =A0 =A0 =A0 err =3D correct_data(buf, redundant_ecc, *(calculate_ecc+1),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*(calculate_ecc), *(=
calculate_ecc+2));

Any reason why you didn't unify these 2 lines? Like this: DWORD err correct=
_data(...);

> + =A0 =A0 =A0 if (err =3D 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(calculate_ecc, redundant_ecc, 3);
> +
> + =A0 =A0 =A0 if (err =3D 0 || err =3D 1 || err =3D 2)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 return -1;
> =A0}
>
> =A0void _Calculate_D_SwECC(buf,ecc)
> --
> 1.7.0.4
>
> _______________________________________________
> devel mailing list
> devel@linuxdriverproject.org
> http://driverdev.linuxdriverproject.org/mailman/listinfo/devel
>



--=20
Vista: [V]iruses, [I]ntruders, [S]pyware, [T]rojans and [A]dware. :-)
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
