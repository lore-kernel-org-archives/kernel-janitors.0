From: Jason Gunthorpe <jgg@mellanox.com>
Date: Tue, 25 Jun 2019 19:34:31 +0000
Subject: Re: [PATCH][next] RDMA/hns: fix spelling mistake "attatch" -> "attach"
Message-Id: <20190625193427.GA13242@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190624121649.3281-1-colin.king@canonical.com>
In-Reply-To: <20190624121649.3281-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 24, 2019 at 01:16:49PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in an dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_qp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
