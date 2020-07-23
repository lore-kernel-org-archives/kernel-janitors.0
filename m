From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 23 Jul 2020 10:56:02 +0000
Subject: Re: [PATCH 1/2] misc: hpilo: switch from 'pci_' to 'dma_' API
Message-Id: <20200723105602.GD1949236@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200718070224.337964-1-christophe.jaillet@wanadoo.fr>
 <20200723073433.GA1273491@kroah.com>
 <15e5f2e4-a623-3fc2-36b6-4132ee316220@wanadoo.fr>
In-Reply-To: <15e5f2e4-a623-3fc2-36b6-4132ee316220@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jul 23, 2020 at 10:59:49AM +0200, Christophe JAILLET wrote:
> Le 23/07/2020 =E0 09:34, Greg KH a =E9crit=A0:
> > On Sat, Jul 18, 2020 at 09:02:24AM +0200, Christophe JAILLET wrote:
> > > The wrappers in include/linux/pci-dma-compat.h should go away.
> > >=20
> > > The patch has been generated with the coccinelle script below and has=
 been
> > > hand modified to replace GFP_ with a correct flag.
> > > It has been compile tested.
> > >=20
> > > When memory is allocated in 'ilo_ccb_setup()' GFP_ATOMIC must be used
> > > because a spin_lock is hold in 'ilo_open()' before calling
> > > 'ilo_ccb_setup()'
>=20
>        ^
>        |

{sigh} see how well I read changelog text...

>=20
> > > [...]
> > >=20
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > > If needed, see post from Christoph Hellwig on the kernel-janitors ML:
> > >     https://marc.info/?l=3Dkernel-janitors&m=158745678307186&w=3D4
> > > ---
> > >   drivers/misc/hpilo.c | 7 ++++---
> > >   1 file changed, 4 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/misc/hpilo.c b/drivers/misc/hpilo.c
> > > index 10c975662f8b..c9539c89a925 100644
> > > --- a/drivers/misc/hpilo.c
> > > +++ b/drivers/misc/hpilo.c
> > > @@ -256,7 +256,8 @@ static void ilo_ccb_close(struct pci_dev *pdev, s=
truct ccb_data *data)
> > >   	memset_io(device_ccb, 0, sizeof(struct ccb));
> > >   	/* free resources used to back send/recv queues */
> > > -	pci_free_consistent(pdev, data->dma_size, data->dma_va, data->dma_p=
a);
> > > +	dma_free_coherent(&pdev->dev, data->dma_size, data->dma_va,
> > > +			  data->dma_pa);
> > >   }
> > >   static int ilo_ccb_setup(struct ilo_hwinfo *hw, struct ccb_data *da=
ta, int slot)
> > > @@ -272,8 +273,8 @@ static int ilo_ccb_setup(struct ilo_hwinfo *hw, s=
truct ccb_data *data, int slot)
> > >   			 2 * desc_mem_sz(NR_QENTRY) +
> > >   			 ILO_START_ALIGN + ILO_CACHE_SZ;
> > > -	data->dma_va =3D pci_alloc_consistent(hw->ilo_dev, data->dma_size,
> > > -					    &data->dma_pa);
> > > +	data->dma_va =3D dma_alloc_coherent(&hw->ilo_dev->dev, data->dma_si=
ze,
> > > +					  &data->dma_pa, GFP_ATOMIC);
> >=20
> > This is being called from open() so it can be GFP_KERNEL.  Can you fix
> > that up and resend a new version?
> >=20
> > thanks,
> >=20
> > greg k-h
> >=20
>=20
> The call chain is:
>    .open	                       (file_operations)
>       --> ilo_open
> 	  spin_lock(&hw->open_lock);   (around line 782)
>          --> ilo_ccb_setup	       (hw->open_lock is still hold)
>=20
> So I think that GFP_ATOMIC is needed here, or the code should be reworked=
 to
> avoid holding the spin_lock when ilo_ccb_setup is called.

Ok, fair enough, this patch is ok as-is, I'll go queue it up.  Further
fixes for this to move the spinlock out from this is probably a good
idea, if anyone cares about this driver anymore.

thanks,

greg k-h
