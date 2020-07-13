From: Ian Abbott <abbotti@mev.co.uk>
Date: Mon, 13 Jul 2020 13:48:41 +0000
Subject: Re: [PATCH] staging: comedi: s626: Remove pci-dma-compat wrapper APIs.
Message-Id: <3747ce02-feb3-359f-c60d-233e412c6062@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711123533.GA15038@blackclown>
 <6f701731-d0af-1bd5-5854-42f0ba39ed35@wanadoo.fr>
In-Reply-To: <6f701731-d0af-1bd5-5854-42f0ba39ed35@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Suraj Upadhyay <usuraj35@gmail.com>, gregkh@linuxfoundation.org, hsweeten@visionengravers.com
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/07/2020 14:38, Christophe JAILLET wrote:
> Le 11/07/2020 =E0 14:35, Suraj Upadhyay a =E9crit=A0:
>> The legacy API wrappers in include/linux/pci-dma-compat.h
>> should go away as it creates unnecessary midlayering
>> for include/linux/dma-mapping.h APIs, instead use dma-mapping.h
>> APIs directly.
>>
>> The patch has been generated with the coccinelle script below
>> and compile-tested.
>>
>> [...]
>> @@ expression E1, E2, E3; @@
>> - pci_alloc_consistent(E1, E2, E3)
>> + dma_alloc_coherent(&E1->dev, E2, E3, GFP_ATOMIC)
>>
>> @@ expression E1, E2, E3; @@
>> - pci_zalloc_consistent(E1, E2, E3)
>> + dma_alloc_coherent(&E1->dev, E2, E3, GFP_ATOMIC)
>=20
> This is the tricky part of this kind of cleanup, see below.
>=20
> GFP_ATOMIC can't be wrong because it is was exactly what was done with=20
> the pci_ function.
> However, most of the time, it can safely be replaced by GFP_KERNEL which =

> gives more opportunities to the memory allocator.
>=20
>> [...]
>> diff --git a/drivers/staging/comedi/drivers/s626.c=20
>> b/drivers/staging/comedi/drivers/s626.c
>> index 084a8e7b9fc2..c159416662fd 100644
>> --- a/drivers/staging/comedi/drivers/s626.c
>> +++ b/drivers/staging/comedi/drivers/s626.c
>> @@ -2130,13 +2130,15 @@ static int s626_allocate_dma_buffers(struct=20
>> comedi_device *dev)
>> =A0=A0=A0=A0=A0 void *addr;
>> =A0=A0=A0=A0=A0 dma_addr_t appdma;
>> -=A0=A0=A0 addr =3D pci_alloc_consistent(pcidev, S626_DMABUF_SIZE, &appd=
ma);
>> +=A0=A0=A0 addr =3D dma_alloc_coherent(&pcidev->dev, S626_DMABUF_SIZE, &=
appdma,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 GFP_ATOMIC);
>> =A0=A0=A0=A0=A0 if (!addr)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;
>> =A0=A0=A0=A0=A0 devpriv->ana_buf.logical_base =3D addr;
>> =A0=A0=A0=A0=A0 devpriv->ana_buf.physical_base =3D appdma;
>> -=A0=A0=A0 addr =3D pci_alloc_consistent(pcidev, S626_DMABUF_SIZE, &appd=
ma);
>> +=A0=A0=A0 addr =3D dma_alloc_coherent(&pcidev->dev, S626_DMABUF_SIZE, &=
appdma,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 GFP_ATOMIC);
>> =A0=A0=A0=A0=A0 if (!addr)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;
>> =A0=A0=A0=A0=A0 devpriv->rps_buf.logical_base =3D addr;
> 's626_allocate_dma_buffers()' is only called from 's626_auto_attach()'.
> In this function, around the call to 's626_allocate_dma_buffers()', you=20
> can see:
>  =A0 - a few lines before, a call to 'comedi_alloc_devpriv()'
>=20
>  =A0 - a few lines after, a call to 'comedi_alloc_subdevices()'
>=20
> These 2 functions make some memory allocation using GFP_KERNEL.
>=20
> So it is likely that using GFP_KERNEL in your proposal is also valid.

Indeed, GFP_KERNEL is perfectly fine here.  It could be done as a=20
follow-up patch, or done in a v2 of this patch with a mention in the=20
patch description.

--=20
-=3D( Ian Abbott <abbotti@mev.co.uk> || Web: www.mev.co.uk )=3D-
-=3D( MEV Ltd. is a company registered in England & Wales. )=3D-
-=3D( Registered number: 02862268.  Registered address:    )=3D-
-=3D( 15 West Park Road, Bramhall, STOCKPORT, SK7 3JZ, UK. )=3D-
