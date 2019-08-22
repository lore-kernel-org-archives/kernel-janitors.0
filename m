From: Dragan Cvetic <draganc@xilinx.com>
Date: Thu, 22 Aug 2019 17:55:54 +0000
Subject: RE: [PATCH 4/4] misc: xilinx_sdfec: Prevent integer overflow in xsdfec_table_write()
Message-Id: <CH2PR02MB63593CB2434AC146D841E56BCBA50@CH2PR02MB6359.namprd02.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190821070606.GA26957@mwanda> <20190821071122.GD26957@mwanda>
In-Reply-To: <20190821071122.GD26957@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Derek Kiernan <dkiernan@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Dan,


> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Wednesday 21 August 2019 08:11
> To: Derek Kiernan <dkiernan@xilinx.com>; Dragan Cvetic <draganc@xilinx.com>
> Cc: Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Michal Simek <michals@xilinx.com>;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH 4/4] misc: xilinx_sdfec: Prevent integer overflow in xsdfec_table_write()
> 
> The checking here needs to handle integer overflows because "offset" and
> "len" come from the user.

Good catch, thanks.

> 
> Fixes: 20ec628e8007 ("misc: xilinx_sdfec: Add ability to configure LDPC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/misc/xilinx_sdfec.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
> index 3fc53d20abf3..0bf3bcc8e1ef 100644
> --- a/drivers/misc/xilinx_sdfec.c
> +++ b/drivers/misc/xilinx_sdfec.c
> @@ -611,7 +611,9 @@ static int xsdfec_table_write(struct xsdfec_dev *xsdfec, u32 offset,
>  	 * Writes that go beyond the length of
>  	 * Shared Scale(SC) table should fail
>  	 */
> -	if ((XSDFEC_REG_WIDTH_JUMP * (offset + len)) > depth) {
> +	if (offset > depth / XSDFEC_REG_WIDTH_JUMP ||
> +	    len > depth / XSDFEC_REG_WIDTH_JUMP ||
> +	    offset + len > depth / XSDFEC_REG_WIDTH_JUMP) {
>  		dev_dbg(xsdfec->dev, "Write exceeds SC table length");
>  		return -EINVAL;
>  	}
> --
> 2.20.1

Reviewed-by: Dragan Cvetic <dragan.cvetic@xilinx.com>

Thanks 
Dragan
