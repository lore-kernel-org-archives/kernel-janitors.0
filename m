From: Dragan Cvetic <draganc@xilinx.com>
Date: Thu, 22 Aug 2019 17:47:15 +0000
Subject: RE: [PATCH 1/4] misc: xilinx_sdfec: Fix a couple small information leaks
Message-Id: <CH2PR02MB63599214D1FC937E256FCBC4CBA50@CH2PR02MB6359.namprd02.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190821070606.GA26957@mwanda>
In-Reply-To: <20190821070606.GA26957@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Derek Kiernan <dkiernan@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Dan,

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Wednesday 21 August 2019 08:06
> To: Derek Kiernan <dkiernan@xilinx.com>; Dragan Cvetic <draganc@xilinx.com>
> Cc: Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Michal Simek <michals@xilinx.com>;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH 1/4] misc: xilinx_sdfec: Fix a couple small information leaks
> 
> These structs have holes in them so we end up disclosing a few bytes of
> uninitialized stack data.
> 
> drivers/misc/xilinx_sdfec.c:305 xsdfec_get_status() warn: check that 'status' doesn't leak information (struct has a hole after 'activity')
> drivers/misc/xilinx_sdfec.c:449 xsdfec_get_turbo() warn: check that 'turbo_params' doesn't leak information (struct has a hole after
> 'scale')
> 
> We need to zero out the holes with memset().
> 
> Fixes: 6bd6a690c2e7 ("misc: xilinx_sdfec: Add stats & status ioctls")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/misc/xilinx_sdfec.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
> index 912e939dec62..dc1b8b412712 100644
> --- a/drivers/misc/xilinx_sdfec.c
> +++ b/drivers/misc/xilinx_sdfec.c
> @@ -295,6 +295,7 @@ static int xsdfec_get_status(struct xsdfec_dev *xsdfec, void __user *arg)
>  	struct xsdfec_status status;
>  	int err;
> 
> +	memset(&status, 0, sizeof(status));
>  	spin_lock_irqsave(&xsdfec->error_data_lock, xsdfec->flags);
>  	status.state = xsdfec->state;
>  	xsdfec->state_updated = false;
> @@ -440,6 +441,7 @@ static int xsdfec_get_turbo(struct xsdfec_dev *xsdfec, void __user *arg)
>  	if (xsdfec->config.code == XSDFEC_LDPC_CODE)
>  		return -EIO;
> 
> +	memset(&turbo_params, 0, sizeof(turbo_params));
>  	reg_value = xsdfec_regread(xsdfec, XSDFEC_TURBO_ADDR);
> 
>  	turbo_params.scale = (reg_value & XSDFEC_TURBO_SCALE_MASK) >>
> --
> 2.20.1

Reviewed-by: Dragan Cvetic <dragan.cvetic@xilinx.com>

Thanks,
Dragan
