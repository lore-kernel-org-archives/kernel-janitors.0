From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Apr 2020 08:40:13 +0000
Subject: Re: [PATCH][next] rtc: ds1307: check for failed memory allocation on wdt
Message-Id: <20200403084013.GY2001@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402131441.539088-1-colin.king@canonical.com>
In-Reply-To: <20200402131441.539088-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Guenter Roeck <linux@roeck-us.net>, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 02, 2020 at 02:14:41PM +0100, Colin King wrote:
> @@ -1979,9 +1984,9 @@ static int ds1307_probe(struct i2c_client *client,
>  
>  	ds1307_hwmon_register(ds1307);
>  	ds1307_clks_register(ds1307);
> -	ds1307_wdt_register(ds1307);
> +	err = ds1307_wdt_register(ds1307);
>  
> -	return 0;
> +	return err;
>  
>  exit:
>  	return err;

This bit is weird.  I guess just delete the "return 0;" without
introducing a new "return err;".

regards,
dan carpenter
