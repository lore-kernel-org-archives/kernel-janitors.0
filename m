From: Finn Thain <fthain@telegraphics.com.au>
Date: Sun, 10 May 2020 08:25:36 +0000
Subject: Re: [PATCH] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <alpine.LNX.2.22.394.2005101738510.11@nippy.intranet>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-1463811774-1457853207-1589099136=:11"
List-Id: <kernel-janitors.vger.kernel.org>
References: <b7651b26-ac1e-6281-efb2-7eff0018b158@web.de> <alpine.LNX.2.22.394.2005100922240.11@nippy.intranet> <9d279f21-6172-5318-4e29-061277e82157@web.de>
In-Reply-To: <9d279f21-6172-5318-4e29-061277e82157@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1457853207-1589099136=:11
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 10 May 2020, Markus Elfring wrote:

> Christophe Jaillet proposed to complete the exception handling also for t=
his
> function implementation.
> I find that such a software correction is qualified for this tag.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?id=3De99332e7b4cda6e60f5b5916cf=
9943a79dbef902#n183
>=20
> Corresponding consequences can vary then according to the change=20
> management of involved developers.
>=20

Makes sense.

> > I think 'undo_probe1' is both descriptive and consistent with commit=20
> > 10e3cc180e64 ("net/sonic: Fix a resource leak in an error handling=20
> > path in 'jazz_sonic_probe()'").
>=20
> I can agree to this view (in principle).
>=20
> By the way:
> The referenced commit contains the tag =E2=80=9CFixes=E2=80=9D.
> https://lore.kernel.org/patchwork/patch/1231354/
> https://lore.kernel.org/lkml/20200427061803.53857-1-christophe.jaillet@wa=
nadoo.fr/
>=20

Right, I'd forgotten that. Do you know when these bugs were introduced?

> > Your suggestion, 'free_dma' is also good.
>=20
> Thanks for your positive feedback.
>=20
>=20
> > But coming up with good alternatives is easy.
>=20
> But the change acceptance can occasionally become harder.
>=20

The path to patch acceptance often takes surprising turns.

>=20
> > If every good alternative would be considered there would be no=20
> > obvious way to get a patch merged.
>=20
> I imagine that some alternatives can result in preferable solutions,=20
> can't they?

Naming goto labels is just painting another bikeshed. Yes, some=20
alternatives are preferable but it takes too long to identify them and=20
finding consensus is unlikely anyway, as it's a matter of taste.
---1463811774-1457853207-1589099136=:11--
