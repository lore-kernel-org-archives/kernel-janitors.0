From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:27:49 +0000
Subject: Re: [PATCH 19/43] drivers/net/hamradio: fix warning: format not a
Message-Id: <20090217.172749.224722175.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214213243.24377.94508.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214213243.24377.94508.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:33:21 +0100

> Impact: Use 'static const char[]' instead of 'static char[]' and while
> being at it fix an issue in 'mkiss_init_driver', where in case of an
> error the status code was not passed to printk.
> 
> Fix this warnings:
>   drivers/net/hamradio/6pack.c: In function 'sixpack_init_driver':
>   drivers/net/hamradio/6pack.c:802: warning: format not a string literal and no format arguments
>   drivers/net/hamradio/bpqether.c: In function 'bpq_init_driver':
>   drivers/net/hamradio/bpqether.c:609: warning: format not a string literal and no format arguments
>   drivers/net/hamradio/mkiss.c: In function 'mkiss_init_driver':
>   drivers/net/hamradio/mkiss.c:988: warning: format not a string literal and no format arguments
>   drivers/net/hamradio/mkiss.c:991: warning: format not a string literal and no format arguments
>   drivers/net/hamradio/scc.c: In function 'scc_init_driver':
>   drivers/net/hamradio/scc.c:2109: warning: format not a string literal and no format arguments
>   drivers/net/hamradio/yam.c: In function 'yam_init_driver':
>   drivers/net/hamradio/yam.c:1094: warning: format not a string literal and no format arguments
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
