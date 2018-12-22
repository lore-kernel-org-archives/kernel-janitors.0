From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Sat, 22 Dec 2018 23:09:02 +0000
Subject: Re: [PATCH] IB/uverbs: Signedness bug in UVERBS_HANDLER()
Message-Id: <20181222230902.GA20963@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181222074259.GA6338@kadam>
In-Reply-To: <20181222074259.GA6338@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Dec 22, 2018 at 10:42:59AM +0300, Dan Carpenter wrote:
> The "num_sge" variable needs to be signed for the error handling to
> work.  The uverbs_attr_ptr_get_array_size() returns int so this change
> is safe.
> 
> Fixes: ad8a4496757f ("IB/uverbs: Add support to advise_mr")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
> ---
>  drivers/infiniband/core/uverbs_std_types_mr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next

Thanks,
Jason
