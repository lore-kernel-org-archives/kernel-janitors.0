From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Tue, 12 Jun 2018 07:46:56 +0000
Subject: Re: [PATCH] ASoC: twl6040: make pointer dmic_codec_dev static
Message-Id: <d0355575-feb2-a1fe-242a-57acf52bad1e@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180606093504.30255-1-colin.king@canonical.com>
In-Reply-To: <20180606093504.30255-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 2018-06-06 12:35, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The pointer dmic_codec_dev is local to the source and does not need
> to be in global scope, so make it static.
>=20
> Cleans up sparse warning:
> warning: symbol 'dmic_codec_dev' was not declared. Should it be static?

can you change the subject to:
ASoC: omap-abe-twl6040: make pointer dmic_codec_dev static

With that change:
Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/soc/omap/omap-abe-twl6040.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/omap/omap-abe-twl6040.c b/sound/soc/omap/omap-abe-=
twl6040.c
> index 15ccbf479c96..d5ae9eb8c756 100644
> --- a/sound/soc/omap/omap-abe-twl6040.c
> +++ b/sound/soc/omap/omap-abe-twl6040.c
> @@ -40,7 +40,7 @@ struct abe_twl6040 {
>  	int	mclk_freq;	/* MCLK frequency speed for twl6040 */
>  };
> =20
> -struct platform_device *dmic_codec_dev;
> +static struct platform_device *dmic_codec_dev;
> =20
>  static int omap_abe_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_pcm_hw_params *params)
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
