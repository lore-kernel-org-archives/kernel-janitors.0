From: Michal Simek <michal.simek@xilinx.com>
Date: Thu, 22 Aug 2019 08:16:54 +0000
Subject: Re: [PATCH 2/4] misc: xilinx_sdfec: Return -EFAULT if copy_from_user() fails
Message-Id: <35a942ef-d8e9-0b81-932f-93ef9e552d50@xilinx.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190821070702.GB26957@mwanda>
In-Reply-To: <20190821070702.GB26957@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Derek Kiernan <derek.kiernan@xilinx.com>, Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 21. 08. 19 9:07, Dan Carpenter wrote:
> The copy_from_user() funciton returns the number of bytes remaining to

typo here.

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
>  	if (xsdfec->config.code = XSDFEC_TURBO_CODE) {
>  		ret = -EIO;
> 

When typo fixed feel free to add my
Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
