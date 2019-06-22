From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 22 Jun 2019 08:43:26 +0000
Subject: Re: [PATCH] iio: sca3000: Potential endian bug in sca3000_read_event_value()
Message-Id: <20190622094326.742d3e7e@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190621091828.GA1878@mwanda>
In-Reply-To: <20190621091828.GA1878@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 21 Jun 2019 12:18:28 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The problem is that "ret" is an int but we're casting it as
> "(unsigned long *)&ret" when we do the for_each_set_bit() loop.  This
> will not work on big endian 64 bit systems.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Hi Dan,

Great catch,  I've applied this to the togreg branch of iio.git (rather
than fixes) given the point in the cycle and limited chance anyone is
actually running this obsolete part on a be64 machine.  I would love
to be proved wrong though and would be happy to push this for stable
if we do get any reports!

Thanks,

Jonathan
> ---
>  drivers/iio/accel/sca3000.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
> index 4964561595f5..9e9f4347a325 100644
> --- a/drivers/iio/accel/sca3000.c
> +++ b/drivers/iio/accel/sca3000.c
> @@ -872,8 +872,9 @@ static int sca3000_read_event_value(struct iio_dev *indio_dev,
>  				    enum iio_event_info info,
>  				    int *val, int *val2)
>  {
> -	int ret, i;
>  	struct sca3000_state *st = iio_priv(indio_dev);
> +	long ret;
> +	int i;
>  
>  	switch (info) {
>  	case IIO_EV_INFO_VALUE:
> @@ -885,11 +886,11 @@ static int sca3000_read_event_value(struct iio_dev *indio_dev,
>  			return ret;
>  		*val = 0;
>  		if (chan->channel2 = IIO_MOD_Y)
> -			for_each_set_bit(i, (unsigned long *)&ret,
> +			for_each_set_bit(i, &ret,
>  					 ARRAY_SIZE(st->info->mot_det_mult_y))
>  				*val += st->info->mot_det_mult_y[i];
>  		else
> -			for_each_set_bit(i, (unsigned long *)&ret,
> +			for_each_set_bit(i, &ret,
>  					 ARRAY_SIZE(st->info->mot_det_mult_xz))
>  				*val += st->info->mot_det_mult_xz[i];
>  
