From: Bart Van Assche <Bart.VanAssche@sandisk.com>
Date: Fri, 27 Jan 2017 21:31:55 +0000
Subject: Re: [PATCH] IB/cma: Fix reversed test
Message-Id: <1485552696.13218.0.camel@sandisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170127131535.19918-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170127131535.19918-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>, "hal.rosenstock@gmail.com" <hal.rosenstock@gmail.com>, "dledford@redhat.com" <dledford@redhat.com>, "sean.hefty@intel.com" <sean.hefty@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, 2017-01-27 at 14:15 +0100, Christophe JAILLET wrote:
> This test looks reverted.
> We should log an error message only if 'ib_attach_mcast()' fails.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/infiniband/core/cma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
> index cfefb941d729..175f62e5841e 100644
> --- a/drivers/infiniband/core/cma.c
> +++ b/drivers/infiniband/core/cma.c
> @@ -3838,7 +3838,7 @@ static int cma_ib_mc_handler(int status, struct ib_sa_multicast *multicast)
>  	if (!status && id_priv->id.qp) {
>  		status = ib_attach_mcast(id_priv->id.qp, &multicast->rec.mgid,
>  					 be16_to_cpu(multicast->rec.mlid));
> -		if (!status)
> +		if (status)
>  			pr_debug_ratelimited("RDMA CM: MULTICAST_ERROR: failed to attach QP. status %d\n",
>  					     status);
>  	}

Hello Christophe,

Do you think this patch needs "Fixes:" and "Cc: stable" tags?

Thanks,

Bart.