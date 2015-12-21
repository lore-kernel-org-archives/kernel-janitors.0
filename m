From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Mon, 21 Dec 2015 09:35:18 +0000
Subject: Re: [PATCH 2/4] ASoC: omap-hdmi-audio: add NULL test
Message-Id: <5677C7D6.3030909@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450610153-7746-1-git-send-email-Julia.Lawall@lip6.fr>
 <1450610153-7746-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450610153-7746-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, "Sarha, Jyri" <jsarha@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jarkko Nikula <jarkko.nikula@bitmer.com>

On 12/20/2015 01:15 PM, Julia Lawall wrote:
> Add NULL test on call to devm_kzalloc.
>=20
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @@
> expression x;
> identifier fld;
> @@
>=20
> * x =3D devm_kzalloc(...);
>   ... when !=3D x =3D NULL
>   x->fld
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> ---
>  sound/soc/omap/omap-hdmi-audio.c |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/sound/soc/omap/omap-hdmi-audio.c b/sound/soc/omap/omap-hdmi-=
audio.c
> index 584b237..f83cc2b 100644
> --- a/sound/soc/omap/omap-hdmi-audio.c
> +++ b/sound/soc/omap/omap-hdmi-audio.c
> @@ -368,6 +368,8 @@ static int omap_hdmi_audio_probe(struct platform_devi=
ce *pdev)
>  	card->owner =3D THIS_MODULE;
>  	card->dai_link >  		devm_kzalloc(dev, sizeof(*(card->dai_link)), GFP_KE=
RNEL);
> +	if (!card->dai_link)
> +		return -ENOMEM;
>  	card->dai_link->name =3D card->name;
>  	card->dai_link->stream_name =3D card->name;
>  	card->dai_link->cpu_dai_name =3D dev_name(ad->dssdev);
>=20


--=20
P=E9ter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
