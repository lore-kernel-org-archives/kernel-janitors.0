From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 06 Oct 2019 15:34:09 +0000
Subject: Re: [PATCH] hwmon: abituguru: make array probe_order static, makes object smaller
Message-Id: <20191006153409.GA7882@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191006145231.24022-1-colin.king@canonical.com>
In-Reply-To: <20191006145231.24022-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Oct 06, 2019 at 03:52:31PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array probe_order on the stack but instead make it
> static. Makes the object code smaller by 94 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   41473	  13448	    320	  55241	   d7c9	drivers/hwmon/abituguru.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   41315	  13512	    320	  55147	   d76b	drivers/hwmon/abituguru.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/abituguru.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
> index a5cf6b2a6e49..681f0623868f 100644
> --- a/drivers/hwmon/abituguru.c
> +++ b/drivers/hwmon/abituguru.c
> @@ -1264,7 +1264,7 @@ static int abituguru_probe(struct platform_device *pdev)
>  	 * El weirdo probe order, to keep the sysfs order identical to the
>  	 * BIOS and window-appliction listing order.
>  	 */
> -	const u8 probe_order[ABIT_UGURU_MAX_BANK1_SENSORS] = {
> +	static const u8 probe_order[ABIT_UGURU_MAX_BANK1_SENSORS] = {
>  		0x00, 0x01, 0x03, 0x04, 0x0A, 0x08, 0x0E, 0x02,
>  		0x09, 0x06, 0x05, 0x0B, 0x0F, 0x0D, 0x07, 0x0C };
>  
