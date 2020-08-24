From: Jason Gunthorpe <jgg@nvidia.com>
Date: Mon, 24 Aug 2020 16:42:24 +0000
Subject: Re: [PATCH 0/4] Infiniband Subsystem: Remove pci-dma-compat wrapper APIs.
Message-Id: <20200824164224.GA3180344@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1596957073.git.usuraj35@gmail.com>
In-Reply-To: <cover.1596957073.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suraj Upadhyay <usuraj35@gmail.com>
Cc: dledford@redhat.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Aug 09, 2020 at 12:54:28PM +0530, Suraj Upadhyay wrote:
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

Aside from Joe's notes it doesn't apply either:

 Applying: RDMA/efa : Remove pci-dma-compat wrapper APIs
 Using index info to reconstruct a base tree...
 error: patch failed: drivers/infiniband/hw/efa/efa_main.c:405
 error: drivers/infiniband/hw/efa/efa_main.c: patch does not apply
 error: Did you hand edit your patch?
 It does not apply to blobs recorded in its index.

Try to avoid hand editing patches..

Please resend

Jason
