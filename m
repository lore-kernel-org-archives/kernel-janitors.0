From: walter harms <wharms@bfs.de>
Date: Thu, 04 May 2017 07:28:19 +0000
Subject: Re: [PATCH] hwmon: (pmbus) Add missing break statements
Message-Id: <590AD813.6030805@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170503193140.zbxcdgda7k3rnr2m@mwanda>
In-Reply-To: <20170503193140.zbxcdgda7k3rnr2m@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 03.05.2017 21:31, schrieb Dan Carpenter:
> Static checkers complain about these missing break statements.
> 
> Fixes: 6eaaea144dc5 ("hwmon: (pmbus) Add client driver for IR35221")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
> index cc7b3b542531..00e4a1e264e2 100644
> --- a/drivers/hwmon/pmbus/ir35221.c
> +++ b/drivers/hwmon/pmbus/ir35221.c
> @@ -129,6 +129,7 @@ static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
>  	case PMBUS_IIN_OC_WARN_LIMIT:
>  		ret = pmbus_read_word_data(client, page, reg);
>  		ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
> +		break;
>  	case PMBUS_READ_VIN:
>  		ret = pmbus_read_word_data(client, page, PMBUS_READ_VIN);
>  		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);

Just a remark:
the naming of the variable for pmbus_read_word_data() is unfortunate.
It would be nice to have it like below: val

just my 2 cents,
re,
 wh


> @@ -222,6 +223,7 @@ static int ir35221_write_word_data(struct i2c_client *client, int page, int reg,
>  	case PMBUS_IIN_OC_WARN_LIMIT:
>  		val = ir35221_scale_result(word, 1, PSC_CURRENT_IN);
>  		ret = pmbus_write_word_data(client, page, reg, val);
> +		break;
>  	default:
>  		ret = -ENODATA;
>  		break;
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
