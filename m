From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 01 Nov 2019 20:14:33 +0000
Subject: Re: [PATCH net, 2/2] hv_netvsc: Fix error handling in netvsc_attach()
Message-Id: <77a1611b-1609-ca74-39d0-3ecd16290219@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1572449471-5219-3-git-send-email-haiyangz@microsoft.com>
In-Reply-To: <1572449471-5219-3-git-send-email-haiyangz@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Haiyang Zhang <haiyangz@microsoft.com>, linux-hyperv@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, "K. Y. Srinivasan" <kys@microsoft.com>, Olaf Hering <olaf@aepfle.de>, Sasha Levin <sashal@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Vitaly Kuznetsov <vkuznets@redhat.com>

…
> +++ b/drivers/net/hyperv/netvsc_drv.c
> @@ -982,7 +982,7 @@ static int netvsc_attach(struct net_device *ndev,
>  	if (netif_running(ndev)) {
>  		ret = rndis_filter_open(nvdev);
>  		if (ret)
> -			return ret;
> +			goto err;
>
>  		rdev = nvdev->extension;
>  		if (!rdev->link_state)
…

I would prefer to specify the completed exception handling
(addition of two function calls) by a compound statement in
the shown if branch directly.

If you would insist to use a goto statement, I find an other label
more appropriate according to the Linux coding style.

Regards,
Markus
