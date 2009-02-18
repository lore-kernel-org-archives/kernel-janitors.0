From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:22:25 +0000
Subject: Re: [PATCH 10/43] drivers/net/s2io.c: fix sparse warning: symbol
Message-Id: <20090217.172225.175747063.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211423.23489.10245.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211423.23489.10245.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:14:31 +0100

> Impact: Remove redundant inner scope variable.
> 
> Fix this sparse warning:
>   drivers/net/s2io.c:7223:21: warning: symbol 'i' shadows an earlier one
>   drivers/net/s2io.c:7184:13: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
