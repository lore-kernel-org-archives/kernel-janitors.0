From: David Miller <davem@davemloft.net>
Date: Fri, 26 Dec 2008 08:11:27 +0000
Subject: Re: [PATCH 21/27] drivers/net/wan: fix sparse warning: make symbol
Message-Id: <20081226.001127.216496763.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	<20081222191804.11807.55143.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191804.11807.55143.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 20:18:04 +0100

> Fix this sparse warning:
> 
>   drivers/net/wan/x25_asy.c:623:5: warning: symbol 'x25_asy_esc' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
