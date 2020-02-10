From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Mon, 10 Feb 2020 10:47:14 +0000
Subject: Re: [PATCH][V2] ASoC: ti: davinci-mcasp: remove redundant assignment to variable ret
Message-Id: <bc05a46a-fc38-c95f-4aa1-25034d3eb6cc@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200210092423.327499-1-colin.king@canonical.com>
In-Reply-To: <20200210092423.327499-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 10/02/2020 11.24, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The assignment to ret is redundant as it is not used in the error
> return path and hence can be removed.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> V2: explicitly return NULL to improve readability. Thanks to Dan Carpente=
r for
>     suggesting this improvement.
> ---
>  sound/soc/ti/davinci-mcasp.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index e1e937eb1dc1..6f97639c46cd 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -1764,10 +1764,8 @@ static struct davinci_mcasp_pdata *davinci_mcasp_s=
et_pdata_from_of(
>  	} else if (match) {
>  		pdata =3D devm_kmemdup(&pdev->dev, match->data, sizeof(*pdata),
>  				     GFP_KERNEL);
> -		if (!pdata) {
> -			ret =3D -ENOMEM;
> -			return pdata;
> -		}
> +		if (!pdata)
> +			return NULL;
>  	} else {
>  		/* control shouldn't reach here. something is wrong */
>  		ret =3D -EINVAL;
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
