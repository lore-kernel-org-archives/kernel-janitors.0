From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 15 Jun 2020 16:18:36 +0000
Subject: Re: [PATCH v2] Input: bma150: fix ref count leak in bma150_open
Message-Id: <3639cbd1-1ddc-2207-b119-b6a45723be04@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-input@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <mccamant@cs.umn.edu>, Qiushi Wu <wu000273@umn.edu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Bakker <xc-racer2@live.ca>, =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>

> in bma150_open, …

* Can the term “reference count” become relevant also for this commit message
  besides other possible adjustments?

* Would you like to add the tag “Fixes”?


…
> +++ b/drivers/input/misc/bma150.c
…
> @@ -357,10 +357,13 @@  static int bma150_open(struct input_dev *input)
>  	if (bma150->mode != BMA150_MODE_NORMAL) {
>  		error = bma150_set_mode(bma150, BMA150_MODE_NORMAL);
>  		if (error)
> -			return error;
> +			goto out;
>  	}
>
>  	return 0;
> +out:
> +	pm_runtime_put_noidle(&bma150->client->dev);
> +	return error;
>  }
…

Perhaps use the label “put_runtime” instead?

Regards,
Markus
