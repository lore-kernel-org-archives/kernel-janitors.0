From: Daniel Mack <zonque@gmail.com>
Date: Fri, 21 Sep 2012 21:20:41 +0000
Subject: Re: [broonie-misc:spi-next 28/43] drivers/spi/spi-gpio.c:389:79: error: parameter name omitted
Message-Id: <505CDA29.5080202@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120920212248.GA5446@localhost>
In-Reply-To: <20120920212248.GA5446@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 20.09.2012 23:22, Fengguang Wu wrote:
> Hi Daniel,
>=20
> FYI, kernel build failed on
>=20
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git sp=
i-next
> head:   337c422cf74b1ae46969395847795de953e66958
> commit: 38ab18caa0ad9c844ba60f9618c5de6d6954da3e [28/43] spi: spi-gpio: A=
dd DT bindings
> config: x86_64-allmodconfig
>=20
> All related error/warning messages:
>=20
> drivers/spi/spi-gpio.c: In function 'spi_gpio_setup':
> drivers/spi/spi-gpio.c:255:8: warning: cast from pointer to integer of di=
fferent size [-Wpointer-to-int-cast]
> drivers/spi/spi-gpio.c: In function 'spi_probe_dt':
> drivers/spi/spi-gpio.c:389:79: error: parameter name omitted
> drivers/spi/spi-gpio.c: In function 'spi_gpio_probe':
> drivers/spi/spi-gpio.c:404:2: error: implicit declaration of function 'sp=
i_gpio_probe_dt' [-Werror=3Dimplicit-function-declaration]
> cc1: some warnings being treated as errors
>=20
> vim +389 drivers/spi/spi-gpio.c
>    383=09
>    384	error_free:
>    385		devm_kfree(&pdev->dev, pdata);
>    386		return ret;
>    387	}
>    388	#else
>  > 389	static inline int spi_probe_dt(struct platform_device *)
>    390	{
>    391		return 0;
>    392	}

Yes, I'm sorry about that. Mark already kindly fixed this one for me
some weeks ago:


https://git.kernel.org/?p=3Dlinux/kernel/git/broonie/misc.git;a=3Dcommit;h=
=AC2cb30b479


Daniel

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
