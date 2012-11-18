From: Anton Vorontsov <cbouatmailru@gmail.com>
Date: Sun, 18 Nov 2012 22:47:32 +0000
Subject: Re: [patch] ds2782_battery: signedness bug in ds278x_read_reg16()
Message-Id: <20121118224732.GA29066@lizard.sbx05977.paloaca.wayport.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121024071229.GB2536@elgon.mountain>
In-Reply-To: <20121024071229.GB2536@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 24, 2012 at 10:12:29AM +0300, Dan Carpenter wrote:
> We need to check for negative values before doing the swab16() for the
> error handling to work.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!

> diff --git a/drivers/power/ds2782_battery.c b/drivers/power/ds2782_battery.c
> index 6bb6e2f..2fa9b6b 100644
> --- a/drivers/power/ds2782_battery.c
> +++ b/drivers/power/ds2782_battery.c
> @@ -80,13 +80,13 @@ static inline int ds278x_read_reg16(struct ds278x_info *info, int reg_msb,
>  {
>  	int ret;
>  
> -	ret = swab16(i2c_smbus_read_word_data(info->client, reg_msb));
> +	ret = i2c_smbus_read_word_data(info->client, reg_msb);
>  	if (ret < 0) {
>  		dev_err(&info->client->dev, "register read failed\n");
>  		return ret;
>  	}
>  
> -	*val = ret;
> +	*val = swab16(ret);
>  	return 0;
>  }
