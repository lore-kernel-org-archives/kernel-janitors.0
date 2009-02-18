From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 03:35:07 +0000
Subject: Re: [PATCH 33/43] drivers/net/tulip: fix sparse warning: symbol
Message-Id: <20090217.193507.08660937.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214214707.24377.56661.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214214707.24377.56661.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:47:30 +0100

> Impact: Rename a local variable resp. remove a redundant variable and
> while being at it use more unform loop constructs.
> 
> Fix this sparse warning:
>   drivers/net/tulip/de4x5.c:3944:13: warning: symbol 'i' shadows an earlier one
>   drivers/net/tulip/de4x5.c:3938:9: originally declared here
>   drivers/net/tulip/media.c:72:21: warning: symbol 'i' shadows an earlier one
>   drivers/net/tulip/media.c:54:13: originally declared here
>   drivers/net/tulip/media.c:134:21: warning: symbol 'i' shadows an earlier one
>   drivers/net/tulip/media.c:117:13: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
