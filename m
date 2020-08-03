From: Joe Perches <joe@perches.com>
Date: Mon, 03 Aug 2020 19:35:49 +0000
Subject: Re: [PATCH] gve: Fix the size used in a 'dma_free_coherent()' call
Message-Id: <69b4c4838cb743e24a79f81de487ac2e494843ef.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200802141523.691565-1-christophe.jaillet@wanadoo.fr>
         <20200803084106.050eb7f6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
         <3a25ddc6-adaa-d17d-50f4-8f8ab2ed25eb@wanadoo.fr>
In-Reply-To: <3a25ddc6-adaa-d17d-50f4-8f8ab2ed25eb@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jakub Kicinski <kuba@kernel.org>
Cc: csully@google.com, sagis@google.com, jonolson@google.com, davem@davemloft.net, lrizzo@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2020-08-03 at 21:19 +0200, Christophe JAILLET wrote:
> Le 03/08/2020 =E0 17:41, Jakub Kicinski a =E9crit :
> > On Sun,  2 Aug 2020 16:15:23 +0200 Christophe JAILLET wrote:
> > > Update the size used in 'dma_free_coherent()' in order to match the o=
ne
> > > used in the corresponding 'dma_alloc_coherent()'.
> > >=20
> > > Fixes: 893ce44df5 ("gve: Add basic driver framework for Compute Engin=
e Virtual NIC")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >=20
> > Fixes tag: Fixes: 893ce44df5 ("gve: Add basic driver framework for Comp=
ute Engine Virtual NIC")
> > Has these problem(s):
> > 	- SHA1 should be at least 12 digits long
> > 	  Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
> > 	  or later) just making sure it is not set (or set to "auto").
> >=20
>=20
> Hi,
>=20
> I have git 2.25.1 and core.abbrev is already 12, both in my global=20
> .gitconfig and in the specific .git/gitconfig of my repo.
>=20
> I would have expected checkpatch to catch this kind of small issue.
> Unless I do something wrong, it doesn't.
>=20
> Joe, does it make sense to you and would one of the following patch help?

18 months ago I sent:

https://lore.kernel.org/lkml/40bfc40958fca6e2cc9b86101153aa0715fac4f7.camel=
@perches.com/
