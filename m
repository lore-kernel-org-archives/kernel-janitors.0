From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:21:49 +0000
Subject: Re: [PATCH 06/43] drivers/net/lance.c: fix sparse warnings: fix
Message-Id: <20090217.172149.196264055.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211257.23489.76477.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211257.23489.76477.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:13:24 +0100

> Impact: Besides from fixing the signedness issue remove some
> whitespace to obey to the 80 character limit.
> 
> Fix this sparse warnings:
>   drivers/net/lance.c:399:19: warning: incorrect type in assignment (different signedness)
>   drivers/net/lance.c:654:29: warning: incorrect type in argument 2 (different signedness)
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
