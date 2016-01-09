From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 09 Jan 2016 17:03:30 +0000
Subject: Re: [PATCH] iio: ak8975: constify ak_def structures
Message-Id: <56913D62.8080107@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1452005802-4165-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1452005802-4165-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/01/16 14:56, Julia Lawall wrote:
> The ak_def structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
Applied, thanks.

Jonathan
> ---
>  drivers/iio/magnetometer/ak8975.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/magnetometer/ak8975.c b/drivers/iio/magnetometer/ak8975.c
> index b13936d..9c5c9ef 100644
> --- a/drivers/iio/magnetometer/ak8975.c
> +++ b/drivers/iio/magnetometer/ak8975.c
> @@ -252,7 +252,7 @@ struct ak_def {
>  	u8 data_regs[3];
>  };
>  
> -static struct ak_def ak_def_array[AK_MAX_TYPE] = {
> +static const struct ak_def ak_def_array[AK_MAX_TYPE] = {
>  	{
>  		.type = AK8975,
>  		.raw_to_gauss = ak8975_raw_to_gauss,
> @@ -360,7 +360,7 @@ static struct ak_def ak_def_array[AK_MAX_TYPE] = {
>   */
>  struct ak8975_data {
>  	struct i2c_client	*client;
> -	struct ak_def		*def;
> +	const struct ak_def	*def;
>  	struct attribute_group	attrs;
>  	struct mutex		lock;
>  	u8			asa[3];
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

