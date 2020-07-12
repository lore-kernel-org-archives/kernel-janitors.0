From: Joe Perches <joe@perches.com>
Date: Sun, 12 Jul 2020 06:32:45 +0000
Subject: Re: [PATCH] net: sky2: switch from 'pci_' to 'dma_' API
Message-Id: <866325009f9ae73b3a563dd745f901260a372242.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711204944.259152-1-christophe.jaillet@wanadoo.fr>
         <2181026e68d2948c396cc7a7b6bfb7146c1cd5f6.camel@perches.com>
         <8a3e5514-9cc9-18f3-9a98-81007419a20a@wanadoo.fr>
In-Reply-To: <8a3e5514-9cc9-18f3-9a98-81007419a20a@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mlindner@marvell.com, stephen@networkplumber.org, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2020-07-12 at 08:29 +0200, Christophe JAILLET wrote:
> Le 11/07/2020 =E0 23:20, Joe Perches a =E9crit :
> > On Sat, 2020-07-11 at 22:49 +0200, Christophe JAILLET wrote:
> > > The wrappers in include/linux/pci-dma-compat.h should go away.
> > why?
> >=20
> >=20
>  From Christoph Hellwig=20
> https://marc.info/?l=3Dkernel-janitors&m=158745678307186&w=3D4

There's no why there.
There's just an assertion a wrapper should "go away".

"the wrappers in include/linux/pci-dma-compat.h should go away"

wrappers aren't all bad.
