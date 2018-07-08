From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 08 Jul 2018 09:38:06 +0000
Subject: Re: [PATCH 2/3] iio: adc: max1363: merge calls to of_match_device and of_device_get_match_data
Message-Id: <20180708103624.4b754d9f@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 21 May 2018 11:49:09 +0200
Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Drop call to of_match_device, which is subsumed by the subsequent
> call to of_device_get_match_data.  The code becomes simpler, and a
> temporary variable can be dropped.
> 
> The semantic match that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r@
> local idexpression match;
> identifier i;
> expression x, dev, e, e1;
> @@
> -        match@i = of_match_device(x, dev);
> -        if (match) e = of_device_get_match_data(dev);
> -        else e = e1;
> +        e = of_device_get_match_data(dev);
> +        if (!e) e = e1;
> 
> @@
> identifier r.i;
> @@
> - const struct of_device_id *i;
> ... when != i
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Sorry, this got lost in my inbox.

Anyhow, no applied to the togreg branch of iio.git and pushed out
as testing for the autobuilders to play with it.

Thanks,

Jonathan

> 
> ---
>  drivers/iio/adc/max1363.c |    8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
> index 7f1848d..c1e6a7a 100644
> --- a/drivers/iio/adc/max1363.c
> +++ b/drivers/iio/adc/max1363.c
> @@ -1575,7 +1575,6 @@ static int max1363_probe(struct i2c_client *client,
>  	struct max1363_state *st;
>  	struct iio_dev *indio_dev;
>  	struct regulator *vref;
> -	const struct of_device_id *match;
>  
>  	indio_dev = devm_iio_device_alloc(&client->dev,
>  					  sizeof(struct max1363_state));
> @@ -1602,11 +1601,8 @@ static int max1363_probe(struct i2c_client *client,
>  	/* this is only used for device removal purposes */
>  	i2c_set_clientdata(client, indio_dev);
>  
> -	match = of_match_device(of_match_ptr(max1363_of_match),
> -				&client->dev);
> -	if (match)
> -		st->chip_info = of_device_get_match_data(&client->dev);
> -	else
> +	st->chip_info = of_device_get_match_data(&client->dev);
> +	if (!st->chip_info)
>  		st->chip_info = &max1363_chip_info_tbl[id->driver_data];
>  	st->client = client;
>  
> 

