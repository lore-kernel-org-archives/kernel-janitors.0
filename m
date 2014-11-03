From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 03 Nov 2014 12:28:28 +0000
Subject: Re: [patch] mfd: wm8350: fix a printk
Message-Id: <20141103122828.GC4538@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141029161118.GG5290@mwanda>
In-Reply-To: <20141029161118.GG5290@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, 29 Oct 2014, Charles Keepax wrote:

> On Wed, Oct 29, 2014 at 07:11:18PM +0300, Dan Carpenter wrote:
> > There is a precedence bug here because >> has higher precedence than &
> > so we end up printing the wrong mode.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >=20
>=20
> Looks like Joe already been you to the punch on this one:
>=20
> https://lkml.org/lkml/2014/10/27/36
>=20
> Although I don't really mind which one Lee applies :-) so:

I'm going to apply Joe's patch.

> Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
>=20
> Thanks,
> Charles

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
