From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:40:22 +0000
Subject: Re: [PATCH 29/43] drivers/net/tokenring: fix warning: format not a
Message-Id: <20090217.174022.33045548.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214214327.24377.33907.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214214327.24377.33907.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:44:19 +0100

> Impact: Use 'static const char[]' instead of 'static char[]'.
> 
> Fix this warnings:
>   drivers/net/tokenring/smctr.c:3644: warning: format not a string literal and no format arguments
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
