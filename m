From: Jason Gunthorpe <jgg@nvidia.com>
Date: Mon, 27 Jul 2020 16:17:39 +0000
Subject: Re: [PATCH] qed: fix assignment of n_rq_elems to incorrect params field
Message-Id: <20200727161739.GA60250@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727141712.112906-1-colin.king@canonical.com>
In-Reply-To: <20200727141712.112906-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>
Cc: Michal Kalderon <mkalderon@marvell.com>, Ariel Elior <aelior@marvell.com>, Doug Ledford <dledford@redhat.com>, Igor Russkikh <irusskikh@marvell.com>, Alexander Lobakin <alobakin@marvell.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 27, 2020 at 03:17:12PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently n_rq_elems is being assigned to params.elem_size instead of the
> field params.num_elems.  Coverity is detecting this as a double assingment
> to params.elem_size and reporting this as an usused value on the first
> assignment.  Fix this.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: b6db3f71c976 ("qed: simplify chain allocation with init params struct")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/qedr/verbs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

DaveM will need to take this since the Fixed patch is in his tree,
thanks.

Jason
