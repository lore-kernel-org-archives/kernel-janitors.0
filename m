From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:38:39 +0000
Subject: Re: [PATCH 22/43] drivers/net/hamradio: fix sparse warnings: fix
Message-Id: <20090217.173839.30296316.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214213543.24377.50515.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214213543.24377.50515.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:36:20 +0100

> Fix this sparse warnings:
>   drivers/net/hamradio/hdlcdrv.c:274:34: warning: incorrect type in argument 2 (different signedness)
>   drivers/net/hamradio/hdlcdrv.c:279:47: warning: incorrect type in argument 2 (different signedness)
>   drivers/net/hamradio/hdlcdrv.c:288:39: warning: incorrect type in argument 2 (different signedness)
>   drivers/net/hamradio/hdlcdrv.c:300:47: warning: incorrect type in argument 2 (different signedness)
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
