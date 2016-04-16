From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 16 Apr 2016 12:32:31 +0000
Subject: Re: [PATCH 04/10] iio: adc: mcp3422: remove spaces before comma
Message-Id: <571230DF.6060602@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460662602-2951-1-git-send-email-sst@poczta.fm>
 <1460662602-2951-5-git-send-email-sst@poczta.fm>
In-Reply-To: <1460662602-2951-5-git-send-email-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Slawomir Stepien <sst@poczta.fm>, knaack.h@gmx.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 14/04/16 20:36, Slawomir Stepien wrote:
> This fixes the error reported by checkpatch.pl:
> 
> ERROR: space prohibited before that ',' (ctx:WxW)
> 
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>
Applied - thanks
> ---
>  drivers/iio/adc/mcp3422.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/mcp3422.c b/drivers/iio/adc/mcp3422.c
> index d7b36ef..d1172dc 100644
> --- a/drivers/iio/adc/mcp3422.c
> +++ b/drivers/iio/adc/mcp3422.c
> @@ -61,9 +61,9 @@
>  
>  static const int mcp3422_scales[4][4] = {
>  	{ 1000000, 500000, 250000, 125000 },
> -	{ 250000 , 125000, 62500 , 31250  },
> -	{ 62500  , 31250 , 15625 , 7812   },
> -	{ 15625  , 7812  , 3906  , 1953   } };
> +	{ 250000,  125000, 62500,  31250  },
> +	{ 62500,   31250,  15625,  7812   },
> +	{ 15625,   7812,   3906,   1953   } };
>  
>  /* Constant msleep times for data acquisitions */
>  static const int mcp3422_read_times[4] = {
> 

