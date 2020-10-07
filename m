From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 07 Oct 2020 12:33:45 +0000
Subject: Re: [PATCH] PCI: fix a potential uninitentional integer overflow issue
Message-Id: <20201007123045.GS4282@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201007114615.19966-1-colin.king@canonical.com>
In-Reply-To: <20201007114615.19966-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Stephen Bates <sbates@raithlin.com>, Logan Gunthorpe <logang@deltatee.com>, Alex Williamson <alex.williamson@redhat.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 07, 2020 at 12:46:15PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The shift of 1 by align_order is evaluated using 32 bit arithmetic
> and the result is assigned to a resource_size_t type variable that
> is a 64 bit unsigned integer on 64 bit platforms. Fix an overflow
> before widening issue by using the BIT_ULL macro to perform the
> shift.
> 
> Addresses-Coverity: ("Uninitentional integer overflow")
> Fixes: 07d8d7e57c28 ("PCI: Make specifying PCI devices in kernel parameters reusable")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pci/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 6d4d5a2f923d..1a5844d7af35 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6209,7 +6209,7 @@ static resource_size_t pci_specified_resource_alignment(struct pci_dev *dev,
>  			if (align_order = -1)
>  				align = PAGE_SIZE;
>  			else
> -				align = 1 << align_order;
> +				align = BIT_ULL(align_order);

"align_order" comes from sscanf() so Smatch thinks it's not trusted.
Anything above 63 is undefined behavior.  There should be a bounds check
on this but I don't know what the valid values of "align" are.

regards,
dan carpenter
