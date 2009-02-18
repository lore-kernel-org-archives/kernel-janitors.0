From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:26:54 +0000
Subject: Re: [PATCH 13/43] drivers/net/atlx: fix sparse warnings: fix
Message-Id: <20090217.172654.50571162.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211508.23489.57841.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211508.23489.57841.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:15:17 +0100

> Impact: While being at it: statics do not need to be initialized with 0.
> 
> Fix this sparse warnings:
>   drivers/net/atlx/atl1.c:109:1: warning: incorrect type in initializer (different signedness)
>   drivers/net/atlx/atl2.c:2870:1: warning: incorrect type in initializer (different signedness)
>   drivers/net/atlx/atl2.c:2880:1: warning: incorrect type in initializer (different signedness)
>   drivers/net/atlx/atl2.c:2894:1: warning: incorrect type in initializer (different signedness)
>   drivers/net/atlx/atl2.c:2904:1: warning: incorrect type in initializer (different signedness)
>   drivers/net/atlx/atl2.c:2913:1: warning: incorrect type in initializer (different signedness)
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
