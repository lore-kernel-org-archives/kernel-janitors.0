From: Dan Carpenter <error27@gmail.com>
Date: Sat, 10 Jul 2010 14:12:04 +0000
Subject: Re: [PATCH] atmel: unregister_netdev() on error
Message-Id: <20100710141204.GY19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278767508-10164-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278767508-10164-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Simon Kelley <simon@thekelleys.org.uk>, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, Stephen Hemminger <shemminger@vyatta.com>, Eric Dumazet <eric.dumazet@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org

On Sat, Jul 10, 2010 at 05:11:47PM +0400, Kulikov Vasiliy wrote:
> We must unregister registered device if probe_atmel_card() fails.

I think you hit send accidentally on this one?

>  	if (!probe_atmel_card(dev)) {
>  		unregister_netdev(dev);
		^^^^^^^^^^^^^^^^^^^^^^^

> -		goto err_out_res;
> +		goto err_out_unreg;
>  	}
>  
>  	netif_carrier_off(dev);
> @@ -1640,6 +1640,9 @@ struct net_device *init_atmel_card(unsigned short irq, unsigned long port,
>  
>  	return dev;
>  
> +err_out_unreg:
> +	unregister_netdev(dev);
	^^^^^^^^^^^^^^^^^^^^^^
> +

What the pants?  :P

regards,
dan carpenter

