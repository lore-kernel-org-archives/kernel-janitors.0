From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 19 Feb 2019 22:01:49 +0000
Subject: Re: [PATCH -next] iw_cxgb4: make function read_tcb() static
Message-Id: <20190219220149.GA16735@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218070432.167400-1-weiyongjun1@huawei.com>
In-Reply-To: <20190218070432.167400-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Feb 18, 2019 at 07:04:32AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/infiniband/hw/cxgb4/cm.c:658:6: warning:
>  symbol 'read_tcb' was not declared. Should it be static?
> 
> Fixes: 11a27e2121a5 ("iw_cxgb4: complete the cached SRQ buffers")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/infiniband/hw/cxgb4/cm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
