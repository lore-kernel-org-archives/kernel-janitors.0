From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:27:40 +0000
Subject: Re: [PATCH 18/43] drivers/net/e1000e: fix sparse warning: Should
Message-Id: <20090217.172740.194379532.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214213152.24377.68475.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214213152.24377.68475.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:32:25 +0100

> Impact: Make symbol static.
> 
> Fix this sparse warning:
>   drivers/net/e1000e/82571.c:1229:5: warning: symbol 'e1000_check_for_serdes_link_82571' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
