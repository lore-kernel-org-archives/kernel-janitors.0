From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 26 Dec 2015 17:36:25 +0000
Subject: Re: [PATCH 6/7] drivers: net: cpsw: fix error return code
Message-Id: <567ED019.3000407@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451143726-28195-1-git-send-email-Julia.Lawall@lip6.fr>
 <1451143726-28195-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451143726-28195-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello.

On 12/26/2015 6:28 PM, Julia Lawall wrote:

> Return a negative error code on failure.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> identifier ret; expression e1,e2;
> @@
> (
> if (\(ret < 0\|ret != 0\))
>   { ... return ret; }
> |
> ret = 0
> )
> ... when != ret = e1
>      when != &ret
> *if(...)
> {
>    ... when != ret = e2
>        when forall
>   return ret;
> }
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>   drivers/net/ethernet/ti/cpsw.c |    8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
> index 3409e80..6a76992 100644
> --- a/drivers/net/ethernet/ti/cpsw.c
> +++ b/drivers/net/ethernet/ti/cpsw.c
> @@ -2448,8 +2448,10 @@ static int cpsw_probe(struct platform_device *pdev)
>
>   	/* RX IRQ */
>   	irq = platform_get_irq(pdev, 1);
> -	if (irq < 0)
> +	if (irq < 0) {
> +		ret = -ENOENT;

    Why not just propagate an error returned by that function?

>   		goto clean_ale_ret;
> +	}
>
>   	priv->irqs_table[0] = irq;
>   	ret = devm_request_irq(&pdev->dev, irq, cpsw_rx_interrupt,
> @@ -2461,8 +2463,10 @@ static int cpsw_probe(struct platform_device *pdev)
>
>   	/* TX IRQ */
>   	irq = platform_get_irq(pdev, 2);
> -	if (irq < 0)
> +	if (irq < 0) {
> +		ret = -ENOENT;

    Likewise?

[...]

MBR, Sergei

