From: Joe Perches <joe@perches.com>
Date: Tue, 28 Jul 2020 09:25:47 +0000
Subject: Re: [PATCH 2/2] media: bt8xx: avoid a useless memset
Message-Id: <2480b12b85f9560060cd155de222d42d40150ae7.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727135151.54757-1-christophe.jaillet@wanadoo.fr>
         <0897d9bec8865859694c917f3f72ab8fd12321ff.camel@perches.com>
         <30618c986727e5f8a9806f663b4e6f4aa80065ae.camel@perches.com>
         <d5759bd3-5e8a-a557-cd3e-0a2ae4d124e9@wanadoo.fr>
In-Reply-To: <d5759bd3-5e8a-a557-cd3e-0a2ae4d124e9@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mchehab@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2020-07-28 at 10:05 +0200, Christophe JAILLET wrote:
> Le 27/07/2020 =E0 18:16, Joe Perches a =E9crit :
> > On Mon, 2020-07-27 at 09:09 -0700, Joe Perches wrote:
> > > On Mon, 2020-07-27 at 15:51 +0200, Christophe JAILLET wrote:
> > > > Avoid a memset after a call to 'dma_alloc_coherent()'.
> > > > This is useless since
> > > > commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_al=
loc_*")
> > > []
> > > > diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pc=
i/bt8xx/btcx-risc.c
> > > []
> > > > @@ -73,7 +73,6 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
> > > >   		dprintk("btcx: riscmem alloc [%d] dma=3D%lx cpu=3D%p size=3D%d\=
n",
> > > >   			memcnt, (unsigned long)dma, cpu, size);
> > > >   	}
> > > > -	memset(risc->cpu,0,risc->size);
> > > >   	return 0;
> > > >   }
> > >=20
> > > Likely NAK.
> > >=20
> > > This is not useless as risc->cpu may be reused
> > > and the alloc may not have been done.
> >=20
> > Perhaps a little rewrite for clarity:
> > ---
> >   drivers/media/pci/bt8xx/btcx-risc.c | 24 +++++++++++++-----------
> >   1 file changed, 13 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/media/pci/bt8xx/btcx-risc.c b/drivers/media/pci/bt=
8xx/btcx-risc.c
> > index 51257980f539..311f4ca2a108 100644
> > --- a/drivers/media/pci/bt8xx/btcx-risc.c
> > +++ b/drivers/media/pci/bt8xx/btcx-risc.c
> > @@ -56,24 +56,26 @@ int btcx_riscmem_alloc(struct pci_dev *pci,
> >   		       struct btcx_riscmem *risc,
> >   		       unsigned int size)
> >   {
> > -	__le32 *cpu;
> > -	dma_addr_t dma =3D 0;
> > -
> > -	if (NULL !=3D risc->cpu && risc->size < size)
> > -		btcx_riscmem_free(pci,risc);
> > -	if (NULL =3D risc->cpu) {
> > -		cpu =3D pci_alloc_consistent(pci, size, &dma);
> > -		if (NULL =3D cpu)
> > +	if (risc->cpu && risc->size < size)
> > +		btcx_riscmem_free(pci, risc);
> > +
> > +	if (risc->cpu) {
> > +		memset(risc->cpu, 0, risc->size);
> > +	} else {
> > +		dma_addr_t dma =3D 0;
> > +
> > +		risc->cpu =3D pci_alloc_consistent(pci, size, &dma);
> > +		if (!risc->cpu)
> >   			return -ENOMEM;
> > -		risc->cpu  =3D cpu;
> > +
> >   		risc->dma  =3D dma;
> >   		risc->size =3D size;
> >  =20
> >   		memcnt++;
> >   		dprintk("btcx: riscmem alloc [%d] dma=3D%lx cpu=3D%p size=3D%d\n",
> > -			memcnt, (unsigned long)dma, cpu, size);
> > +			memcnt, (unsigned long)dma, risc->cpu, size);
> >   	}
> > -	memset(risc->cpu,0,risc->size);
> > +
> >   	return 0;
> >   }
> >  =20
> >=20
> >=20
> Looks good to me.
>=20
> Just note, that this will not apply after patch 1/2 is applied, because=20
> it turns pci_alloc_consistent() into dma_alloc_coherent().

Just a suggestion.

As it's dependent on your first patch, perhaps
you could make the appropriate change.
