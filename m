From: Jason Gunthorpe <jgg@nvidia.com>
Date: Tue, 24 Nov 2020 12:55:13 +0000
Subject: Re: [PATCH] IB/qib: Use dma_set_mask_and_coherent to simplify code
Message-Id: <20201124125513.GA85927@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201121095127.1335228-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201121095127.1335228-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dennis.dalessandro@cornelisnetworks.com, mike.marciniszyn@cornelisnetworks.com, dledford@redhat.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Nov 21, 2020 at 10:51:27AM +0100, Christophe JAILLET wrote:
> 'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
> an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Acked-by: Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>
> ---
>  drivers/infiniband/hw/qib/qib_pcie.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

Applied to for-next, thanks

Jason
