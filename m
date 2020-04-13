From: Joe Perches <joe@perches.com>
Date: Mon, 13 Apr 2020 07:15:53 +0000
Subject: Re: [PATCH] net: mvneta: Fix a typo
Message-Id: <f1033e80969fce39d9cc97fb924f7d68e5f96f74.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200412212034.4532-1-christophe.jaillet@wanadoo.fr>
         <6ecfa6cb686af1452101c0b727c9eb34d5582610.camel@perches.com>
         <eea1b700-4559-c8d1-1960-1858ed3d90ef@wanadoo.fr>
In-Reply-To: <eea1b700-4559-c8d1-1960-1858ed3d90ef@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, thomas.petazzoni@bootlin.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2020-04-13 at 08:56 +0200, Christophe JAILLET wrote:
> Le 12/04/2020 =E0 23:35, Joe Perches a =E9crit :
> > On Sun, 2020-04-12 at 23:20 +0200, Christophe JAILLET wrote:
> > > s/mvmeta/mvneta/
> > nice. how did you find this?
>=20
> Hi,
>=20
> This is based on a bash script I've made a while ago (see [1])
> I've slightly updated it, but the idea is still the same. I search=20
> strings in a file with some variation on the file name (2 inverted=20
> chars, 1 missing char or 1 modified char).
>=20
> The output is horrible, and a lot of filtering should be done.
> It is much like noise, with MANY false positives. But I manage to dig=20
> some interesting stuff out of it.
>=20
> If interested in the updated script, just ask, but except the concept=20
> itself, I'm not sure than anything else worth anything and is should be=20
> rewritten from scratch.
>=20
> The update includes some tweaks in order to search into Kconfig files=20
> instead.
>=20
> CJ
>=20
> [1]: https://marc.info/?l=3Dkernel-janitors&m=156382201306781&w=3D4

Nice.

I was wondering if you used levenshtein distance or something else.

https://en.wikipedia.org/wiki/Levenshtein_distance
