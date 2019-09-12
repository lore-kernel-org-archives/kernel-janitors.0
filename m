From: Jason Gunthorpe <jgg@mellanox.com>
Date: Thu, 12 Sep 2019 15:10:12 +0000
Subject: Re: [PATCH] RDMA/bnxt_re: fix spelling mistake "missin_resp" -> "missing_resp"
Message-Id: <20190912150957.GA9160@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190911092856.11146-1-colin.king@canonical.com>
In-Reply-To: <20190911092856.11146-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Selvin Xavier <selvin.xavier@broadcom.com>, Devesh Sharma <devesh.sharma@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Doug Ledford <dledford@redhat.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 11, 2019 at 10:28:56AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a literal string, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/bnxt_re/hw_counters.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/bnxt_re/hw_counters.c b/drivers/infiniband/hw/bnxt_re/hw_counters.c
> index 604b71875f5f..3421a0b15983 100644
> --- a/drivers/infiniband/hw/bnxt_re/hw_counters.c
> +++ b/drivers/infiniband/hw/bnxt_re/hw_counters.c
> @@ -74,7 +74,7 @@ static const char * const bnxt_re_stat_name[] = {
>  	[BNXT_RE_SEQ_ERR_NAKS_RCVD]     = "seq_err_naks_rcvd",
>  	[BNXT_RE_MAX_RETRY_EXCEEDED]    = "max_retry_exceeded",
>  	[BNXT_RE_RNR_NAKS_RCVD]         = "rnr_naks_rcvd",
> -	[BNXT_RE_MISSING_RESP]          = "missin_resp",
> +	[BNXT_RE_MISSING_RESP]          = "missing_resp",

Broadcom folks, can you confirm if this is OK? Is the string ABI for
this driver?

Jason
