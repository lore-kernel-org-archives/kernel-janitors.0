From: Guenter Roeck <linux@roeck-us.net>
Date: Mon, 07 Dec 2020 15:51:54 +0000
Subject: Re: [PATCH][next] hwmon: ltc2992: fix less than zero comparisons with an unsigned integer
Message-Id: <20201207155154.GA43526@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207142410.168987-1-colin.king@canonical.com>
In-Reply-To: <20201207142410.168987-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jean Delvare <jdelvare@suse.com>, Alexandru Tachici <alexandru.tachici@analog.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 07, 2020 at 02:24:10PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are several occurrances of a less than zero error check on
> a u32 unsigned integer. These will never be true. Fix this by making
> reg_value a plain int.
> 
> Addresses-Coverity: ("Unsigned comparison against zero")
> Fixes: e126370240e0 ("hwmon: (ltc2992) Add support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ltc2992.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
> index 69dbb5aa5dc2..4382105bf142 100644
> --- a/drivers/hwmon/ltc2992.c
> +++ b/drivers/hwmon/ltc2992.c
> @@ -480,7 +480,7 @@ static int ltc2992_read_gpios_in(struct device *dev, u32 attr, int nr_gpio, long
>  
>  static int ltc2992_read_in_alarm(struct ltc2992_state *st, int channel, long *val, u32 attr)
>  {
> -	u32 reg_val;
> +	int reg_val;
>  	u32 mask;
>  
>  	if (attr = hwmon_in_max_alarm)
> @@ -534,7 +534,7 @@ static int ltc2992_read_in(struct device *dev, u32 attr, int channel, long *val)
>  
>  static int ltc2992_get_current(struct ltc2992_state *st, u32 reg, u32 channel, long *val)
>  {
> -	u32 reg_val;
> +	int reg_val;
>  
>  	reg_val = ltc2992_read_reg(st, reg, 2);
>  	if (reg_val < 0)
> @@ -558,7 +558,7 @@ static int ltc2992_set_current(struct ltc2992_state *st, u32 reg, u32 channel, l
>  
>  static int ltc2992_read_curr_alarm(struct ltc2992_state *st, int channel, long *val, u32 attr)
>  {
> -	u32 reg_val;
> +	int reg_val;
>  	u32 mask;
>  
>  	if (attr = hwmon_curr_max_alarm)
> @@ -609,7 +609,7 @@ static int ltc2992_read_curr(struct device *dev, u32 attr, int channel, long *va
>  
>  static int ltc2992_get_power(struct ltc2992_state *st, u32 reg, u32 channel, long *val)
>  {
> -	u32 reg_val;
> +	int reg_val;
>  
>  	reg_val = ltc2992_read_reg(st, reg, 3);
>  	if (reg_val < 0)
> @@ -633,7 +633,7 @@ static int ltc2992_set_power(struct ltc2992_state *st, u32 reg, u32 channel, lon
>  
>  static int ltc2992_read_power_alarm(struct ltc2992_state *st, int channel, long *val, u32 attr)
>  {
> -	u32 reg_val;
> +	int reg_val;
>  	u32 mask;
>  
>  	if (attr = hwmon_power_max_alarm)
