From: Nicolas Ferre <nicolas.ferre@atmel.com>
Date: Tue, 18 Oct 2016 08:13:25 +0000
Subject: Re: [PATCH 2/7] ASoC: atmel_wm8904: constify snd_soc_ops structures
Message-Id: <87b8b035-ddf2-dfe4-faf4-45d7ba0199bf@atmel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1476543351-17858-1-git-send-email-Julia.Lawall@lip6.fr>
 <1476543351-17858-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1476543351-17858-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

Le 15/10/2016 =E0 16:55, Julia Lawall a =E9crit :
> Check for snd_soc_ops structures that are only stored in the ops field of=
 a
> snd_soc_dai_link structure.  This field is declared const, so snd_soc_ops
> structures that have this property can be declared as const also.
>=20
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct snd_soc_ops i@p =3D { ... };
>=20
> @ok1@
> identifier r.i;
> struct snd_soc_dai_link e;
> position p;
> @@
> e.ops =3D &i@p;
>=20
> @ok2@
> identifier r.i, e;
> position p;
> @@
> struct snd_soc_dai_link e[] =3D { ..., { .ops =3D &i@p, }, ..., };
>=20
> @bad@
> position p !=3D {r.p,ok1.p,ok2.p};
> identifier r.i;
> struct snd_soc_ops e;
> @@
> e@i@p
>=20
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct snd_soc_ops i =3D { ... };
> // </smpl>
>=20
> The effect on the layout of the .o file is shown by the following output =
of
> the size command, first before then after the transformation:
>=20
>    text    data     bss     dec     hex filename
>    2611    1536       0    4147    1033 sound/soc/atmel/atmel_wm8904.o
>    2675    1480       0    4155    103b sound/soc/atmel/atmel_wm8904.o
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Thanks,

>=20
> ---
>  sound/soc/atmel/atmel_wm8904.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff -u -p a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm890=
4.c
> --- a/sound/soc/atmel/atmel_wm8904.c
> +++ b/sound/soc/atmel/atmel_wm8904.c
> @@ -53,7 +53,7 @@ static int atmel_asoc_wm8904_hw_params(s
>  	return 0;
>  }
> =20
> -static struct snd_soc_ops atmel_asoc_wm8904_ops =3D {
> +static const struct snd_soc_ops atmel_asoc_wm8904_ops =3D {
>  	.hw_params =3D atmel_asoc_wm8904_hw_params,
>  };
> =20
>=20
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
