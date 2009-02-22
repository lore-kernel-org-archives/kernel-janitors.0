From: David Miller <davem@davemloft.net>
Date: Sun, 22 Feb 2009 08:06:56 +0000
Subject: Re: [PATCH 1/2] Doc: Fix rp_filter description in net/ipv4/Kconfig.
Message-Id: <20090222.000656.74298101.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1235141957.2351.37.camel@localhost.localdomain>
	<1235142193.2351.41.camel@localhost.localdomain>
In-Reply-To: <1235142193.2351.41.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jdb@comx.dk
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Jesper Dangaard Brouer <jdb@comx.dk>
Date: Fri, 20 Feb 2009 16:03:13 +0100

> Author: Jesper Dangaard Brouer <hawk@comx.dk>
> Date:   Fri Feb 20 15:20:57 2009 +0100
> 
>     Doc: Fix rp_filter description in net/ipv4/Kconfig.
>     
>     The reverse path filter (rp_filter) will NOT get enabled
>     when enabling forwarding.  Read the code and tested in
>     in practice.
>     
>     Most distributions does enable it in startup scripts.
>     
>     Signed-off-by: Jesper Dangaard Brouer <hawk@comx.dk>

Applied, thanks Jesper.

Could you write a follow-on patch that accounts for the change Stephen
just made in net-next-2.6 which allows strong vs. weak rp filtering?

Thanks.
