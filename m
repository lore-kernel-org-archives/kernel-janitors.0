From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Feb 2020 06:35:29 +0000
Subject: Re: [PATCH][next] soc: fsl: dpio: fix dereference of pointer p before null check
Message-Id: <20200224063529.GA3286@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200221231143.30131-1-colin.king@canonical.com>
In-Reply-To: <20200221231143.30131-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org, Roy Pledge <Roy.Pledge@nxp.com>, kernel-janitors@vger.kernel.org, Youri Querry <youri.querry_1@nxp.com>, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

On Fri, Feb 21, 2020 at 11:11:43PM +0000, Colin King wrote:
> ---
>  drivers/soc/fsl/dpio/qbman-portal.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
> index 740ee0d19582..d1f49caa5b13 100644
> --- a/drivers/soc/fsl/dpio/qbman-portal.c
> +++ b/drivers/soc/fsl/dpio/qbman-portal.c
> @@ -249,10 +249,11 @@ struct qbman_swp *qbman_swp_init(const struct qbman_swp_desc *d)
>  	u32 mask_size;
>  	u32 eqcr_pi;
>  
> -	spin_lock_init(&p->access_spinlock);
> -
>  	if (!p)
>  		return NULL;
> +
> +	spin_lock_init(&p->access_spinlock);

Allocations in the declaration blog are not super common in the kernel,
but they're more bug prone.  Generally, it's not beautiful to call a
function which can fail in the allocation block.

regards,
dan carpenter
