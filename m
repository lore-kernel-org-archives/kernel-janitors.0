From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 04 Aug 2016 15:25:00 +0000
Subject: Re: [patch] Input: silead - remove some dead code
Message-Id: <20160804152500.GC5504@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160804052859.GI775@mwanda>
In-Reply-To: <20160804052859.GI775@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Robert Dolca <robert.dolca@intel.com>, Henrik Rydberg <rydberg@bitmath.org>, Hans de Goede <hdegoede@redhat.com>, Daniel Jansen <djaniboe@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 04, 2016 at 08:28:59AM +0300, Dan Carpenter wrote:
> buf[0] is an unsigned char.  touch_nr is an int.  The test for negative
> here doesn't make sense so I have removed it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.

> 
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 5f55167..7379fe1 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -147,9 +147,6 @@ static void silead_ts_read_data(struct i2c_client *client)
>  	}
>  
>  	touch_nr = buf[0];
> -	if (touch_nr < 0)
> -		return;
> -
>  	if (touch_nr > data->max_fingers) {
>  		dev_warn(dev, "More touches reported then supported %d > %d\n",
>  			 touch_nr, data->max_fingers);

-- 
Dmitry
