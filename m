From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Apr 2019 08:27:59 +0000
Subject: Re: [PATCH 3/3] ethernet: ti: fix possible object reference leak
Message-Id: <1a90f282-4664-f9e6-45d1-7b3b6a0a3104@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1553223849-7143-3-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1553223849-7143-3-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wen Yang <wen.yang99@zte.com.cn>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Murali Karicheri <m-karicheri2@ti.com>, Wingman Kwok <w-kwok2@ti.com>, Yi Wang <wang.yi59@zte.com.cn>

> @@ -3657,12 +3657,16 @@  static int gbe_probe(struct netcp_device *netcp_device, struct device *dev,
>
>  	ret = netcp_txpipe_init(&gbe_dev->tx_pipe, netcp_device,
>  				gbe_dev->dma_chan_name, gbe_dev->tx_queue_id);
> -	if (ret)
> +	if (ret) {
> +		of_node_put(interfaces);
>  		return ret;
> +	}
>
>  	ret = netcp_txpipe_open(&gbe_dev->tx_pipe);
> -	if (ret)
> +	if (ret) {
> +		of_node_put(interfaces);
>  		return ret;
> +	}
>
>  	/* Create network interfaces */
>  	INIT_LIST_HEAD(&gbe_dev->gbe_intf_head);

Would you like to move such duplicate statements to an additional jump target
for the desired exception handling?

Regards,
Markus
