From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:21:21 +0000
Subject: Re: [PATCH 01/43] drivers/net/at1700.c: fix sparse warning: symbol
Message-Id: <20090217.172121.199854873.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211144.23489.88144.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211144.23489.88144.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:11:55 +0100

> Impact: Move variable declaration to a more inner scope.
> 
> Fix this sparse warning:
>   drivers/net/at1700.c:846:21: warning: symbol 'i' shadows an earlier one
>   drivers/net/at1700.c:831:13: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
