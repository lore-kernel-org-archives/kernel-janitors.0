From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 16 Apr 2016 12:31:49 +0000
Subject: Re: [PATCH 03/10] iio: adc: vf610_adc: fix case label indent
Message-Id: <571230B5.1040207@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460662602-2951-1-git-send-email-sst@poczta.fm>
 <1460662602-2951-4-git-send-email-sst@poczta.fm>
In-Reply-To: <1460662602-2951-4-git-send-email-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Slawomir Stepien <sst@poczta.fm>, knaack.h@gmx.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 14/04/16 20:36, Slawomir Stepien wrote:
> This fixes the error reported by checkpatch.pl:
> 
> ERROR: switch and case should be at the same indent
> 
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>
Applied.

Thanks,

Jonathan
> ---
>  drivers/iio/adc/vf610_adc.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iio/adc/vf610_adc.c b/drivers/iio/adc/vf610_adc.c
> index b10f629..653bf13 100644
> --- a/drivers/iio/adc/vf610_adc.c
> +++ b/drivers/iio/adc/vf610_adc.c
> @@ -714,19 +714,19 @@ static int vf610_write_raw(struct iio_dev *indio_dev,
>  	int i;
>  
>  	switch (mask) {
> -		case IIO_CHAN_INFO_SAMP_FREQ:
> -			for (i = 0;
> -				i < ARRAY_SIZE(info->sample_freq_avail);
> -				i++)
> -				if (val = info->sample_freq_avail[i]) {
> -					info->adc_feature.sample_rate = i;
> -					vf610_adc_sample_set(info);
> -					return 0;
> -				}
> -			break;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		for (i = 0;
> +			i < ARRAY_SIZE(info->sample_freq_avail);
> +			i++)
> +			if (val = info->sample_freq_avail[i]) {
> +				info->adc_feature.sample_rate = i;
> +				vf610_adc_sample_set(info);
> +				return 0;
> +			}
> +		break;
>  
> -		default:
> -			break;
> +	default:
> +		break;
>  	}
>  
>  	return -EINVAL;
> 

