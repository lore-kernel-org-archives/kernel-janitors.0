From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 03 Mar 2018 15:23:35 +0000
Subject: Re: [PATCH] iio:magnetometer: Replace magic number 0 by IIO_CHAN_INFO_RAW
Message-Id: <20180303152335.4c287ede@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180227144755.ifbzn5gekm345nk5@smtp.gmail.com>
In-Reply-To: <20180227144755.ifbzn5gekm345nk5@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, daniel.baluta@nxp.com, kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 27 Feb 2018 11:47:55 -0300
Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com> wrote:

> The function magn_3d_read_raw has a switch statement handling multiple
> cases per channel. The first case statement uses the magic number 0,
> which means IIO_CHAN_INFO_RAW. Additionally, the iio_chan_spec for
> magn_3d_channels is configured to be IIO_CHAN_INFO_RAW. Therefore, this
> patch replaces the magic number 0 for the appropriate IIO_CHAN_INFO_RAW.
> 
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan
> ---
>  drivers/iio/magnetometer/hid-sensor-magn-3d.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/magnetometer/hid-sensor-magn-3d.c b/drivers/iio/magnetometer/hid-sensor-magn-3d.c
> index a1fd9d591818..d55c4885211a 100644
> --- a/drivers/iio/magnetometer/hid-sensor-magn-3d.c
> +++ b/drivers/iio/magnetometer/hid-sensor-magn-3d.c
> @@ -167,7 +167,7 @@ static int magn_3d_read_raw(struct iio_dev *indio_dev,
>  	*val = 0;
>  	*val2 = 0;
>  	switch (mask) {
> -	case 0:
> +	case IIO_CHAN_INFO_RAW:
>  		hid_sensor_power_state(&magn_state->magn_flux_attributes, true);
>  		report_id >  			magn_state->magn[chan->address].report_id;

