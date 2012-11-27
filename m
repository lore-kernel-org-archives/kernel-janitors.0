From: Lars-Peter Clausen <lars@metafoo.de>
Date: Tue, 27 Nov 2012 18:41:08 +0000
Subject: Re: [patch] iio:imu: adis16480: show_firmware() buffer too small
Message-Id: <50B50944.2040801@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121127073142.GC8239@elgon.mountain>
In-Reply-To: <20121127073142.GC8239@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/27/2012 08:31 AM, Dan Carpenter wrote:
> Smatch complains that snprintf() returns the number of characters,
> not counting the NUL terminator, which *would* have been printed if
> there were enough space.  In other words the return value could be more
> than sizeof(buf).
> 
> In this case, we are printing something like "ff.ff\n" which is at most
> 6 characters and a NUL so that's not an issue.  I changed snprintf() to
> scnprintf() to silence the warning.
> 
> But since the buffer doesn't include space for the NUL terminator, we
> need to make it bigger or the "\n" will be truncated off.
> 


Thanks,

Acked-By: Lars-Peter Clausen <lars@metafoo.de>

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/iio/imu/adis16480.c b/drivers/iio/imu/adis16480.c
> index a080b35..150d7fa 100644
> --- a/drivers/iio/imu/adis16480.c
> +++ b/drivers/iio/imu/adis16480.c
> @@ -125,7 +125,7 @@ static ssize_t adis16480_show_firmware_revision(struct file *file,
>  		char __user *userbuf, size_t count, loff_t *ppos)
>  {
>  	struct adis16480 *adis16480 = file->private_data;
> -	char buf[6];
> +	char buf[7];
>  	size_t len;
>  	u16 rev;
>  	int ret;
> @@ -134,7 +134,7 @@ static ssize_t adis16480_show_firmware_revision(struct file *file,
>  	if (ret < 0)
>  		return ret;
>  
> -	len = snprintf(buf, sizeof(buf), "%x.%x\n", rev >> 8, rev & 0xff);
> +	len = scnprintf(buf, sizeof(buf), "%x.%x\n", rev >> 8, rev & 0xff);
>  
>  	return simple_read_from_buffer(userbuf, count, ppos, buf, len);
>  }

