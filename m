From: David Miller <davem@davemloft.net>
Date: Wed, 02 Sep 2020 22:41:44 +0000
Subject: Re: [PATCH net] net: gemini: Fix another missing clk_disable_unprepare() in probe
Message-Id: <20200902.154144.1959394275972532074.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200902115631.GA286978@mwanda>
In-Reply-To: <20200902115631.GA286978@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ulli.kroll@googlemail.com, wanghai38@huawei.com, linus.walleij@linaro.org, kuba@kernel.org, mirq-linux@rere.qmqm.pl, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 2 Sep 2020 14:56:31 +0300

> We recently added some calls to clk_disable_unprepare() but we missed
> the last error path if register_netdev() fails.
> 
> I made a couple cleanups so we avoid mistakes like this in the future.
> First I reversed the "if (!ret)" condition and pulled the code in one
> indent level.  Also, the "port->netdev = NULL;" is not required because
> "port" isn't used again outside this function so I deleted that line.
> 
> Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied and queued up for -stable, thanks.

Unrelated to your patch but...

>  	ret = register_netdev(netdev);
 ...
> +	ret = gmac_setup_phy(netdev);

Should we really be setting up the PHY after registering the netdev?

The moment we register it, entities can try to bring the interface up
and shouldn't we have the PHY bits all squared away before that?
