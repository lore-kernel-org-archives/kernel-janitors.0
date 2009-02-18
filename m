From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:21:44 +0000
Subject: Re: [PATCH 05/43] drivers/net/niu.c: fix sparse warning: symbol
Message-Id: <20090217.172144.27843428.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211244.23489.31564.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211244.23489.31564.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:12:48 +0100

> Impact: Move variable declaration to a more inner scope.
> 
> Fix this sparse warning:
>   drivers/net/niu.c:2399:21: warning: symbol 'err' shadows an earlier one
>   drivers/net/niu.c:2287:13: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
