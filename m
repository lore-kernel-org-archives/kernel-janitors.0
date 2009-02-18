From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:27:06 +0000
Subject: Re: [PATCH 15/43] drivers/net/bonding: fix sparse warning: symbol
Message-Id: <20090217.172706.62227876.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211541.23489.33717.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211541.23489.33717.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:15:49 +0100

> Impact: Rename function scope variable.
> 
> Fix this sparse warning:
>   drivers/net/bonding/bond_main.c:4704:13: warning: symbol 'mode' shadows an earlier one
>   drivers/net/bonding/bond_main.c:95:13: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
