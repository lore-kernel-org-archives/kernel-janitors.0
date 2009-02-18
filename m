From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 03:35:19 +0000
Subject: Re: [PATCH 35/43] drivers/net/wan: fix warning: format not a
Message-Id: <20090217.193519.162889859.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214214755.24377.57742.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214214755.24377.57742.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:48:07 +0100

> Impact: Use 'static const char[]' instead of 'static char[]'.
> 
> Fix this compilation warnings:
>   drivers/net/wan/lapbether.c: In function 'lapbeth_init_driver':
>   drivers/net/wan/lapbether.c:441: warning: format not a string literal and no format arguments
>   drivers/net/wan/z85230.c: In function 'z85230_init_driver':
>   drivers/net/wan/z85230.c:1782: warning: format not a string literal and no format arguments
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
