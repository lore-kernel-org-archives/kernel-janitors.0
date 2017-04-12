From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Apr 2017 10:39:08 +0000
Subject: Re: [PATCH 2/2] hwmon: (tacho) Remove an unused variable
Message-Id: <CACPK8XcBAibmvN+xKqSWpP_benEYx7QRR8KgAdWsxszwY5n0hg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170410134703.GB1918@mwanda>
In-Reply-To: <20170410134703.GB1918@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Apr 10, 2017 at 11:17 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> We never use this global variable.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Joel Stanley <joel@jms.id.au>

>
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 2f22add5c73b..b96fff50a3ee 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -153,8 +153,6 @@
>  #define M_TACH_UNIT 0x1000
>  #define INIT_FAN_CTRL 0xFF
>
> -void __iomem *regs;
> -
>  struct aspeed_pwm_tacho_data {
>         struct regmap *regmap;
>         unsigned long clk_freq;
