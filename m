From: Toralf =?iso-8859-1?q?F=F6rster?= <toralf.foerster@gmx.de>
Date: Mon, 13 Dec 2010 21:59:04 +0000
Subject: Re: [PATCH] checkpatch.pl: ERROR: spaces required
Message-Id: <201012132259.05317.toralf.foerster@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1292263974-15363-1-git-send-email-toralf.foerster@gmx.de> <AANLkTi=oHyk3AF3eKP3Vm2Ywfb9WcgrurNrkYVKfc588@mail.gmail.com>
In-Reply-To: <AANLkTi=oHyk3AF3eKP3Vm2Ywfb9WcgrurNrkYVKfc588@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Miguel Ojeda wrote at 19:49:43
> 2010/12/13 Toralf F=F6rster <toralf.foerster@gmx.de>:
> > Signed-off-by: Toralf F=F6rster <toralf.foerster@gmx.de>
> > ---
> >  kernel/acct.c |   20 ++++++++++----------
> >  1 files changed, 10 insertions(+), 10 deletions(-)
> >=20
...
> > -       if (value=3D0) return 0;
> > -       while ((s64)value > 0){
> > +       if (value =3D 0) return 0;
>=20
> Newline here. Doesn't checkpatch.pl complain? It is an old rule:
>=20
> http://lxr.linux.no/linux+v2.6.36/Documentation/CodingStyle#L60
>=20
I'd like to do only one thing at a time - not one file at a time.

--=20
MfG/Kind regards
Toralf F=F6rster

pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
