From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:41:12 +0000
Subject: Re: [PATCH 30/43] drivers/net/tokenring: fix sparse warning:
Message-Id: <20090217.174112.80573704.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214214426.24377.61106.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214214426.24377.61106.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:44:44 +0100

> Impact: Remove redundant variables.
> 
> Fix this sparse warnings:
>   drivers/net/tokenring/lanstreamer.c:619:21: warning: symbol 'i' shadows an earlier one
>   drivers/net/tokenring/lanstreamer.c:589:13: originally declared here
>   drivers/net/tokenring/madgemc.c:695:34: warning: symbol 'tp' shadows an earlier one
>   drivers/net/tokenring/madgemc.c:689:26: originally declared here
>   drivers/net/tokenring/olympic.c:702:21: warning: symbol 'i' shadows an earlier one
>   drivers/net/tokenring/olympic.c:440:13: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
