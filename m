From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 17 May 2014 20:25:58 +0000
Subject: Re: [PATCH 4/4] IB: Remove redundant error check
Message-Id: <20140517202558.GG15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400350980-30455-4-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1400350980-30455-4-git-send-email-peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sat, May 17, 2014 at 08:23:00PM +0200, Peter Senna Tschudin wrote:
> ---
>  drivers/infiniband/hw/ocrdma/ocrdma_hw.c |    6 +++---
>  drivers/infiniband/ulp/srpt/ib_srpt.c    |    8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_hw.c b/drivers/infiniband/hw/ocrdma/ocrdma_hw.c
> index 3bbf201..f085a51 100644
> --- a/drivers/infiniband/hw/ocrdma/ocrdma_hw.c
> +++ b/drivers/infiniband/hw/ocrdma/ocrdma_hw.c
> @@ -1839,11 +1839,11 @@ int ocrdma_reg_mr(struct ocrdma_dev *dev,
>  
>  		status = ocrdma_mbx_reg_mr_cont(dev, hwmr, cur_pbl_cnt,
>  						pbl_offset, last);
> -		if (status)
> +		if (status) {
> +			pr_err("%s() err. status=%d\n", __func__, status);
>  			break;

			return status;


> +		}
>  	}
> -	if (status)
> -		pr_err("%s() err. status=%d\n", __func__, status);
>  
>  	return status;

	return 0;

>  }

regards,
dan carpenter
