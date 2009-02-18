From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 03:35:35 +0000
Subject: Re: [PATCH 38/43] drivers/net/wireless: fix sparse warnings:
Message-Id: <20090217.193535.170390441.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214214852.24377.70239.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214214852.24377.70239.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:49:09 +0100

> Impact:
>   Move variable closer to usage resp.
>   remove redundant variables resp.
>   rename function scope variable.
> 
> Fix this sparse warnings:
>   drivers/net/wireless/airo.c:3840:29: warning: symbol 'i' shadows an earlier one
>   drivers/net/wireless/airo.c:3751:13: originally declared here
>   drivers/net/wireless/airo.c:3847:29: warning: symbol 'i' shadows an earlier one
>   drivers/net/wireless/airo.c:3751:13: originally declared here
>   drivers/net/wireless/airo.c:3861:21: warning: symbol 'i' shadows an earlier one
>   drivers/net/wireless/airo.c:3751:13: originally declared here
>   drivers/net/wireless/wavelan.c:43:13: warning: symbol 'irq' shadows an earlier one
>   drivers/net/wireless/wavelan.p.h:692:17: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
