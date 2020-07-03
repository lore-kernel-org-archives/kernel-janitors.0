From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Fri, 03 Jul 2020 07:59:55 +0000
Subject: Re: [PATCH -next] ASoC: ti: j721e-evm: Fix missing unlock on error in j721e_audio_hw_params()
Message-Id: <8ab2ddf8-88db-a5e5-b97a-76b4fe014bdd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200703030910.75047-1-weiyongjun1@huawei.com>
In-Reply-To: <20200703030910.75047-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wei Yongjun <weiyongjun1@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 03/07/2020 6.09, Wei Yongjun wrote:
> Add the missing unlock before return from function j721e_audio_hw_params()
> in the error handling case.

I'm not sure how that return made it in there in the first place..

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Fixes: 6748d0559059 ("ASoC: ti: Add custom machine driver for j721e EVM (=
CPB and IVI)")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  sound/soc/ti/j721e-evm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
> index 3a2a8b1f3aa3..174306cf53ad 100644
> --- a/sound/soc/ti/j721e-evm.c
> +++ b/sound/soc/ti/j721e-evm.c
> @@ -330,7 +330,7 @@ static int j721e_audio_hw_params(struct snd_pcm_subst=
ream *substream,
>  		ret =3D snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 0x3, 2,
>  					       slot_width);
>  		if (ret && ret !=3D -ENOTSUPP)
> -			return ret;
> +			goto out;
>  	}
> =20
>  	ret =3D j721e_configure_refclk(priv, domain_id, params_rate(params));
>=20
>=20
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
