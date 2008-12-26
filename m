From: David Miller <davem@davemloft.net>
Date: Fri, 26 Dec 2008 07:58:41 +0000
Subject: Re: [PATCH 06/27] drivers/net/atlx: fix sparse warnings: make
Message-Id: <20081225.235841.230537795.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	<20081222191544.11807.31114.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191544.11807.31114.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 20:15:45 +0100

> Fix this sparse warnings:
> 
>   drivers/net/atlx/atl1.c:198:16: warning: symbol 'atl1_check_options' was not declared. Should it be static?
>   drivers/net/atlx/atl1.c:526:5: warning: symbol 'atl1_read_mac_addr' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
