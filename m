From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 17 Jun 2017 05:23:38 +0000
Subject: Re: endian bitshift defects [ was: staging: fusb302: don't bitshift __le16 type ]
Message-Id: <alpine.DEB.2.20.1706170722550.2045@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1575079896-1497677019=:2045"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170616174556.2358-1-fransklaver@gmail.com> <1497653077.10546.23.camel@perches.com>
In-Reply-To: <1497653077.10546.23.camel@perches.com>
To: Joe Perches <joe@perches.com>
Cc: Frans Klaver <fransklaver@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao.zhu@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Guru Das Srinagesh <gurooodas@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1575079896-1497677019=:2045
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



On Fri, 16 Jun 2017, Joe Perches wrote:

> On Fri, 2017-06-16 at 19:45 +0200, Frans Klaver wrote:
> > The header field in struct pd_message is declared as an __le16 type. The
> > data in the message is supposed to be little endian. This means we don't
> > have to go and shift the individual bytes into position when we're
> > filling the buffer, we can just copy the contents right away. As an
> > added benefit we don't get fishy results on big endian systems anymore.
>
> Thanks for pointing this out.
>
> There are several instances of this class of error.
>
> Here's a cocci script to find them.
>
> This is best used with cocci's --all-includes option like:
>
> $ spatch --all-includes --very-quiet --sp-file lebe_bitshifts.cocci .
> [ many defects...]
>
> $ cat lebe_bitshifts.cocci
> @@
> typedef __le16, __le32, __le64,=A0=A0__be16, __be32, __be64;
> { __le16, __le32, __le64,=A0=A0__be16, __be32, __be64 } a;
> expression b;
> @@
>
> *	a << b
>
> @@
> { __le16, __le32, __le64,=A0=A0__be16, __be32, __be64 } a;
> expression b;
> @@
>
> *	a <<=3D b
>
> @@
> { __le16, __le32, __le64,=A0=A0__be16, __be32, __be64 } a;
> expression b;
> @@
>
> *	a >> b
>
> @@
> { __le16, __le32, __le64,=A0=A0__be16, __be32, __be64 } a;
> expression b;
> @@
>
> *	a >>=3D b

Is this always a problem?  Would it be useful to add this to the scripts
in the kernel?

julia
--8323329-1575079896-1497677019=:2045--
