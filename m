From: Don Hiatt <don.hiatt@intel.com>
Date: Thu, 01 Mar 2018 17:47:46 +0000
Subject: Re: [PATCH] infiniband: remove redundant assignment to pointer 'rdi'
Message-Id: <f229e924-8447-5656-12cc-4a7507a6130d@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180301162354.17420-1-colin.king@canonical.com>
In-Reply-To: <20180301162354.17420-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Dennis Dalessandro <dennis.dalessandro@intel.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 3/1/2018 8:23 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer rdi is being initialized with a value that is never read
> and re-assigned immediately after, hence the initialization is redundant
> and can be removed.
>
> Cleans up clang warning:
> drivers/infiniband/sw/rdmavt/vt.c:94:23: warning: Value stored to 'rdi'
> during its initialization is never read
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/infiniband/sw/rdmavt/vt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/infiniband/sw/rdmavt/vt.c b/drivers/infiniband/sw/rdmavt/vt.c
> index a4553b2b3696..a67b0ddc2230 100644
> --- a/drivers/infiniband/sw/rdmavt/vt.c
> +++ b/drivers/infiniband/sw/rdmavt/vt.c
> @@ -91,7 +91,7 @@ module_exit(rvt_cleanup);
>    */
>   struct rvt_dev_info *rvt_alloc_device(size_t size, int nports)
>   {
> -	struct rvt_dev_info *rdi = ERR_PTR(-ENOMEM);
> +	struct rvt_dev_info *rdi;
>   
>   	rdi = (struct rvt_dev_info *)ib_alloc_device(size);
>   	if (!rdi)
Thanks: Reviewed-by: Don Hiatt <don.hiatt@intel.com>

