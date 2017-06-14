From: Stefan Wahren <stefan.wahren@i2se.com>
Date: Wed, 14 Jun 2017 17:12:21 +0000
Subject: Re: [PATCH] thermal: bcm2835: fix an error code in probe()
Message-Id: <1228273578.70849.1497460341422@email.1und1.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614091327.GD29394@elgon.mountain>
In-Reply-To: <20170614091327.GD29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Zhang Rui <rui.zhang@intel.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Martin Sperl <kernel@martin.sperl.org>, Eric Anholt <eric@anholt.net>, kernel-janitors@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>, linux-pm@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>


> Dan Carpenter <dan.carpenter@oracle.com> hat am 14. Juni 2017 um 11:13 geschrieben:
> 
> 
> This causes a static checker because we're passing a valid pointer to
> PTR_ERR().  "err" is already the correct error code, so we can just
> delete this line.
> 
> Fixes: bcb7dd9ef206 ("thermal: bcm2835: add thermal driver for bcm2835 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/thermal/broadcom/bcm2835_thermal.c b/drivers/thermal/broadcom/bcm2835_thermal.c
> index 0ecf80890c84..e6863c841662 100644
> --- a/drivers/thermal/broadcom/bcm2835_thermal.c
> +++ b/drivers/thermal/broadcom/bcm2835_thermal.c
> @@ -245,7 +245,6 @@ static int bcm2835_thermal_probe(struct platform_device *pdev)
>  		 */
>  		err = tz->ops->get_trip_temp(tz, 0, &trip_temp);
>  		if (err < 0) {
> -			err = PTR_ERR(tz);
>  			dev_err(&pdev->dev,
>  				"Not able to read trip_temp: %d\n",
>  				err);

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>

Thanks
Stefan
