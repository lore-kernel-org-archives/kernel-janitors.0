From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Wed, 17 Oct 2012 11:54:20 +0000
Subject: Re: [ukl:efm32 14/19] io.c:(.text+0x12b8): undefined reference to `unwind_backtrace'
Message-Id: <20121017115420.GV639@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121017113610.GA26182@localhost>
In-Reply-To: <20121017113610.GA26182@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hello,

On Wed, Oct 17, 2012 at 07:36:10PM +0800, Fengguang Wu wrote:
> Hi Uwe,
>=20
> FYI, kernel build failed on
Thanks for testing.
=20
> tree:   git://git.pengutronix.de/git/ukl/linux efm32
> head:   ace35988f9089852b4d7278442ead682fb1fe7a7
> commit: 304b1a8cda3ba8a550a9b2568e027d09bbf65829 [14/19] HACK! make stack=
 dumps provoked by BUG a bit more helpful
> config: arm-imx_v6_v7_defconfig # make ARCH=3Darm imx_v6_v7_defconfig
>=20
> All error/warnings:
>=20
> arch/arm/kernel/built-in.o: In function `show_regs':
> io.c:(.text+0x12b8): undefined reference to `unwind_backtrace'
I'm quite aware that commit 304b1a8cd is bad. That's why it's prefixed
with "HACK!". Also even if you can compile a kernel with

	e97f732 HACK! ARM: no, we don't enter in ARM

it won't run on anything because it changes how the kernel must be
entered.

I don't know why you picked the efm32 branch of my tree, but note that
obviously it is not meant to be included in mainline as is. If you want
to do some testing, better pick my for-next branch.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
