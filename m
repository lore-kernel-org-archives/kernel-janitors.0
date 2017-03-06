From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 06 Mar 2017 13:17:38 +0000
Subject: Re: [PATCH] HID: i2c-hid: Fix error handling
Message-Id: <alpine.LSU.2.20.1703061416160.31814@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170219120759.11162-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170219120759.11162-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: benjamin.tissoires@redhat.com, briannorris@chromium.org, dianders@chromium.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 19 Feb 2017, Christophe JAILLET wrote:

> According to error handling in this function, it is likely that some
> resources should be freed before returning.
> Replace 'return ret', with 'goto err'.
> 
> While at it, remove some spaces at the beginning of the lines to be more
> consistent.
> 
> 
> Fixes: ead0687fe304a ("HID: i2c-hid: support regulator power on/off")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/hid/i2c-hid/i2c-hid.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid.c b/drivers/hid/i2c-hid/i2c-hid.c
> index d5288f3fb5ee..1a57ac2d8524 100644
> --- a/drivers/hid/i2c-hid/i2c-hid.c
> +++ b/drivers/hid/i2c-hid/i2c-hid.c
> @@ -1058,13 +1058,13 @@ static int i2c_hid_probe(struct i2c_client *client,
>  	}
>  
>  	ihid->pdata.supply = devm_regulator_get(&client->dev, "vdd");
> - 	if (IS_ERR(ihid->pdata.supply)) {
> - 		ret = PTR_ERR(ihid->pdata.supply);
> - 		if (ret != -EPROBE_DEFER)
> - 			dev_err(&client->dev, "Failed to get regulator: %d\n",
> - 				ret);
> - 		return ret;
> - 	}
> +	if (IS_ERR(ihid->pdata.supply)) {
> +		ret = PTR_ERR(ihid->pdata.supply);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&client->dev, "Failed to get regulator: %d\n",
> +				ret);
> +		goto err;
> +	}

I don't see any spaces at the beginning of lines in the version that's in 
my tree ... o_O?

Therefore I've converted this patch into simple 'return ret -> goto err' 
transformation and applied on top for-4.12/i2c-hid.

Thanks,

-- 
Jiri Kosina
SUSE Labs

