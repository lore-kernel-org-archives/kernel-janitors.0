From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Date: Wed, 06 May 2020 12:20:20 +0000
Subject: Re: [PATCH] power: bq25890: unlock on error paths in bq25890_resume()
Message-Id: <20200506122019.GB18376@qmqm.qmqm.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506101116.GA77004@mwanda>
In-Reply-To: <20200506101116.GA77004@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 06, 2020 at 01:11:16PM +0300, Dan Carpenter wrote:
> We introduced some new locking here, but need to update the error
> paths so they unlock before returning.

Reviewed-by: Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.pl>


> Fixes: 72d9cd9cdc18 ("power: bq25890: protect view of the chip's state")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/power/supply/bq25890_charger.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/suppl=
y/bq25890_charger.c
> index 9339e216651ff..20b9824ef5acd 100644
> --- a/drivers/power/supply/bq25890_charger.c
> +++ b/drivers/power/supply/bq25890_charger.c
> @@ -978,21 +978,22 @@ static int bq25890_resume(struct device *dev)
> =20
>  	ret =3D bq25890_get_chip_state(bq, &bq->state);
>  	if (ret < 0)
> -		return ret;
> +		goto unlock;
> =20
>  	/* Re-enable ADC only if charger is plugged in. */
>  	if (bq->state.online) {
>  		ret =3D bq25890_field_write(bq, F_CONV_START, 1);
>  		if (ret < 0)
> -			return ret;
> +			goto unlock;
>  	}
> =20
>  	/* signal userspace, maybe state changed while suspended */
>  	power_supply_changed(bq->charger);
> =20
> +unlock:
>  	mutex_unlock(&bq->lock);
> =20
> -	return 0;
> +	return ret;
>  }
>  #endif
> =20
> --=20
> 2.26.2
>=20
