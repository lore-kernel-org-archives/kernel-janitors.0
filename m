From: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 29 Dec 2019 16:53:35 +0000
Subject: Re: [PATCH] Added AU6625 to list of supported PCI_IDs
Message-Id: <alpine.DEB.2.21.1912291750150.2988@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191229164339.7227-1-rhysperry111@gmail.com>
In-Reply-To: <20191229164339.7227-1-rhysperry111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 29 Dec 2019, rhysperry111 wrote:

> From: Rhys Perry <rhysperry111@gmail.com>
>
> This is my first kernel patch!

The subject line should give some hint of what file this applies to.  Use
git log --oneline to see what others have done for this file.

The patch should not just be sent to this list, but also to the
maintainers for the file.  You can find them with
scripts/get_maintainer.pl

The fact that this is your first patch is nice to know for the person
reviewing, but is not necessary for posterity.  Put it under the ---.

>
> I have added the AU6625 PCI_ID to the list of supported IDs and done some
> general formatting to make it fit in a bit more with the code that is already
> there. From general usage there seems to be no problems.

Use the imperative to express what you have done ("Add...").

Look at some other patches and see how yours is different from them with
respect to the above points.

julia

> Signed-off-by: Rhys Perry <rhysperry111@gmail.com>
> ---
>  drivers/misc/cardreader/alcor_pci.c | 8 +++++++-
>  include/linux/alcor_pci.h           | 1 +
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/cardreader/alcor_pci.c b/drivers/misc/cardreader/alcor_pci.c
> index 259fe1dfe..cd402c891 100644
> --- a/drivers/misc/cardreader/alcor_pci.c
> +++ b/drivers/misc/cardreader/alcor_pci.c
> @@ -38,12 +38,18 @@ static const struct alcor_dev_cfg au6621_cfg = {
>  	.dma = 1,
>  };
>
> +static const struct alcor_dev_cfg au6625_cfg = {
> +	.dma = 0,
> +};
> +
>  static const struct pci_device_id pci_ids[] = {
>  	{ PCI_DEVICE(PCI_ID_ALCOR_MICRO, PCI_ID_AU6601),
>  		.driver_data = (kernel_ulong_t)&alcor_cfg },
>  	{ PCI_DEVICE(PCI_ID_ALCOR_MICRO, PCI_ID_AU6621),
>  		.driver_data = (kernel_ulong_t)&au6621_cfg },
> -	{ },
> +	{ PCI_DEVICE(PCI_ID_ALCOR_MICRO, PCI_ID_AU6625),
> +		.driver_data = (kernel_ulong_t)&au6625_cfg },
> +	{},
>  };
>  MODULE_DEVICE_TABLE(pci, pci_ids);
>
> diff --git a/include/linux/alcor_pci.h b/include/linux/alcor_pci.h
> index 4416df597..8274ed525 100644
> --- a/include/linux/alcor_pci.h
> +++ b/include/linux/alcor_pci.h
> @@ -17,6 +17,7 @@
>  #define PCI_ID_ALCOR_MICRO			0x1AEA
>  #define PCI_ID_AU6601				0x6601
>  #define PCI_ID_AU6621				0x6621
> +#define PCI_ID_AU6625				0x6625
>
>  #define MHZ_TO_HZ(freq)				((freq) * 1000 * 1000)
>
> --
> 2.24.1
>
>
