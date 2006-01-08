From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 08 Jan 2006 23:07:38 +0000
Subject: Re: [KJ] [Patch] Remove MOD_{INC,DEC}_USE_COUNT in pcf8563.c
Message-Id: <200601082307.38608.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1135097000.27486.3.camel@alice>
In-Reply-To: <1135097000.27486.3.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sunday 08 January 2006 21:55, Alexey Dobriyan wrote:
> > =A0static struct file_operations pcf8563_fops =3D {
> > =A0=A0=A0=A0=A0=A0owner: THIS_MODULE,
> > =A0=A0=A0=A0=A0=A0ioctl: pcf8563_ioctl,
> > -=A0=A0=A0=A0=A0open: pcf8563_open,
> > -=A0=A0=A0=A0=A0release: pcf8563_release,
> > +=A0=A0=A0=A0=A0open: nonseekable_open,
>=20
> Why nooseekable_open()?

I think it makes perfect sense for a driver that only has a .ioctl=20
method to forbid lseek, it just doesn't make any sense to allow it.

Actually, I would think this file operations structure could use three
patches in total:

- remove open and release function to get rid of use count misfeature
- add nonseekable_open reference to make lseek fail
- change to C99 struct initializers

Of course, none of these make an actual difference at the moment, but
are steps in the right direction.

	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
