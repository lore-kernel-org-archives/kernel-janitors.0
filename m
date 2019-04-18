From: Jason Gunthorpe <jgg@mellanox.com>
Date: Thu, 18 Apr 2019 06:18:05 +0000
Subject: Re: [PATCH] RDMA/cxgb4: fix spelling mistake "immedate" -> "immediate"
Message-Id: <20190418061801.GA5646@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190416143804.1518-1-colin.king@canonical.com>
In-Reply-To: <20190416143804.1518-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Potnuri Bharat Teja <bharat@chelsio.com>, Doug Ledford <dledford@redhat.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 16, 2019 at 03:38:04PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a module parameter description. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/cxgb4/qp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
