From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:26:46 +0000
Subject: Re: [PATCH 12/43] drivers/net/atl1e: fix sparse warnings: fix
Message-Id: <20090217.172646.111747554.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211452.23489.8257.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211452.23489.8257.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:14:58 +0100

> Fix this sparse warnings:
>   drivers/net/atl1e/atl1e_main.c:716:39: warning: incorrect type in argument 2 (different signedness)
>   drivers/net/atl1e/atl1e_param.c:57:1: warning: incorrect type in initializer (different signedness)
>   drivers/net/atl1e/atl1e_param.c:68:1: warning: incorrect type in initializer (different signedness)
>   drivers/net/atl1e/atl1e_param.c:81:1: warning: incorrect type in initializer (different signedness)
>   drivers/net/atl1e/atl1e_param.c:92:1: warning: incorrect type in initializer (different signedness)
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
