From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:21:27 +0000
Subject: Re: [PATCH 02/43] drivers/net/e2100.c: fix sparse warning: symbol
Message-Id: <20090217.172127.252722025.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211203.23489.80420.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211203.23489.80420.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:12:10 +0100

> Impact: Remove redundant inner scope variable and while being at it
> make use of ARRAY_SIZE instead of a hardcoded number.
> 
> Fix this sparse warning:
>   drivers/net/e2100.c:219:56: warning: symbol 'i' shadows an earlier one
>   drivers/net/e2100.c:181:13: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
