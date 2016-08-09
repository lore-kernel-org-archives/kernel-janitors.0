From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 09 Aug 2016 13:50:39 +0000
Subject: Re: [patch] mfd: 88pm80x: Double shifting bug in suspend/resume
Message-Id: <20160809135039.GK5243@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160804052656.GG775@mwanda>
In-Reply-To: <20160804052656.GG775@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Qiao Zhou <zhouqiao@marvell.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 04 Aug 2016, Dan Carpenter wrote:

> set_bit() and clear_bit() take the bit number so this code is really
> doing "1 << (1 << irq)" which is a double shift bug.  It's done
> consistently so it won't cause a problem unless "irq" is more than 4.
>=20
> Fixes: 70c6cce04066 ('mfd: Support 88pm80x in 80x driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

> diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.h
> index d409ceb..c118a7e 100644
> --- a/include/linux/mfd/88pm80x.h
> +++ b/include/linux/mfd/88pm80x.h
> @@ -350,7 +350,7 @@ static inline int pm80x_dev_suspend(struct device *de=
v)
>  	int irq =3D platform_get_irq(pdev, 0);
> =20
>  	if (device_may_wakeup(dev))
> -		set_bit((1 << irq), &chip->wu_flag);
> +		set_bit(irq, &chip->wu_flag);
> =20
>  	return 0;
>  }
> @@ -362,7 +362,7 @@ static inline int pm80x_dev_resume(struct device *dev)
>  	int irq =3D platform_get_irq(pdev, 0);
> =20
>  	if (device_may_wakeup(dev))
> -		clear_bit((1 << irq), &chip->wu_flag);
> +		clear_bit(irq, &chip->wu_flag);
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
