From: Rui Miguel Silva <rmfrfs@gmail.com>
Date: Thu, 01 Aug 2019 15:41:13 +0000
Subject: Re: [PATCH] media: ov2680: fix a typo in a function name
Message-Id: <m336ikc2qu.fsf@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190721190423.9534-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190721190423.9534-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,
Thanks for the patch.

On Sun 21 Jul 2019 at 20:04, Christophe JAILLET wrote:
> All functions in this file starts with 'ov2680_', except ov2860_parse_dt().
>
> This is likely a typo.
>

Yup, weird is to only have one of this. Nice catch.

> rename it to 'ov2680_parse_dt()' (6 and 8)
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

---
Cheers,
	Rui

> ---
>  drivers/media/i2c/ov2680.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index b10bcfabaeeb..c59c9e51c380 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -1023,7 +1023,7 @@ static int ov2680_check_id(struct ov2680_dev *sensor)
>  	return 0;
>  }
>
> -static int ov2860_parse_dt(struct ov2680_dev *sensor)
> +static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  {
>  	struct device *dev = ov2680_to_dev(sensor);
>  	int ret;
> @@ -1064,7 +1064,7 @@ static int ov2680_probe(struct i2c_client *client)
>
>  	sensor->i2c_client = client;
>
> -	ret = ov2860_parse_dt(sensor);
> +	ret = ov2680_parse_dt(sensor);
>  	if (ret < 0)
>  		return -EINVAL;
