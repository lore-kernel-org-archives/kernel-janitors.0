From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 03:35:41 +0000
Subject: Re: [PATCH 39/43] drivers/net/wireless: fix sparse warnings: fix
Message-Id: <20090217.193541.33346733.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214214917.24377.97223.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214214917.24377.97223.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:49:26 +0100

> Fix this sparse warnings:
>   drivers/net/wireless/airo.c:2102:21: warning: incorrect type in initializer (different signedness)
>   drivers/net/wireless/airo.c:2126:21: warning: incorrect type in initializer (different signedness)
>   drivers/net/wireless/airo.c:2167:21: warning: incorrect type in initializer (different signedness)
>   drivers/net/wireless/airo.c:2191:21: warning: incorrect type in initializer (different signedness)
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.


