From: Alex Williamson <alex.williamson@redhat.com>
Date: Wed, 04 Nov 2015 16:54:40 +0000
Subject: Re: [patch] vfio: make an array larger
Message-Id: <1446656080.3692.112.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151104132624.GC20966@mwanda>
In-Reply-To: <20151104132624.GC20966@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Frank Blaschka <frank.blaschka@de.ibm.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2015-11-04 at 16:26 +0300, Dan Carpenter wrote:
> Smatch complains about a possible out of bounds error:
> 
> 	drivers/vfio/pci/vfio_pci_config.c:1241 vfio_cap_init()
> 	error: buffer overflow 'pci_cap_length' 20 <= 20
> 
> Fix this by making the array larger.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> index ff75ca3..001d48a 100644
> --- a/drivers/vfio/pci/vfio_pci_config.c
> +++ b/drivers/vfio/pci/vfio_pci_config.c
> @@ -46,7 +46,7 @@
>   *   0: Removed from the user visible capability list
>   *   FF: Variable length
>   */
> -static u8 pci_cap_length[] = {
> +static u8 pci_cap_length[PCI_CAP_ID_MAX + 1] = {
>  	[PCI_CAP_ID_BASIC]	= PCI_STD_HEADER_SIZEOF, /* pci config header */
>  	[PCI_CAP_ID_PM]		= PCI_PM_SIZEOF,
>  	[PCI_CAP_ID_AGP]	= PCI_AGP_SIZEOF,

This doesn't make a whole lot of sense to me.  The last entry we define
is:

        [PCI_CAP_ID_AF]         = PCI_CAP_AF_SIZEOF,
};

and PCI_CAP_ID_MAX is defined as:

#define  PCI_CAP_ID_MAX         PCI_CAP_ID_AF

So the array is implicitly sized to PCI_CAP_ID_MAX + 1 already, this
doesn't make it any larger.  I imagine this silences smatch because it's
hitting this:

                if (cap <= PCI_CAP_ID_MAX) {
                        len = pci_cap_length[cap];

And it doesn't like that we're indexing an array that has entries up to
PCI_CAP_ID_AF and we're testing against PCI_CAP_ID_MAX.  They happen to
be the same now, but that could change and then we'd index off the end
of the array.  That's unlikely, but valid.  Is that the real
justification for this patch?  Thanks,

Alex

