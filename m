From: "Darrick J. Wong" <darrick.wong@oracle.com>
Date: Tue, 03 Mar 2020 15:20:46 +0000
Subject: Re: [PATCH] hwmon: (adt7462) Fix an error return in ADT7462_REG_VOLT()
Message-Id: <20200303152046.GB1752567@magnolia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200303101608.kqjwfcazu2ylhi2a@kili.mountain>
In-Reply-To: <20200303101608.kqjwfcazu2ylhi2a@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 03, 2020 at 01:16:08PM +0300, Dan Carpenter wrote:
> This is only called from adt7462_update_device().  The caller expects it
> to return zero on error.  I fixed a similar issue earlier in commit
> a4bf06d58f21 ("hwmon: (adt7462) ADT7462_REG_VOLT_MAX() should return 0")
> but I missed this one.
> 
> Fixes: c0b4e3ab0c76 ("adt7462: new hwmon driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks ok to me (though I no longer have a machine with a 7462 to test),
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  drivers/hwmon/adt7462.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
> index 9632e2e3c4bb..319a0519ebdb 100644
> --- a/drivers/hwmon/adt7462.c
> +++ b/drivers/hwmon/adt7462.c
> @@ -413,7 +413,7 @@ static int ADT7462_REG_VOLT(struct adt7462_data *data, int which)
>  			return 0x95;
>  		break;
>  	}
> -	return -ENODEV;
> +	return 0;
>  }
>  
>  /* Provide labels for sysfs */
> -- 
> 2.11.0
> 
