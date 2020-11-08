From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 08 Nov 2020 03:36:50 +0000
Subject: Re: [PATCH][next] hwmon: corsair-psu: fix unintentional sign extension issue
Message-Id: <20201108033650.GA133578@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201105115019.41735-1-colin.king@canonical.com>
In-Reply-To: <20201105115019.41735-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 05, 2020 at 11:50:19AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The shifting of the u8 integer data[3] by 24 bits to the left will
> be promoted to a 32 bit signed int and then sign-extended to a
> long. In the event that the top bit of data[3] is set then all
> then all the upper 32 bits of a 64 bit long end up as also being
> set because of the sign-extension. Fix this by casting data[3] to
> a long before the shift.
> 
> Addresses-Coverity: ("Unintended sign extension")
> Fixes: ce15cd2cee8b ("hwmon: add Corsair PSU HID controller driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I wasn't sure if I am going to get another version of this patch.
Either case, I applied this now.

Guenter

> ---
>  drivers/hwmon/corsair-psu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index e92d0376e7ac..5d19a888231a 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -241,7 +241,7 @@ static int corsairpsu_get_value(struct corsairpsu_data *priv, u8 cmd, u8 rail, l
>  	 * the LINEAR11 conversion are the watts values which are about 1200 for the strongest psu
>  	 * supported (HX1200i)
>  	 */
> -	tmp = (data[3] << 24) + (data[2] << 16) + (data[1] << 8) + data[0];
> +	tmp = ((long)data[3] << 24) + (data[2] << 16) + (data[1] << 8) + data[0];
>  	switch (cmd) {
>  	case PSU_CMD_IN_VOLTS:
>  	case PSU_CMD_IN_AMPS:
