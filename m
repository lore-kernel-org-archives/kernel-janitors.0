From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 01 Nov 2019 20:42:41 +0000
Subject: Re: [PATCH net-next, 2/4] hv_netvsc: Fix error handling in netvsc_attach()
Message-Id: <cdf7b308-940a-ff9c-07ae-f42b94687e24@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1572296801-4789-3-git-send-email-haiyangz@microsoft.com>
In-Reply-To: <1572296801-4789-3-git-send-email-haiyangz@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Haiyang Zhang <haiyangz@microsoft.com>, linux-hyperv@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, "K. Y. Srinivasan" <kys@microsoft.com>, Olaf Hering <olaf@aepfle.de>, Sasha Levin <sashal@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>, Vitaly Kuznetsov <vkuznets@redhat.com>

> If rndis_filter_open() fails, we need to remove the rndis device created
> in earlier steps, before returning an error code. Otherwise, the retry of
> netvsc_attach() from its callers will fail and hang.

How do you think about to choose a more “imperative mood” for your
change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=0dbe6cb8f7e05bc9611602ef45980a6c57b245a3#n151


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
