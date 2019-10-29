From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Tue, 29 Oct 2019 19:40:05 +0000
Subject: Re: [PATCH][next] drivers: thermal: tsens: fix potential integer overflow on multiply
Message-Id: <cc9ea171-dfdc-f28e-59a4-26ab55155b8b@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191022114910.652-1-colin.king@canonical.com>
In-Reply-To: <20191022114910.652-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Amit Kucheria <amit.kucheria@linaro.org>, Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 22/10/2019 13:49, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently a multiply operation is being performed on two int values
> and the result is being assigned to a u64, presumably because the
> end result is expected to be probably larger than an int. However,
> because the multiply is an int multiply one can get overflow. Avoid
> the overflow by casting degc to a u64 to force a u64 multiply.
>=20
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: fbfe1a042cfd ("drivers: thermal: tsens: Add interrupt support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/thermal/qcom/tsens-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/t=
sens-common.c
> index 03bf1b8133ea..3d7855106ecd 100644
> --- a/drivers/thermal/qcom/tsens-common.c
> +++ b/drivers/thermal/qcom/tsens-common.c
> @@ -92,7 +92,7 @@ void compute_intercept_slope(struct tsens_priv *priv, u=
32 *p1,
> =20
>  static inline u32 degc_to_code(int degc, const struct tsens_sensor *s)
>  {
> -	u64 code =3D (degc * s->slope + s->offset) / SLOPE_FACTOR;
> +	u64 code =3D ((u64)degc * s->slope + s->offset) / SLOPE_FACTOR;


-       u64 code =3D ((u64)degc * s->slope + s->offset) / SLOPE_FACTOR;
+       u64 code =3D div_u64(((u64)degc * s->slope + s->offset),
SLOPE_FACTOR);


> =20
>  	pr_debug("%s: raw_code: 0x%llx, degc:%d\n", __func__, code, degc);
>  	return clamp_val(code, THRESHOLD_MIN_ADC_CODE, THRESHOLD_MAX_ADC_CODE);
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
