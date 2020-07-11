From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Jul 2020 13:38:37 +0000
Subject: Re: [PATCH] staging: comedi: s626: Remove pci-dma-compat wrapper APIs.
Message-Id: <6f701731-d0af-1bd5-5854-42f0ba39ed35@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711123533.GA15038@blackclown>
In-Reply-To: <20200711123533.GA15038@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Suraj Upadhyay <usuraj35@gmail.com>, gregkh@linuxfoundation.org, abbotti@mev.co.uk, hsweeten@visionengravers.com
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Le 11/07/2020 =E0 14:35, Suraj Upadhyay a =E9crit=A0:
> The legacy API wrappers in include/linux/pci-dma-compat.h
> should go away as it creates unnecessary midlayering
> for include/linux/dma-mapping.h APIs, instead use dma-mapping.h
> APIs directly.
>
> The patch has been generated with the coccinelle script below
> and compile-tested.
>
> [...]
> @@ expression E1, E2, E3; @@
> - pci_alloc_consistent(E1, E2, E3)
> + dma_alloc_coherent(&E1->dev, E2, E3, GFP_ATOMIC)
>
> @@ expression E1, E2, E3; @@
> - pci_zalloc_consistent(E1, E2, E3)
> + dma_alloc_coherent(&E1->dev, E2, E3, GFP_ATOMIC)

This is the tricky part of this kind of cleanup, see below.

GFP_ATOMIC can't be wrong because it is was exactly what was done with=20
the pci_ function.
However, most of the time, it can safely be replaced by GFP_KERNEL which=20
gives more opportunities to the memory allocator.

> [...]
> diff --git a/drivers/staging/comedi/drivers/s626.c b/drivers/staging/come=
di/drivers/s626.c
> index 084a8e7b9fc2..c159416662fd 100644
> --- a/drivers/staging/comedi/drivers/s626.c
> +++ b/drivers/staging/comedi/drivers/s626.c
> @@ -2130,13 +2130,15 @@ static int s626_allocate_dma_buffers(struct comed=
i_device *dev)
>   	void *addr;
>   	dma_addr_t appdma;
>  =20
> -	addr =3D pci_alloc_consistent(pcidev, S626_DMABUF_SIZE, &appdma);
> +	addr =3D dma_alloc_coherent(&pcidev->dev, S626_DMABUF_SIZE, &appdma,
> +				  GFP_ATOMIC);
>   	if (!addr)
>   		return -ENOMEM;
>   	devpriv->ana_buf.logical_base =3D addr;
>   	devpriv->ana_buf.physical_base =3D appdma;
>  =20
> -	addr =3D pci_alloc_consistent(pcidev, S626_DMABUF_SIZE, &appdma);
> +	addr =3D dma_alloc_coherent(&pcidev->dev, S626_DMABUF_SIZE, &appdma,
> +				  GFP_ATOMIC);
>   	if (!addr)
>   		return -ENOMEM;
>   	devpriv->rps_buf.logical_base =3D addr;
's626_allocate_dma_buffers()' is only called from 's626_auto_attach()'.
In this function, around the call to 's626_allocate_dma_buffers()', you=20
can see:
 =A0 - a few lines before, a call to 'comedi_alloc_devpriv()'

 =A0 - a few lines after, a call to 'comedi_alloc_subdevices()'

These 2 functions make some memory allocation using GFP_KERNEL.

So it is likely that using GFP_KERNEL in your proposal is also valid.


Just my 2c.

CJ
