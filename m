From: Jason Gunthorpe <jgg@mellanox.com>
Date: Tue, 16 Apr 2019 11:06:22 +0000
Subject: Re: [PATCH] RDMA/cxgb4: fix null pointer dereference on alloc_skb failure
Message-Id: <20190416110618.GA15844@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190413160026.5873-1-colin.king@canonical.com>
In-Reply-To: <20190413160026.5873-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Potnuri Bharat Teja <bharat@chelsio.com>, Doug Ledford <dledford@redhat.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Apr 13, 2019 at 05:00:26PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if alloc_skb fails to allocate the skb a null skb is passed
> to t4_set_arp_err_handler and this ends up dereferencing the null skb.
> Avoid the null pointer dereference by checking for a null skb and
> returning early.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: b38a0ad8ec11 ("RDMA/cxgb4: Set arp error handler for PASS_ACCEPT_RPL messages")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Potnuri Bharat Teja <bharat@chelsio.com>
> ---
>  drivers/infiniband/hw/cxgb4/cm.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied to for-next

Thanks,
Jason
