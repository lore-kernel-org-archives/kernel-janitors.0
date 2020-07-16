From: Jason Gunthorpe <jgg@nvidia.com>
Date: Thu, 16 Jul 2020 18:44:35 +0000
Subject: Re: [PATCH] RDMA/usnic: switch from 'pci_' to 'dma_' API
Message-Id: <20200716184435.GA2670424@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711073120.249146-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200711073120.249146-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: benve@cisco.com, neescoba@cisco.com, pkaustub@cisco.com, dledford@redhat.com, hch@infradead.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jul 11, 2020 at 09:31:20AM +0200, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script bellow.
> It has been compile tested.
> 
> When memory is allocated, GFP_ATOMIC should be used to be consistent with
> the surrounding code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>    https://marc.info/?l=kernel-janitors&m8745678307186&w=4
> ---
>  drivers/infiniband/hw/usnic/usnic_fwd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I checked the GFP and it looks OK to me, thanks.

Applied to for-next

Jason
