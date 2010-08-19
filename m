From: David Miller <davem@davemloft.net>
Date: Thu, 19 Aug 2010 07:13:03 +0000
Subject: Re: [PATCH v4] ether3: Use net_device_stats from struct net_device
Message-Id: <20100819.001303.235703853.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282061733-19700-1-git-send-email-tklauser@distanz.ch>
	<1282198531-4157-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1282198531-4157-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 19 Aug 2010 08:15:31 +0200

> struct net_device has its own struct net_device_stats member, so use
> this one instead of a private copy in the ether1_priv struct. As the new
> ndo_get_stats function would just return dev->stats we can omit it. This
> patch also removes an incorrect memset of the stats on open.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---

Applied, thanks.
