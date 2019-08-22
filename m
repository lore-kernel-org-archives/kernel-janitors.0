From: Dragan Cvetic <draganc@xilinx.com>
Date: Thu, 22 Aug 2019 17:47:40 +0000
Subject: RE: [PATCH 2/4] misc: xilinx_sdfec: Return -EFAULT if copy_from_user() fails
Message-Id: <CH2PR02MB63593847840988DBE32C8D65CBA50@CH2PR02MB6359.namprd02.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190821070606.GA26957@mwanda> <20190821070702.GB26957@mwanda>
In-Reply-To: <20190821070702.GB26957@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Derek Kiernan <dkiernan@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Dan,

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Wednesday 21 August 2019 08:07
> To: Derek Kiernan <dkiernan@xilinx.com>; Dragan Cvetic <draganc@xilinx.com>
> Cc: Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Michal Simek <michals@xilinx.com>;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH 2/4] misc: xilinx_sdfec: Return -EFAULT if copy_from_user() fails
> 
> The copy_from_user() funciton returns the number of bytes remaining to
> be copied but we want to return -EFAULT to the user.
> 
> Fixes: 20ec628e8007 ("misc: xilinx_sdfec: Add ability to configure LDPC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/misc/xilinx_sdfec.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
> index dc1b8b412712..813b82c59360 100644
> --- a/drivers/misc/xilinx_sdfec.c
> +++ b/drivers/misc/xilinx_sdfec.c
> @@ -651,9 +651,10 @@ static int xsdfec_add_ldpc(struct xsdfec_dev *xsdfec, void __user *arg)
>  	if (!ldpc)
>  		return -ENOMEM;
> 
> -	ret = copy_from_user(ldpc, arg, sizeof(*ldpc));
> -	if (ret)
> +	if (copy_from_user(ldpc, arg, sizeof(*ldpc))) {
> +		ret = -EFAULT;
>  		goto err_out;
> +	}
> 
>  	if (xsdfec->config.code == XSDFEC_TURBO_CODE) {
>  		ret = -EIO;
> --
> 2.20.1

Reviewed-by: Dragan Cvetic <dragan.cvetic@xilinx.com>

Thanks,
Dragan
