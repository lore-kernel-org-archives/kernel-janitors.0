From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:21:39 +0000
Subject: Re: [PATCH 04/43] drivers/net/ns83820.c: fix sparse warnings: fix
Message-Id: <20090217.172139.210351923.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211231.23489.52423.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211231.23489.52423.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:12:36 +0100

> Fix this sparse warnings:
>   drivers/net/ns83820.c:479:36: warning: incorrect type in argument 2 (different signedness)
>   drivers/net/ns83820.c:479:36: warning: incorrect type in argument 2 (different signedness)
>   drivers/net/ns83820.c:479:36: warning: incorrect type in argument 2 (different signedness)
>   drivers/net/ns83820.c:479:36: warning: incorrect type in argument 2 (different signedness)
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
