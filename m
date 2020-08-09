From: Gal Pressman <galpress@amazon.com>
Date: Sun, 09 Aug 2020 08:35:51 +0000
Subject: Re: [PATCH 0/4] Infiniband Subsystem: Remove pci-dma-compat wrapper APIs.
Message-Id: <9220090e-7340-df50-a998-57a5e7752f90@amazon.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1596957073.git.usuraj35@gmail.com>
In-Reply-To: <cover.1596957073.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suraj Upadhyay <usuraj35@gmail.com>, dledford@redhat.com, jgg@ziepe.ca
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/08/2020 10:24, Suraj Upadhyay wrote:
> Hii Developers,
> 
> 	This patch series will replace all the legacy pci-dma-compat wrappers
> with the dma-mapping APIs directly in the INFINIBAND Subsystem.
> 
> This task is done through a coccinelle script which is described in each commit
> message.
> 
> The changes are compile tested.
> 
> Thanks,
> 
> Suraj Upadhyay.
> 
> Suraj Upadhyay (4):
>   IB/hfi1: Remove pci-dma-compat wrapper APIs
>   IB/mthca: Remove pci-dma-compat wrapper APIs
>   RDMA/qib: Remove pci-dma-compat wrapper APIs
>   RDMA/pvrdma: Remove pci-dma-compat wrapper APIs
> 
>  drivers/infiniband/hw/hfi1/pcie.c             |  8 +++----
>  drivers/infiniband/hw/hfi1/user_exp_rcv.c     | 13 +++++------
>  drivers/infiniband/hw/mthca/mthca_eq.c        | 21 +++++++++--------
>  drivers/infiniband/hw/mthca/mthca_main.c      |  8 +++----
>  drivers/infiniband/hw/mthca/mthca_memfree.c   | 23 +++++++++++--------
>  drivers/infiniband/hw/qib/qib_file_ops.c      | 12 +++++-----
>  drivers/infiniband/hw/qib/qib_init.c          |  4 ++--
>  drivers/infiniband/hw/qib/qib_pcie.c          |  8 +++----
>  drivers/infiniband/hw/qib/qib_user_pages.c    | 12 +++++-----
>  .../infiniband/hw/vmw_pvrdma/pvrdma_main.c    |  6 ++---
>  10 files changed, 59 insertions(+), 56 deletions(-)
> 

The efa patch isn't listed here, and it shows as patch 5/4?
