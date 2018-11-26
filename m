From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 26 Nov 2018 16:03:38 +0000
Subject: Re: [PATCH] fsi: occ: fix a NULL vs IS_ERR() check
Message-Id: <88940a85-8271-eeff-ee8d-4e7a2f3ea4cb@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181126081115.hmsplacwvcdvpvxn@kili.mountain>
In-Reply-To: <20181126081115.hmsplacwvcdvpvxn@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 11/26/2018 02:11 AM, Dan Carpenter wrote:
> The platform_device_register_full() function doesn't return NULL, it
> returns error pointers.
>
> Fixes: 4e01f5644463 ("fsi: Add On-Chip Controller (OCC) driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks.

Reviewed-by: Eddie James <eajames@linux.ibm.com>

> ---
>   drivers/fsi/fsi-occ.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index a2301cea1cbb..d8695f67622f 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -546,7 +546,7 @@ static int occ_probe(struct platform_device *pdev)
>
>   	hwmon_dev_info.id = occ->idx;
>   	hwmon_dev = platform_device_register_full(&hwmon_dev_info);
> -	if (!hwmon_dev)
> +	if (IS_ERR(hwmon_dev))
>   		dev_warn(dev, "failed to create hwmon device\n");
>
>   	return 0;
