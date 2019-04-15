From: Potnuri Bharat Teja <bharat@chelsio.com>
Date: Mon, 15 Apr 2019 07:53:51 +0000
Subject: Re: [PATCH] RDMA/cxgb4: fix null pointer dereference on alloc_skb failure
Message-Id: <20190415075336.GA26935@chelsio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190413160026.5873-1-colin.king@canonical.com>
In-Reply-To: <20190413160026.5873-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Saturday, April 04/13/19, 2019 at 21:30:26 +0530, Colin King wrote:
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
> ---
>  drivers/infiniband/hw/cxgb4/cm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Thanks,
Acked-by: Potnuri Bharat Teja <bharat@chelsio.com>
