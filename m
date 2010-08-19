From: David Miller <davem@davemloft.net>
Date: Thu, 19 Aug 2010 07:06:40 +0000
Subject: Re: [PATCH] tehuti: Use net_device_stats from struct net_device
Message-Id: <20100819.000640.123990188.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282061577-19484-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1282061577-19484-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tklauser@distanz.ch
Cc: baum@tehutinetworks.net, andy@greyhouse.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Tobias Klauser <tklauser@distanz.ch>
Date: Tue, 17 Aug 2010 18:12:57 +0200

> struct net_device has its own struct net_device_stats member, so use
> this one instead of a private copy in the bdx_priv struct.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Please delete the bdx_get_stats() function and the assignment of
it into the netdev ops, as it is now superfluous.

Thanks.
