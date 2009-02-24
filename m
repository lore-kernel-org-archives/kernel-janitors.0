From: David Miller <davem@davemloft.net>
Date: Tue, 24 Feb 2009 11:48:29 +0000
Subject: Re: [PATCH 3/3] Doc: Refer to ip-sysctl.txt for strict vs. loose
Message-Id: <20090224.034829.196093688.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1235142193.2351.41.camel@localhost.localdomain>
	<20090222.000656.74298101.davem@davemloft.net>
	<1235400043.2351.52.camel@localhost.localdomain>
In-Reply-To: <1235400043.2351.52.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jdb@comx.dk
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Jesper Dangaard Brouer <jdb@comx.dk>
Date: Mon, 23 Feb 2009 15:40:43 +0100

> 
> The IP_ADVANCED_ROUTER Kconfig describes the rp_filter
> proc option.  Recent changes added a loose mode.
> Instead of documenting this change too places, refer to
> the document describing it:
>  Documentation/networking/ip-sysctl.txt
> 
> I'm considering moving the rp_filter description away
> from the Kconfig file into ip-sysctl.txt.
> 
> Signed-off-by: Jesper Dangaard Brouer <hawk@comx.dk>

Also applied, thanks a lot Jesper.
