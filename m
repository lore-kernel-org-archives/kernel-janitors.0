From: Tejun Heo <tj@kernel.org>
Date: Thu, 17 Jul 2014 12:36:47 +0000
Subject: Re: [PATCH 1/3] drivers/ata/pata_ep93xx.c: use signed int type for result of platform_get_irq()
Message-Id: <20140717123647.GA21390@htj.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405599203-11113-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405599203-11113-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dcb314@hotmail.com

On Thu, Jul 17, 2014 at 03:13:23PM +0300, Andrey Utkin wrote:
> [linux-3.16-rc5/drivers/ata/pata_ep93xx.c:929]: (style) Checking if unsig=
ned
> variable 'irq' is less than zero.
>=20
> Source code is
>=20
>     irq =3D platform_get_irq(pdev, 0);
>     if (irq < 0) {
>=20
> but
>=20
>     unsigned int irq;
>=20
> $ fgrep platform_get_irq `find . -name \*.h -print`
> ./include/linux/platform_device.h:extern int platform_get_irq(struct
> platform_device *, unsigned int);
>=20
> Now using "int" type instead of "unsigned int" for "irq" variable.
>=20
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80401
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>

Applied to libata/for-3.16-fixes.

Thanks.

--=20
tejun
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
