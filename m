From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 03:35:24 +0000
Subject: Re: [PATCH 36/43] drivers/net/wan: fix sparse warning: symbol
Message-Id: <20090217.193524.111535677.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214214815.24377.92862.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214214815.24377.92862.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:48:25 +0100

> Impact: Rename function scope variable and while being at it fix some
> coding style issues.
> 
> Fix this sparse warning:
>   drivers/net/wan/sbni.c:1526:14: warning: symbol 'num' shadows an earlier one
>   drivers/net/wan/sbni.c:160:13: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
