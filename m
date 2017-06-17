From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 17 Jun 2017 06:00:38 +0000
Subject: Re: endian bitshift defects [ was: staging: fusb302: don't bitshift __le16 type ]
Message-Id: <alpine.DEB.2.20.1706170753570.2045@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1728941254-1497679239=:2045"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170616174556.2358-1-fransklaver@gmail.com>  <1497653077.10546.23.camel@perches.com>  <alpine.DEB.2.20.1706170722550.2045@hadrien> <1497678601.10546.32.camel@perches.com>
In-Reply-To: <1497678601.10546.32.camel@perches.com>
To: Joe Perches <joe@perches.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Frans Klaver <fransklaver@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao.zhu@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Guru Das Srinagesh <gurooodas@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1728941254-1497679239=:2045
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



On Fri, 16 Jun 2017, Joe Perches wrote:

> On Sat, 2017-06-17 at 07:23 +0200, Julia Lawall wrote:
> > On Fri, 16 Jun 2017, Joe Perches wrote:
> > > On Fri, 2017-06-16 at 19:45 +0200, Frans Klaver wrote:
> > > > The header field in struct pd_message is declared as an __le16 type=
. The
> > > > data in the message is supposed to be little endian. This means we =
don't
> > > > have to go and shift the individual bytes into position when we're
> > > > filling the buffer, we can just copy the contents right away. As an
> > > > added benefit we don't get fishy results on big endian systems anym=
ore.
> > >
> > > Thanks for pointing this out.
> > >
> > > There are several instances of this class of error.
> > >
> > > Here's a cocci script to find them.
> > >
> > > This is best used with cocci's --all-includes option like:
> > >
> > > $ spatch --all-includes --very-quiet --sp-file lebe_bitshifts.cocci .
> > > [ many defects...]
>
> Probably would have been better as [ many possible defects... ]

OK

> > > $ cat lebe_bitshifts.cocci
> > > @@
> > > typedef __le16, __le32, __le64,=A0=A0__be16, __be32, __be64;
> > > { __le16, __le32, __le64,=A0=A0__be16, __be32, __be64 } a;
> > > expression b;
> > > @@
> > >
> > > *	a << b
>
> [etc...]
>
> > Is this always a problem?
>
> No, not always.
>
> If the CPU is the equivalent endian, the bitshift is fine.
> It can't be known if the code is only compiled on a
> single cpu type.  It is rather odd though to use endian
> notation if the code is compiled for a single cpu type.

Is there some way to know from the code if it is compiled for a single cou
type?

> > Would it be useful to add this to the scripts
> > in the kernel?
>
> Maybe.

If there are a lot of false positives, it could be a nuisance...

> btw: is there a way for the operators to be surrounded by
> some \( \| \) or some other bracket style so it could
> be written with a single test?
>
> Something like:
>
> @@
> typedef __le16, __le32, __le64,=A0=A0__be16, __be32, __be64;
> { __le16, __le32, __le64,=A0=A0__be16, __be32, __be64 } a;
> expression b;
> @@
>
> *	a [<<|<<=3D|>>|>>=3D] b

Partly.  You can define

binary operator bop =3D {<<,>>};

or

assignment operator aop =3D {<<=3D,>>=3D};

to make two rules instead of four.

julia
--8323329-1728941254-1497679239=:2045--
