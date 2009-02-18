From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:21:32 +0000
Subject: Re: [PATCH 03/43] drivers/net/ni65.c: fix sparse warnings: symbol
Message-Id: <20090217.172132.01589488.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211218.23489.71130.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211218.23489.71130.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:12:23 +0100

> Impact: Remove redundant variable declaration or move them to a more
> inner scope.
> 
> Fix this sparse warnings:
>   drivers/net/ni65.c:900:37: warning: symbol 'p' shadows an earlier one
>   drivers/net/ni65.c:874:21: originally declared here
>   drivers/net/ni65.c:925:21: warning: symbol 'p' shadows an earlier one
>   drivers/net/ni65.c:874:21: originally declared here
>   drivers/net/ni65.c:945:29: warning: symbol 'k' shadows an earlier one
>   drivers/net/ni65.c:926:15: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
