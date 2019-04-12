From: Jason Gunthorpe <jgg@mellanox.com>
Date: Fri, 12 Apr 2019 19:00:16 +0000
Subject: Re: [PATCH][next] RDMA/mlx5: check for error return in flow_rule rather than err
Message-Id: <20190412142143.GA22222@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190412104017.25507-1-colin.king@canonical.com>
In-Reply-To: <20190412104017.25507-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Apr 12, 2019 at 11:40:17AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the call to create_flow_rule_vport_sq fails, the error
> check is being performed on err rather than on the return pointer
> flow_rule.  The return flow_rule maybe NULL (which is not considered
> an error) or an error code, so check for the error on flow_rule.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: d5ed8ac34cef ("RDMA/mlx5: Move default representors SQ steering to rule to modify QP")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/mlx5/qp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
