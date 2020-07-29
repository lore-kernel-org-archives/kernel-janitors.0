From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Jul 2020 08:38:37 +0000
Subject: Re: [PATCH] ethernet: fix potential memory leak in gemini_ethernet_port_probe()
Message-Id: <c9c7e5a3-4909-e0c9-1c69-0ad3643ca3f5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Lu Wei <luwei32@huawei.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Jakub Kicinski <kuba@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>

> If some processes in gemini_ethernet_port_probe() fail,
> free_netdev(dev) needs to be called to avoid a memory leak.

Would you like to use an imperative wording for this change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=6ba1b005ffc388c2aeaddae20da29e4810dea298#n151


…
> +++ b/drivers/net/ethernet/cortina/gemini.c
> @@ -2501,8 +2513,10 @@  static int gemini_ethernet_port_probe(struct platform_device *pdev)
>  					IRQF_SHARED,
>  					port_names[port->id],
>  					port);
> -	if (ret)
> +	if (ret) {
> +		free_netdev(netdev);
>  		return ret;
> +	}
>
>  	ret = register_netdev(netdev);
…

I suggest to add a jump target for the desired exception handling
in this function implementation.

 	if (ret)
-		return ret;
+		goto free_netdev;

Regards,
Markus
