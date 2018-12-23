From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 23 Dec 2018 22:06:07 +0000
Subject: Re: [PATCH 00/20] drop useless LIST_HEAD
Message-Id: <alpine.DEB.2.21.1812232304130.2940@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
 <CAKR_QVJefW1vxYb7-qiU8=0YdbFghYo15SK2eGjOC-dntRfyYA@mail.gmail.com>
In-Reply-To: <CAKR_QVJefW1vxYb7-qiU8=0YdbFghYo15SK2eGjOC-dntRfyYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Psyborg <pozega.tomislav@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-nfs@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>, linux-btrfs@vger.kernel.org, dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org



On Sun, 23 Dec 2018, Tom Psyborg wrote:

> Why do you CC this to so many lists?

Because the different files are in different subsystems.  The cover letter
goes to a list for each file, or to a person if there is no list.  The
patches go to the people and lists associated with the affected files.

julia

>
> On 23/12/2018, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> > Drop LIST_HEAD where the variable it declares is never used.
> >
> > ---
> >
> >  drivers/dma/at_hdmac.c                                |    5 -----
> >  drivers/dma/dw/core.c                                 |    1 -
> >  drivers/dma/pl330.c                                   |    1 -
> >  drivers/dma/sa11x0-dma.c                              |    2 --
> >  drivers/dma/st_fdma.c                                 |    3 ---
> >  drivers/infiniband/ulp/ipoib/ipoib_ib.c               |    1 -
> >  drivers/net/ethernet/mellanox/mlx4/resource_tracker.c |    5 -----
> >  drivers/net/ethernet/mellanox/mlx5/core/en_tc.c       |    3 ---
> >  drivers/net/ethernet/mellanox/mlxsw/spectrum.c        |    1 -
> >  drivers/net/wireless/st/cw1200/queue.c                |    1 -
> >  drivers/scsi/lpfc/lpfc_nvme.c                         |    2 --
> >  drivers/scsi/lpfc/lpfc_scsi.c                         |    2 --
> >  drivers/scsi/lpfc/lpfc_sli.c                          |    1 -
> >  drivers/scsi/qla2xxx/qla_init.c                       |    1 -
> >  drivers/xen/xenbus/xenbus_dev_frontend.c              |    2 --
> >  fs/btrfs/relocation.c                                 |    1 -
> >  fs/nfs/nfs4client.c                                   |    1 -
> >  fs/nfsd/nfs4layouts.c                                 |    1 -
> >  fs/xfs/xfs_buf.c                                      |    1 -
> >  fs/xfs/xfs_fsops.c                                    |    1 -
> >  20 files changed, 36 deletions(-)
> >
>
