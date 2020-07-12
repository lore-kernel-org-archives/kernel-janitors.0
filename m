From: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 12 Jul 2020 07:05:13 +0000
Subject: Re: [PATCH] net: sky2: switch from 'pci_' to 'dma_' API
Message-Id: <alpine.DEB.2.22.394.2007120902170.2424@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-794464576-1594537513=:2424"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711204944.259152-1-christophe.jaillet@wanadoo.fr> <2181026e68d2948c396cc7a7b6bfb7146c1cd5f6.camel@perches.com> <8a3e5514-9cc9-18f3-9a98-81007419a20a@wanadoo.fr> <866325009f9ae73b3a563dd745f901260a372242.camel@perches.com>
 <a0d0ad2b-8b21-3842-cf2b-1d46274bbe7a@wanadoo.fr>
In-Reply-To: <a0d0ad2b-8b21-3842-cf2b-1d46274bbe7a@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Joe Perches <joe@perches.com>, mlindner@marvell.com, stephen@networkplumber.org, davem@davemloft.net, kuba@kernel.org, hch@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-794464576-1594537513=:2424
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sun, 12 Jul 2020, Christophe JAILLET wrote:

> Le 12/07/2020 à 08:32, Joe Perches a écrit :
> > On Sun, 2020-07-12 at 08:29 +0200, Christophe JAILLET wrote:
> > > Le 11/07/2020 à 23:20, Joe Perches a écrit :
> > > > On Sat, 2020-07-11 at 22:49 +0200, Christophe JAILLET wrote:
> > > > > The wrappers in include/linux/pci-dma-compat.h should go away.
> > > > why?
> > > >
> > > >
> > >   From Christoph Hellwig
> > > https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
> > There's no why there.
> > There's just an assertion a wrapper should "go away".
> >
> > "the wrappers in include/linux/pci-dma-compat.h should go away"
> >
> > wrappers aren't all bad.
> >
> >
> Adding Christoph Hellwig to shed some light.

Neither the wrapped name nor the unwrapped name is higher or lower level.
Nothing much happens to the arguments.  The wrappers and the wrapped
functions are not used entirely consistently, eg some files, and perhaps
even some functions, use a mixture of the two.  There a set of confusingly
named constants associated with the two sets of functions, and these
constants are also not always used consistently.

julia
--8323329-794464576-1594537513=:2424--
