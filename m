From: Lee Jones <lee.jones@linaro.org>
Date: Wed, 24 Jun 2015 08:31:36 +0000
Subject: Re: [PATCH v2] mfd: 88pm80x: refine irq bit operation
Message-Id: <20150624083136.GC15013@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433667784-27869-1-git-send-email-zhouqiao@marvell.com>
In-Reply-To: <1433667784-27869-1-git-send-email-zhouqiao@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, 07 Jun 2015, Qiao Zhou wrote:

> Set_bit/clear_bit for wu_flag may be corrupted if irq > 5(or 6 for
> aarch64). The maximum irq number from 88pm80x chip series is 24.
> Here we refine the code to protect the potential memory corruption.
>=20
> Also change wu_flag to wakeup_flag for easier understanding.
>=20
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Qiao Zhou <zhouqiao@marvell.com>
> ---
>  drivers/input/misc/88pm80x_onkey.c | 2 +-
>  drivers/mfd/88pm80x.c              | 4 ++--
>  drivers/rtc/rtc-88pm80x.c          | 2 +-
>  include/linux/mfd/88pm80x.h        | 9 ++++++---
>  4 files changed, 10 insertions(+), 7 deletions(-)

For my own reference:
 Acked-by: Lee Jones <lee.jones@linaro.org>

... but I need Acks for Input and RTC before I can merge the patch.

> diff --git a/drivers/input/misc/88pm80x_onkey.c b/drivers/input/misc/88pm=
80x_onkey.c
> index cf9908f..b1fd83c 100644
> --- a/drivers/input/misc/88pm80x_onkey.c
> +++ b/drivers/input/misc/88pm80x_onkey.c
> @@ -76,7 +76,7 @@ static int pm80x_onkey_probe(struct platform_device *pd=
ev)
>  	info->pm80x =3D chip;
> =20
>  	info->irq =3D platform_get_irq(pdev, 0);
> -	if (info->irq < 0) {
> +	if (info->irq < 0 || info->irq >=3D PM80X_MAX_IRQ) {
>  		dev_err(&pdev->dev, "No IRQ resource!\n");
>  		err =3D -EINVAL;
>  		goto out;
> diff --git a/drivers/mfd/88pm80x.c b/drivers/mfd/88pm80x.c
> index 5e72f65..e1d803a 100644
> --- a/drivers/mfd/88pm80x.c
> +++ b/drivers/mfd/88pm80x.c
> @@ -136,7 +136,7 @@ static int pm80x_suspend(struct device *dev)
>  	struct i2c_client *client =3D container_of(dev, struct i2c_client, dev);
>  	struct pm80x_chip *chip =3D i2c_get_clientdata(client);
> =20
> -	if (chip && chip->wu_flag)
> +	if (chip && chip->wakeup_flag)
>  		if (device_may_wakeup(chip->dev))
>  			enable_irq_wake(chip->irq);
> =20
> @@ -148,7 +148,7 @@ static int pm80x_resume(struct device *dev)
>  	struct i2c_client *client =3D container_of(dev, struct i2c_client, dev);
>  	struct pm80x_chip *chip =3D i2c_get_clientdata(client);
> =20
> -	if (chip && chip->wu_flag)
> +	if (chip && chip->wakeup_flag)
>  		if (device_may_wakeup(chip->dev))
>  			disable_irq_wake(chip->irq);
> =20
> diff --git a/drivers/rtc/rtc-88pm80x.c b/drivers/rtc/rtc-88pm80x.c
> index 7df0579..d53fa18 100644
> --- a/drivers/rtc/rtc-88pm80x.c
> +++ b/drivers/rtc/rtc-88pm80x.c
> @@ -268,7 +268,7 @@ static int pm80x_rtc_probe(struct platform_device *pd=
ev)
>  	if (!info)
>  		return -ENOMEM;
>  	info->irq =3D platform_get_irq(pdev, 0);
> -	if (info->irq < 0) {
> +	if (info->irq < 0 || info->irq >=3D PM80X_MAX_IRQ) {
>  		dev_err(&pdev->dev, "No IRQ resource!\n");
>  		ret =3D -EINVAL;
>  		goto out;
> diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.h
> index 97cb283..60cff11 100644
> --- a/include/linux/mfd/88pm80x.h
> +++ b/include/linux/mfd/88pm80x.h
> @@ -276,6 +276,9 @@ enum {
>  #define PM805_EARPHONE_SETTING			(0x29)
>  #define PM805_AUTO_SEQ_SETTING			(0x2A)
> =20
> +/* supported 24 sub-irq */
> +#define PM80X_MAX_IRQ			24
> +
>  struct pm80x_rtc_pdata {
>  	int		vrtc;
>  	int		rtc_wakeup;
> @@ -301,7 +304,7 @@ struct pm80x_chip {
>  	int type;
>  	int irq;
>  	int irq_mode;
> -	unsigned long wu_flag;
> +	unsigned long wakeup_flag;
>  	spinlock_t lock;
>  };
> =20
> @@ -349,7 +352,7 @@ static inline int pm80x_dev_suspend(struct device *de=
v)
>  	int irq =3D platform_get_irq(pdev, 0);
> =20
>  	if (device_may_wakeup(dev))
> -		set_bit((1 << irq), &chip->wu_flag);
> +		set_bit(irq, &chip->wakeup_flag);
> =20
>  	return 0;
>  }
> @@ -361,7 +364,7 @@ static inline int pm80x_dev_resume(struct device *dev)
>  	int irq =3D platform_get_irq(pdev, 0);
> =20
>  	if (device_may_wakeup(dev))
> -		clear_bit((1 << irq), &chip->wu_flag);
> +		clear_bit(irq, &chip->wakeup_flag);
> =20
>  	return 0;
>  }

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
