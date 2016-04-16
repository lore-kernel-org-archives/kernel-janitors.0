From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 16 Apr 2016 12:35:47 +0000
Subject: Re: [PATCH 09/10] iio: magnetometer: ak8975: put else and brace at the same line
Message-Id: <571231A3.10601@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460662602-2951-1-git-send-email-sst@poczta.fm>
 <1460662602-2951-10-git-send-email-sst@poczta.fm>
In-Reply-To: <1460662602-2951-10-git-send-email-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Slawomir Stepien <sst@poczta.fm>, knaack.h@gmx.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 14/04/16 20:36, Slawomir Stepien wrote:
> This fixes the error reported by checkpatch.pl:
> 
> ERROR: else should follow close brace '}'
> 
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>
Applied and thanks,

Jonathan
> ---
>  drivers/iio/magnetometer/ak8975.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/magnetometer/ak8975.c b/drivers/iio/magnetometer/ak8975.c
> index 48d127a..6bc855f 100644
> --- a/drivers/iio/magnetometer/ak8975.c
> +++ b/drivers/iio/magnetometer/ak8975.c
> @@ -810,8 +810,7 @@ static int ak8975_probe(struct i2c_client *client,
>  		name = ak8975_match_acpi_device(&client->dev, &chipset);
>  		if (!name)
>  			return -ENODEV;
> -	}
> -	else
> +	} else
>  		return -ENOSYS;
>  
>  	if (chipset >= AK_MAX_TYPE) {
> 

