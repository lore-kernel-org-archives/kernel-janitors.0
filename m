From: Alan Stern <stern@rowland.harvard.edu>
Date: Mon, 27 Aug 2012 14:38:56 +0000
Subject: Re: [PATCH 4/6] drivers/usb/host/ohci-nxp.c: adjust inconsistent IS_ERR and PTR_ERR
Message-Id: <Pine.LNX.4.44L0.1208271038370.1817-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1345924629-16584-5-git-send-email-Julia.Lawall@lip6.fr>
References: <1345924629-16584-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345924629-16584-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 25 Aug 2012, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Change the call to PTR_ERR to access the value just tested by IS_ERR.

> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/usb/host/ohci-nxp.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index a446386..c60066a 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -355,7 +355,7 @@ static int __devinit usb_hcd_nxp_probe(struct platform_device *pdev)
>  	usb_otg_clk = clk_get(&pdev->dev, "ck_usb_otg");
>  	if (IS_ERR(usb_otg_clk)) {
>  		dev_err(&pdev->dev, "failed to acquire USB DEV Clock\n");
> -		ret = PTR_ERR(usb_dev_clk);
> +		ret = PTR_ERR(usb_otg_clk);
>  		goto out6;
>  	}

Acked-by: Alan Stern <stern@rowland.harvard.edu>

