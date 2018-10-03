From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 03 Oct 2018 22:16:50 +0000
Subject: Re: [PATCH -next] IB/mthca: Fix error return code in __mthca_init_one()
Message-Id: <20181003221650.GC4328@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Sep 29, 2018 at 03:55:16AM +0000, Wei Yongjun wrote:
> Fix to return a negative error code from the mthca_cmd_init() error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: 80fd8238734c ("[PATCH] IB/mthca: Encapsulate command interface init")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/infiniband/hw/mthca/mthca_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to for-next

Thanks,
Jason
