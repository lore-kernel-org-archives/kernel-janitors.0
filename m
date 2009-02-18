From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 03:35:02 +0000
Subject: Re: [PATCH 32/43] drivers/net/tulip: fix warning: format not a
Message-Id: <20090217.193502.194880051.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214214632.24377.15197.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214214632.24377.15197.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:46:59 +0100

> Impact: Use 'static const char[]' instead of 'static char[]' and while
> being at it add a KERN_INFO prefix.
> 
> Fix this warning:
>   drivers/net/tulip/de4x5.c: In function 'de4x5_hw_init':
>   drivers/net/tulip/de4x5.c:1268: warning: format not a string literal and no format arguments
>   drivers/net/tulip/winbond-840.c: In function 'w840_init':
>   drivers/net/tulip/winbond-840.c:1666: warning: format not a string literal and no format arguments
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
