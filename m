From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 02 Sep 2020 18:15:31 +0000
Subject: Re: [PATCH][next] staging: media: atomisp: fix memory leak of object flash
Message-Id: <CAHp75Vda5jRqmgsCV=Z5e5NdwHiebBy_Xdb6dq2D7L-mqqsC_g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200902165852.201155-1-colin.king@canonical.com>
In-Reply-To: <20200902165852.201155-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>

On Wed, Sep 2, 2020 at 8:02 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> In the case where the call to lm3554_platform_data_func returns an
> error there is a memory leak on the error return path of object
> flash.  Fix this by adding an error return path that will free
> flash and rename labels fail2 to fail3 and fail1 to fail2.
>

Wouldn't be proper fix to move to devm_kmalloc() and return
dev_err_probe() where appropriate?

> Fixes: 9289cdf39992 ("staging: media: atomisp: Convert to GPIO descriptors")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  .../media/atomisp/i2c/atomisp-lm3554.c        | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> index 7ca7378b1859..5516c98f63bc 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> @@ -843,8 +843,10 @@ static int lm3554_probe(struct i2c_client *client)
>                 return -ENOMEM;
>
>         flash->pdata = lm3554_platform_data_func(client);
> -       if (IS_ERR(flash->pdata))
> -               return PTR_ERR(flash->pdata);
> +       if (IS_ERR(flash->pdata)) {
> +               err = PTR_ERR(flash->pdata);
> +               goto fail1;
> +       }
>
>         v4l2_i2c_subdev_init(&flash->sd, client, &lm3554_ops);
>         flash->sd.internal_ops = &lm3554_internal_ops;
> @@ -856,7 +858,7 @@ static int lm3554_probe(struct i2c_client *client)
>                                    ARRAY_SIZE(lm3554_controls));
>         if (ret) {
>                 dev_err(&client->dev, "error initialize a ctrl_handler.\n");
> -               goto fail2;
> +               goto fail3;
>         }
>
>         for (i = 0; i < ARRAY_SIZE(lm3554_controls); i++)
> @@ -865,14 +867,14 @@ static int lm3554_probe(struct i2c_client *client)
>
>         if (flash->ctrl_handler.error) {
>                 dev_err(&client->dev, "ctrl_handler error.\n");
> -               goto fail2;
> +               goto fail3;
>         }
>
>         flash->sd.ctrl_handler = &flash->ctrl_handler;
>         err = media_entity_pads_init(&flash->sd.entity, 0, NULL);
>         if (err) {
>                 dev_err(&client->dev, "error initialize a media entity.\n");
> -               goto fail1;
> +               goto fail2;
>         }
>
>         flash->sd.entity.function = MEDIA_ENT_F_FLASH;
> @@ -884,14 +886,15 @@ static int lm3554_probe(struct i2c_client *client)
>         err = lm3554_gpio_init(client);
>         if (err) {
>                 dev_err(&client->dev, "gpio request/direction_output fail");
> -               goto fail2;
> +               goto fail3;
>         }
>         return atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
> -fail2:
> +fail3:
>         media_entity_cleanup(&flash->sd.entity);
>         v4l2_ctrl_handler_free(&flash->ctrl_handler);
> -fail1:
> +fail2:
>         v4l2_device_unregister_subdev(&flash->sd);
> +fail1:
>         kfree(flash);
>
>         return err;
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
