From: Bryan Wu <bryan.wu@canonical.com>
Date: Wed, 12 Sep 2012 06:06:14 +0000
Subject: Re: [PATCH] leds-lm3530: Fix smatch warnings
Message-Id: <CAK5ve-LdwE+AnniQPy_i6=XQevu6+Kzp78XGmzxKsWxxo-wK+Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 12, 2012 at 2:01 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Fixes the following smatch warnings:
> drivers/leds/leds-lm3530.c:361 lm3530_mode_set() info:
> why not propagate 'mode' from lm3530_get_mode_from_str() instead of -22?
> drivers/leds/leds-lm3530.c:432 lm3530_probe() info:
> why not propagate 'err' from lm3530_init_registers() instead of -19?
> drivers/leds/leds-lm3530.c:438 lm3530_probe() info:
> why not propagate 'err' from led_classdev_register() instead of -19?
>
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Cc: Shreshtha Kumar SAHU <shreshthakumar.sahu@stericsson.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/leds/leds-lm3530.c |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
> index 1e7ed2a..db1de54 100644
> --- a/drivers/leds/leds-lm3530.c
> +++ b/drivers/leds/leds-lm3530.c
> @@ -150,7 +150,7 @@ static int lm3530_get_mode_from_str(const char *str)
>                 if (sysfs_streq(str, mode_map[i].mode))
>                         return mode_map[i].mode_val;
>
> -       return -1;
> +       return -EINVAL;
>  }
>
>  static void lm3530_als_configure(struct lm3530_platform_data *pdata,
> @@ -358,7 +358,7 @@ static ssize_t lm3530_mode_set(struct device *dev, struct device_attribute
>         mode = lm3530_get_mode_from_str(buf);
>         if (mode < 0) {
>                 dev_err(dev, "Invalid mode\n");
> -               return -EINVAL;
> +               return mode;
>         }
>
>         drvdata->mode = mode;
> @@ -426,16 +426,16 @@ static int __devinit lm3530_probe(struct i2c_client *client,
>
>         if (drvdata->pdata->brt_val) {
>                 err = lm3530_init_registers(drvdata);
> -               if (err < 0) {
> +               if (err) {

I'm not sure we need this change here.

>                         dev_err(&client->dev,
>                                 "Register Init failed: %d\n", err);
> -                       return -ENODEV;
> +                       return err;
>                 }
>         }
>         err = led_classdev_register(&client->dev, &drvdata->led_dev);
>         if (err < 0) {
>                 dev_err(&client->dev, "Register led class failed: %d\n", err);
> -               return -ENODEV;
> +               return err;
>         }
>
>         err = device_create_file(drvdata->led_dev.dev, &dev_attr_mode);
> --
> 1.7.4.1
>



-- 
Bryan Wu <bryan.wu@canonical.com>
Kernel Developer    +86.186-168-78255 Mobile
Canonical Ltd.      www.canonical.com
Ubuntu - Linux for human beings | www.ubuntu.com
