From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Oct 2020 11:22:46 +0000
Subject: Re: [PATCH] hw_random : platform_get_irq() already prints an error
Message-Id: <20201027112246.GS1042@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201018054912.GA76941@fedora-thirty-three>
In-Reply-To: <20201018054912.GA76941@fedora-thirty-three>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Oct 18, 2020 at 01:49:12AM -0400, Nigel Christian wrote:
> coccicheck
> drivers/char//hw_random/imx-rngc.c:256:2-9: line 256 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
>  drivers/char/hw_random/imx-rngc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> index 61c844baf26e..69f13ff1bbec 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -253,7 +253,6 @@ static int imx_rngc_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq <= 0) {
            ^^^^^^^^
This check is wrong.  It should be:

	if (irq < 0) {

The platform_get_irq() function will never return zero.  But say it
did return a zero then that means that "return irq;" is returning
success which would be a bug.

> -		dev_err(&pdev->dev, "Couldn't get irq %d\n", irq);
>  		return irq;
>  	}

The patch introduces a new checkpatch warning because now there is only
one statement in the if statment block.  (Patches shouldn't introduce
checkpatch warnings).  It should be:

	irq = platform_get_irq(pdev, 0);
	if (irq < 0)
		return irq;

regards,
dan carpenter
