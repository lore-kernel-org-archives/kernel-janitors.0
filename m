From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 May 2005 08:33:08 +0000
Subject: Re: [KJ] GCC4 cleanup question
Message-Id: <200505301033.08717.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4297ECD9.2060505@gmail.com>
In-Reply-To: <4297ECD9.2060505@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On S=FCnnavend 28 Mai 2005 08:25, Bongani Hlope wrote:
> I don't have GCC4, the first rth is initialised inside the __mkroute_inpu=
t=20
> function and the second one is initialised in the __mkroute_output functi=
on.=20
> I don't know why gcc is giving those warings.=20

__mkroute_{in,out}put does not initialize *result if it returns early.

> --- net/ipv4/route.c.old =A0 =A0 =A0 =A02005-05-18 21:18:19.000000000 +02=
00
> +++ net/ipv4/route.c =A0 =A02005-05-28 08:23:18.000000000 +0200
> @@ -1767,7 +1767,7 @@ static inline int ip_mkroute_input_def(s
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0struct in_device *in_dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0u32 daddr, u32 saddr, u32 tos)
> =A0{
> - =A0 =A0 =A0 struct rtable* rth;
> + =A0 =A0 =A0 struct rtable* rth =3D NULL;
> =A0 =A0 =A0 =A0 int err;
> =A0 =A0 =A0 =A0 unsigned hash;
>=20

We've already had that discussion. Don't initialize it to a bogus value
in the declaration, but make sure it always gets set in the function
that is responsible for initializing it (__mkroute_input in this case).

	Arnd <><

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
