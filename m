From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Dec 2017 05:38:29 +0000
Subject: Re: [PATCH v1 05/10] staging: atomisp: Remove non-ACPI leftovers
Message-Id: <20171220053828.5wphhl6oc2sl3su5@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171219205957.10933-1-andriy.shevchenko@linux.intel.com>
 <20171219205957.10933-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20171219205957.10933-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, kernel-janitors@vger.kernel.org
Cc: Alan Cox <alan@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, Kristian Beilke <beilke@posteo.de>

On Tue, Dec 19, 2017 at 10:59:52PM +0200, Andy Shevchenko wrote:
> @@ -914,9 +904,7 @@ static int lm3554_probe(struct i2c_client *client)
>  		dev_err(&client->dev, "gpio request/direction_output fail");
>  		goto fail2;
>  	}
> -	if (ACPI_HANDLE(&client->dev))
> -		err = atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
> -	return 0;
> +	return atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
>  fail2:
>  	media_entity_cleanup(&flash->sd.entity);
>  	v4l2_ctrl_handler_free(&flash->ctrl_handler);

Actually every place where we directly return a function call is wrong
and needs error handling added.  I've been meaning to write a Smatch
check for this because it's a common anti-pattern we don't check the
last function call for errors.

Someone could probably do the same in Coccinelle if they want.

regards,
dan carpenter

