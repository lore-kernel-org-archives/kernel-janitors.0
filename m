From: David Miller <davem@davemloft.net>
Date: Thu, 15 Aug 2013 08:39:07 +0000
Subject: Re: [PATCH] drivers/net/ethernet/via/via-velocity.c: update napi implementation
Message-Id: <20130815.013907.319502653692029822.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376490413-12067-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376490413-12067-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: romieu@fr.zoreil.com, roszenrami@gmail.com, dshwatrz@gmail.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 14 Aug 2013 16:26:53 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Drivers supporting NAPI should use a NAPI-specific function for receiving
> packets.  Hence netif_rx is changed to netif_receive_skb.
> 
> Furthermore netif_napi_del should be used in the probe and remove function
> to clean up the NAPI resource information.
> 
> Thanks to Francois Romieu, David Shwatrz and Rami Rosen for their help on
> this patch.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.
