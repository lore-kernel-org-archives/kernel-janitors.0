From: David Miller <davem@davemloft.net>
Date: Thu, 19 Feb 2009 03:36:11 +0000
Subject: Re: [PATCH 23/43 v2] drivers/net/igb: fix sparse warning: symbol
Message-Id: <20090218.193611.177113978.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090217.173903.121180042.davem@davemloft.net>
	<20090218214705.8438.48732.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090218214705.8438.48732.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 18 Feb 2009 22:49:20 +0100

> Impact: Move variable declaration as far inner as possible.
> 
> Fix this sparse warning:
>   drivers/net/igb/igb_main.c:1895:21: warning: symbol 'j' shadows an earlier one
>   drivers/net/igb/igb_main.c:1855:16: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied, thanks.
