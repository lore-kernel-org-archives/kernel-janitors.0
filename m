From: Peter Chen <peter.chen@freescale.com>
Date: Mon, 21 Jan 2013 23:44:49 +0000
Subject: Re: [PATCH 2/15] drivers/usb/chipidea/core.c: adjust duplicate test
Message-Id: <20130121234448.GB3978@nchen-desktop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358773378-4700-1-git-send-email-Julia.Lawall@lip6.fr>
 <1358773378-4700-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1358773378-4700-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 21, 2013 at 02:02:46PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Delete successive tests to the same location.  In this case res has already
> been tested for being NULL, and calling devm_request_and_ioremap will not
> make it NULL.  On the other hand, devm_request_and_ioremap can return NULL
> on failure.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @s exists@
> local idexpression y;
> expression x,e;
> @@
> 
> *if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
>  { ... when forall
>    return ...; }
> ... when != \(y = e\|y += e\|y -= e\|y |= e\|y &= e\|y++\|y--\|&y\)
>     when != \(XT_GETPAGE(...,y)\|WMI_CMD_BUF(...)\)
> *if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
>  { ... when forall
>    return ...; }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> This code could be improved in other ways.  The previous NULL test on res
> is not needed, and the dev_err in the error-handling code for the call to
> devm_request_and_ioremap is redundant with respect to the logging already
> done by devm_request_and_ioremap.  But these should probably be done
> separately.
> 
>  drivers/usb/chipidea/core.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index aebf695..57cae1f 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -411,7 +411,7 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  	}
>  
>  	base = devm_request_and_ioremap(dev, res);
> -	if (!res) {
> +	if (!base) {
>  		dev_err(dev, "can't request and ioremap resource\n");
>  		return -ENOMEM;
>  	}
> 
Tested-and-reviewed-by: Peter Chen <peter.chen@freescale.com>

-- 

Best Regards,
Peter Chen

