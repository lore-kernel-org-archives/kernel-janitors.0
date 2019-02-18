From: David Miller <davem@davemloft.net>
Date: Mon, 18 Feb 2019 20:13:37 +0000
Subject: Re: [PATCH net-next] yellowfin: fix remove set but not used variable warning
Message-Id: <20190218.121337.147896114474592034.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218081546.189509-1-yuehaibing@huawei.com>
In-Reply-To: <20190218081546.189509-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: yang.wei9@zte.com.cn, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 08:15:46 +0000

> @@ -1050,8 +1050,11 @@ static int yellowfin_rx(struct net_device *dev)
>  		struct sk_buff *rx_skb = yp->rx_skbuff[entry];
>  		s16 frame_status;
>  		u16 desc_status;
> -		int data_size, yf_size;
> +		int data_size;
>  		u8 *buf_addr;
> +#ifdef YF_PROTOTYPE
> +		int yf_size = sizeof(struct yellowfin_desc);
> +#endif

This is just silly.

Please move this variable declaration and initialization into the
YF_PROTOTYPE basic block in the code below it, like this:

#ifdef YF_PROTOTYPE		/* Support for prototype hardware errata. */
		} else if ((yp->flags & HasMACAddrBug)  &&
			int yf_size = sizeof(struct yellowfin_desc);

			!ether_addr_equal(le32_to_cpu(yp->rx_ring_dma +
						      entry * yf_size),
					  dev->dev_addr) &&
			!ether_addr_equal(le32_to_cpu(yp->rx_ring_dma +
						      entry * yf_size),
					  "\377\377\377\377\377\377")) {
			if (bogus_rx++ = 0)
				netdev_warn(dev, "Bad frame to %pM\n",
					    buf_addr);
#endif

Thanks.
