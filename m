From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Apr 2019 07:54:45 +0000
Subject: Re: [PATCH 1/3] net: xilinx: fix possible object reference leak
Message-Id: <d2f169a0-b982-82ca-b2f1-963b8a579504@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1553223849-7143-1-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1553223849-7143-1-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wen Yang <wen.yang99@zte.com.cn>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Anirudha Sarangi <anirudh@xilinx.com>, John Linn <John.Linn@xilinx.com>, linux-arm-kernel@lists.infradead.org

> @@ -1575,12 +1575,14 @@  static int axienet_probe(struct platform_device =
*pdev)
>  	ret =3D of_address_to_resource(np, 0, &dmares);
>  	if (ret) {
>  		dev_err(&pdev->dev, "unable to get DMA resource\n");
> +		of_node_put(np);
>  		goto free_netdev;
>  	}
>  	lp->dma_regs =3D devm_ioremap_resource(&pdev->dev, &dmares);
>  	if (IS_ERR(lp->dma_regs)) {
>  		dev_err(&pdev->dev, "could not map DMA regs\n");
>  		ret =3D PTR_ERR(lp->dma_regs);
> +		of_node_put(np);
>  		goto free_netdev;
>  	}

How do you think about to move these put calls to an additional
jump target for the desired exception handling?

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/net/ethernet/xilinx/xilinx_axienet_main.c?id=FA3a419d2f674b431d38748c=
b58fb7da17ee8949#n1621

Regards,
Markus
