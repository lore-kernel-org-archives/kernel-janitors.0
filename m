From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:38:33 +0000
Subject: Re: [PATCH 21/43] drivers/net/hamradio: fix sparse warning: symbol
Message-Id: <20090217.173833.35304295.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214213505.24377.11448.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214213505.24377.11448.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:35:35 +0100

> Impact: Rename inner scrope variable.
> 
> Fix this sparse warning:
>   drivers/net/hamradio/yam.c:856:35: warning: symbol 'dev' shadows an earlier one
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
