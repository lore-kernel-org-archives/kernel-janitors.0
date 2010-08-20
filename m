From: David Miller <davem@davemloft.net>
Date: Fri, 20 Aug 2010 00:19:26 +0000
Subject: Re: [PATCH v2] ep93xx_eth: Use net_device_stats from struct
Message-Id: <20100819.171926.241460691.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282061678-19590-1-git-send-email-tklauser@distanz.ch>
	<1282205434-9601-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1282205434-9601-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tklauser@distanz.ch
Cc: kernel@wantstofly.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 19 Aug 2010 10:10:34 +0200

> struct net_device has its own struct net_device_stats member, so use
> this one instead of a private copy in the ep93xx_priv struct. As the new
> ndo_get_stats function would just return dev->stats we can omit it.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Applied.
