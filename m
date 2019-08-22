From: Michal Simek <michal.simek@xilinx.com>
Date: Thu, 22 Aug 2019 08:18:20 +0000
Subject: Re: [PATCH 3/4] misc: xilinx_sdfec: Prevent a divide by zero in xsdfec_reg0_write()
Message-Id: <022ae855-828a-9a0e-18fd-73f8c1424dc9@xilinx.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190821070953.GC26957@mwanda>
In-Reply-To: <20190821070953.GC26957@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Derek Kiernan <derek.kiernan@xilinx.com>, Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 21. 08. 19 9:09, Dan Carpenter wrote:
> The "psize" value comes from the user so we need to verify that it's
> non-zero before we check if "n % psize" or it will crash.
> 
> Fixes: 20ec628e8007 ("misc: xilinx_sdfec: Add ability to configure LDPC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The parentheses in this condition are a no-op.  They're just confusing.
> Perhaps something else was intended?
> 
>  drivers/misc/xilinx_sdfec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
> index 813b82c59360..3fc53d20abf3 100644
> --- a/drivers/misc/xilinx_sdfec.c
> +++ b/drivers/misc/xilinx_sdfec.c
> @@ -460,7 +460,7 @@ static int xsdfec_reg0_write(struct xsdfec_dev *xsdfec, u32 n, u32 k, u32 psize,
>  {
>  	u32 wdata;
>  
> -	if (n < XSDFEC_REG0_N_MIN || n > XSDFEC_REG0_N_MAX ||
> +	if (n < XSDFEC_REG0_N_MIN || n > XSDFEC_REG0_N_MAX || psize = 0 ||
>  	    (n > XSDFEC_REG0_N_MUL_P * psize) || n <= k || ((n % psize) != 0)) {
>  		dev_dbg(xsdfec->dev, "N value is not in range");
>  		return -EINVAL;
> 

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
