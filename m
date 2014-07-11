From: David Miller <davem@davemloft.net>
Date: Fri, 11 Jul 2014 22:05:08 +0000
Subject: Re: [PATCH net-next] net/hsr: Remove left-over never-true conditional code.
Message-Id: <20140711.150508.417899658136259344.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140710210037.GA14669@mwanda>
	<53C00EF8.1040403@alten.se>
In-Reply-To: <53C00EF8.1040403@alten.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: arvid.brodin@alten.se
Cc: dan.carpenter@oracle.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Arvid Brodin <arvid.brodin@alten.se>
Date: Fri, 11 Jul 2014 18:21:12 +0200

> MacAddressB is an array (unsigned char MacAddressB[ETH_ALEN]) and is allocated
> as a part of *node_dst (which is a struct hsr_node). So the condition is always
> false.
> 
> Detected by Dan Carpenter.
> 
> Signed-off-by: Arvid Brodin <arvid.brodin@alten.se>

Applied, thanks.
