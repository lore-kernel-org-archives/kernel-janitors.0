From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Date: Thu, 28 May 2020 13:31:55 +0000
Subject: Re: [PATCH][next] IB/hfi1: fix spelling mistake "enought" -> "enough"
Message-Id: <d60039c9-b0a5-cff5-410e-0d98f020e577@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528110709.400935-1-colin.king@canonical.com>
In-Reply-To: <20200528110709.400935-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/28/2020 7:07 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in an error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/infiniband/hw/hfi1/chip.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/hfi1/chip.c b/drivers/infiniband/hw/hfi1/chip.c
> index 7f35b9ea158b..15f9c635f292 100644
> --- a/drivers/infiniband/hw/hfi1/chip.c
> +++ b/drivers/infiniband/hw/hfi1/chip.c
> @@ -14559,7 +14559,7 @@ static bool hfi1_netdev_update_rmt(struct hfi1_devdata *dd)
>   	}
>   
>   	if (hfi1_is_rmt_full(rmt_start, NUM_NETDEV_MAP_ENTRIES)) {
> -		dd_dev_err(dd, "Not enought RMT entries used = %d\n",
> +		dd_dev_err(dd, "Not enough RMT entries used = %d\n",
>   			   rmt_start);
>   		return false;
>   	}
> 

Thanks!

Acked-by: Dennis Dalessandro <dennis.dalessandro@intel.com>
