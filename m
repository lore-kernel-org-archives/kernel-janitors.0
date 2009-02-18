From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 03:49:46 +0000
Subject: Re: [PATCH 43/43] drivers/net/wireless/prism54: fix sparse
Message-Id: <20090217.194946.175639509.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214215034.24377.54126.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214215034.24377.54126.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:50:45 +0100

> Fix sparse warning:
>   drivers/net/wireless/prism54/isl_ioctl.c:2997:32: warning: incorrect type in argument 2 (different signedness)
>   drivers/net/wireless/prism54/oid_mgt.c:712:42: warning: incorrect type in argument 2 (different signedness)
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
