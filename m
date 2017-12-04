From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Mon, 04 Dec 2017 14:04:37 +0000
Subject: Re: [PATCH 0/4] ALSA SoC TWL4030: Adjustments for two function implementations
Message-Id: <1ddb595c-65c3-c4e0-a85e-ccffdfc9156a@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d2edbce1-ffce-9c18-3f50-baa0cdfb0152@users.sourceforge.net>
In-Reply-To: <d2edbce1-ffce-9c18-3f50-baa0cdfb0152@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>



On 2017-11-23 23:07, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 23 Nov 2017 22:02:44 +0100
>=20
> A few update suggestions were taken into account
> from static source code analysis.
>=20
> Markus Elfring (4):
>   Delete an error message for a failed memory allocation in twl4030_get_p=
data()
>   Use common error handling code in twl4030_get_pdata()
>   Improve a size determination in two functions
>   Delete an unnecessary variable initialisation in twl4030_get_pdata()

All:
Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

>=20
>  sound/soc/codecs/twl4030.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
