From: David Miller <davem@davemloft.net>
Date: Fri, 26 Dec 2008 07:57:27 +0000
Subject: Re: [PATCH 05/27] drivers/net/arcnet: fix sparse warnings: make
Message-Id: <20081225.235727.84639023.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	<20081222191535.11807.72965.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191535.11807.72965.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 20:15:36 +0100

> Fix this sparse warnings:
> 
>   drivers/net/arcnet/capmode.c:64:6: warning: symbol 'arcnet_cap_init' was not declared. Should it be static?
>   drivers/net/arcnet/com90xx.c:586:5: warning: symbol 'com90xx_reset' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
