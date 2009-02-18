From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:38:18 +0000
Subject: Re: [PATCH 20/43] drivers/net/hamradio: fix sparse warning:
Message-Id: <20090217.173818.220194179.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214213329.24377.28382.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214213329.24377.28382.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:34:52 +0100

> Impact: Attribute functions with __acquires(...) resp. __releases(...).
> 
> Fix this sparse warnings:
>   drivers/net/hamradio/bpqether.c:387:13: warning: context imbalance in 'bpq_seq_start' - wrong count at exit
>   drivers/net/hamradio/bpqether.c:419:13: warning: context imbalance in 'bpq_seq_stop' - unexpected unlock
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
