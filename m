From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 03 Jan 2016 17:29:24 +0000
Subject: Re: [PATCH 8/8] rtc-ab-b5ze-s3: Delete an unnecessary variable in _abb5zes3_rtc_set_timer()
Message-Id: <alpine.DEB.2.02.1601031827340.2074@localhost6.localdomain6>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-719743927-1451842165=:2074"
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <5688DF2D.6090204@users.sourceforge.net> <5688E268.9090600@users.sourceforge.net> <alpine.DEB.2.02.1601031345240.2053@localhost6.localdomain6> <56895976.5040009@users.sourceforge.net>
In-Reply-To: <56895976.5040009@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-719743927-1451842165=:2074
Content-Type: TEXT/PLAIN; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable

On Sun, 3 Jan 2016, SF Markus Elfring wrote:

> >>  	ret =3D regmap_update_bits(data->regmap, ABB5ZES3_REG_TIM_CLK,
> >> -				 mask, ABB5ZES3_REG_TIM_CLK_TAC1);
> >> +				 ABB5ZES3_REG_TIM_CLK_TAC0
> >> +				 | ABB5ZES3_REG_TIM_CLK_TAC1,
> >> +				 ABB5ZES3_REG_TIM_CLK_TAC1);
> >=20
> > This doesn't seem like an improvement.
>=20
> Interesting =85
>=20
>=20
> > The concept (mask) has disappeared,
>=20
> I suggest to drop another local variable.
> Can the operator "Bitwise OR" be sufficient to indicate the concept "mask=
"?
>=20
>=20
> > the binary operation is strangely broken,
>=20
> Do you prefer an other source code formatting within the usual line lengt=
h range?
>=20
>=20
> > and the function call has one more line of arguments,
>=20
> How should several long preprocessor symbols be combined together with in=
dentation
> so that they will fit into the limit of 80 characters?
>=20
>=20
> > which all look sort of the same and thus are hard to understand.
>=20
> Is this an usual consequence from an ordinary name pattern?

The original code was better.  No 80 character problem, easy to=20
distinguish one argument from another, moderately meaningful variable=20
name, etc.

julia
--8323328-719743927-1451842165=:2074--
