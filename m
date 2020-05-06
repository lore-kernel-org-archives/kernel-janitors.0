From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Date: Wed, 06 May 2020 12:25:18 +0000
Subject: Re: [PATCH -next] power: supply: bq25890_charger: fix missing unlock on error in bq25890_resume()
Message-Id: <20200506122516.GC18376@qmqm.qmqm.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506014008.59755-1-weiyongjun1@huawei.com>
In-Reply-To: <20200506014008.59755-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Sebastian Reichel <sre@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 06, 2020 at 01:40:08AM +0000, Wei Yongjun wrote:
> Add the missing unlock before return from function bq25890_resume()
> in the error handling case.
>=20
> Fixes: 72d9cd9cdc18 ("power: bq25890: protect view of the chip's state")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

A similar fix was sent by Dan Carpenter [1]. I'd prefer his version due
to less lines introduced.

[1] https://lore.kernel.org/linux-pm/20200506101116.GA77004@mwanda/

Best Regards,
Micha=B3 Miros=B3aw

> ---
>  drivers/power/supply/bq25890_charger.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/suppl=
y/bq25890_charger.c
> index 9339e216651f..cd9c5ed9bc0c 100644
> --- a/drivers/power/supply/bq25890_charger.c
> +++ b/drivers/power/supply/bq25890_charger.c
> @@ -977,14 +977,18 @@ static int bq25890_resume(struct device *dev)
>  	mutex_lock(&bq->lock);
> =20
>  	ret =3D bq25890_get_chip_state(bq, &bq->state);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		mutex_unlock(&bq->lock);
>  		return ret;
> +	}
> =20
>  	/* Re-enable ADC only if charger is plugged in. */
>  	if (bq->state.online) {
>  		ret =3D bq25890_field_write(bq, F_CONV_START, 1);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			mutex_unlock(&bq->lock);
>  			return ret;
> +		}
>  	}
> =20
>  	/* signal userspace, maybe state changed while suspended */
>=20
>=20
>=20
