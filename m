From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 27 Apr 2017 08:03:54 +0000
Subject: Re: [PATCH 2/2] input: touchscreen: mxs-lradc: || vs && typos
Message-Id: <20170427080354.ltqoisfnnnrdki24@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170426210431.mqze5ehrijm7l2ey@mwanda>
In-Reply-To: <20170426210431.mqze5ehrijm7l2ey@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ksenija Stanojevic <ksenija.stanojevic@gmail.com>, Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org

On Thu, 27 Apr 2017, Dan Carpenter wrote:

> These tests are meaningless as is because "adapt" can't possibly be both
> less than 1 and greater than 32.
>=20
> Fixes: d81ca730e3e4 ("input: touchscreen: mxs-lradc: Add support for touc=
hscreen")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

> diff --git a/drivers/input/touchscreen/mxs-lradc-ts.c b/drivers/input/tou=
chscreen/mxs-lradc-ts.c
> index ff9cda29d9a0..369ef83234ef 100644
> --- a/drivers/input/touchscreen/mxs-lradc-ts.c
> +++ b/drivers/input/touchscreen/mxs-lradc-ts.c
> @@ -642,7 +642,7 @@ static int mxs_lradc_ts_probe(struct platform_device =
*pdev)
>  	if (of_property_read_u32(node, "fsl,ave-ctrl", &adapt)) {
>  		ts->over_sample_cnt =3D 4;
>  	} else {
> -		if (adapt >=3D 1 || adapt <=3D 32) {
> +		if (adapt >=3D 1 && adapt <=3D 32) {
>  			ts->over_sample_cnt =3D adapt;
>  		} else {
>  			dev_err(ts->dev, "Invalid sample count (%u)\n",
> @@ -654,7 +654,7 @@ static int mxs_lradc_ts_probe(struct platform_device =
*pdev)
>  	if (of_property_read_u32(node, "fsl,ave-delay", &adapt)) {
>  		ts->over_sample_delay =3D 2;
>  	} else {
> -		if (adapt >=3D 2 || adapt <=3D LRADC_DELAY_DELAY_MASK + 1) {
> +		if (adapt >=3D 2 && adapt <=3D LRADC_DELAY_DELAY_MASK + 1) {
>  			ts->over_sample_delay =3D adapt;
>  		} else {
>  			dev_err(ts->dev, "Invalid sample delay (%u)\n",
> @@ -666,7 +666,7 @@ static int mxs_lradc_ts_probe(struct platform_device =
*pdev)
>  	if (of_property_read_u32(node, "fsl,settling", &adapt)) {
>  		ts->settling_delay =3D 10;
>  	} else {
> -		if (adapt >=3D 1 || adapt <=3D LRADC_DELAY_DELAY_MASK) {
> +		if (adapt >=3D 1 && adapt <=3D LRADC_DELAY_DELAY_MASK) {
>  			ts->settling_delay =3D adapt;
>  		} else {
>  			dev_err(ts->dev, "Invalid settling delay (%u)\n",

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
