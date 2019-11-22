From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Date: Fri, 22 Nov 2019 17:54:37 +0000
Subject: Re: [PATCH] IB/hfi1: remove redundant assignment to variable ret
Message-Id: <58bcf0a3-bd5d-66ad-ced4-9a0660f9ba4b@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191122154814.87257-1-colin.king@canonical.com>
In-Reply-To: <20191122154814.87257-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/22/2019 10:48 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never
> read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/infiniband/hw/hfi1/platform.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/hfi1/platform.c b/drivers/infiniband/hw/hfi1/platform.c
> index cbf7faa5038c..36593f2efe26 100644
> --- a/drivers/infiniband/hw/hfi1/platform.c
> +++ b/drivers/infiniband/hw/hfi1/platform.c
> @@ -634,7 +634,7 @@ static void apply_tx_lanes(struct hfi1_pportdata *ppd, u8 field_id,
>   			   u32 config_data, const char *message)
>   {
>   	u8 i;
> -	int ret = HCMD_SUCCESS;
> +	int ret;
>   
>   	for (i = 0; i < 4; i++) {
>   		ret = load_8051_config(ppd->dd, field_id, i, config_data);
> 

Thanks.

Acked-by: Dennis Dalessandro <dennis.dalessandro@intel.com>
