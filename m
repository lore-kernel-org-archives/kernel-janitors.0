From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 28 Mar 2005 23:56:42 +0000
Subject: Re: [KJ] Elimiation of isa_read* functions.
Message-Id: <200503290156.43874.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42477A1D.7040803@bureau-13.org>
In-Reply-To: <42477A1D.7040803@bureau-13.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Maandag 28 M=E4rz 2005 05:29, Daniel E. Wilson wrote:
> This is my first attempt at cleaning up something so I decided to try
> something really simple.

Welcome on board!

I wonder if there is an FAQ for kernel-janitors somewhere, it might
be easier to point you there.

> The lance.c file is using the depreciated isa_readw and isa_readl functio=
ns.
>=20
> remap.patch

Unless your mail program is broken, submit patches inline instead of as
attachments. The text should contain a Signed-off-by: line, see also
linux/Documentation/SubmittingPatches.
=20
> diff -Nrc a/drivers/net/lance.c b/drivers/net/lance.c
> *** a/drivers/net/lance.c=A0=A0=A0=A0=A0=A0=A02005-03-27 19:14:39 -08:00
> --- b/drivers/net/lance.c=A0=A0=A0=A0=A0=A0=A02005-03-27 19:14:39 -08:00
> ***************


You should always use the unified diff format (diff -u) for
patches you submit. That's what everyone expects to read.


> =A0 =A0=A0=A0=A0=A0=A0static int did_version;=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0/* Already printed version info. */
> =A0 =A0=A0=A0=A0=A0=A0unsigned long flags;
> =A0 =A0=A0=A0=A0=A0=A0int err =3D -ENOMEM;
> + =A0=A0=A0=A0=A0=A0char *base_addr;=A0=A0=A0=A0=A0=A0=A0=A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* Base address in the BIOS. */
> =A0

This needs to be 'char __iomem *base_addr;', otherwise sparse will produce
warnings for your code.

Thanks,

        Arnd <><

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
