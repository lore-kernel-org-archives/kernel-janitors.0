From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 16 Apr 2016 12:40:07 +0000
Subject: Re: [PATCH 10/10] iio: pressure: ms5611: use tab for indention
Message-Id: <571232A7.10001@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460662602-2951-1-git-send-email-sst@poczta.fm>
 <1460662602-2951-11-git-send-email-sst@poczta.fm>
In-Reply-To: <1460662602-2951-11-git-send-email-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Slawomir Stepien <sst@poczta.fm>, knaack.h@gmx.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 14/04/16 20:36, Slawomir Stepien wrote:
> This fixes the errors reported by checkpatch.pl:
> 
> ERROR: code indent should use tabs where possible
> 
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>
I modified this one slightly to add the 'extra' spaces needed to maintain the
alignment of the parameters with the open bracket.

Otherwise, good and applied.

Thanks,

Jonathan
> ---
>  drivers/iio/pressure/ms5611_core.c | 2 +-
>  drivers/iio/pressure/ms5611_spi.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/pressure/ms5611_core.c b/drivers/iio/pressure/ms5611_core.c
> index c4e6586..9d192bf 100644
> --- a/drivers/iio/pressure/ms5611_core.c
> +++ b/drivers/iio/pressure/ms5611_core.c
> @@ -429,7 +429,7 @@ static void ms5611_fini(const struct iio_dev *indio_dev)
>  }
>  
>  int ms5611_probe(struct iio_dev *indio_dev, struct device *dev,
> -                 const char *name, int type)
> +		const char *name, int type)
>  {
>  	int ret;
>  	struct ms5611_state *st = iio_priv(indio_dev);
> diff --git a/drivers/iio/pressure/ms5611_spi.c b/drivers/iio/pressure/ms5611_spi.c
> index 7600483..8f75532 100644
> --- a/drivers/iio/pressure/ms5611_spi.c
> +++ b/drivers/iio/pressure/ms5611_spi.c
> @@ -108,7 +108,7 @@ static int ms5611_spi_probe(struct spi_device *spi)
>  	st->client = spi;
>  
>  	return ms5611_probe(indio_dev, &spi->dev, spi_get_device_id(spi)->name,
> -	                    spi_get_device_id(spi)->driver_data);
> +			spi_get_device_id(spi)->driver_data);
>  }
>  
>  static int ms5611_spi_remove(struct spi_device *spi)
> 

