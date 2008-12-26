From: David Miller <davem@davemloft.net>
Date: Fri, 26 Dec 2008 08:13:11 +0000
Subject: Re: [PATCH 23/27] drivers/net/wireless: fix sparse warnings: make
Message-Id: <20081226.001311.218715858.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	<20081222191823.11807.62915.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191823.11807.62915.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 20:18:23 +0100

> Fix this sparse warnings:
> 
>   drivers/net/wireless/airo.c:3610:6: warning: symbol 'mpi_receive_802_11' was not declared. Should it be static?
>   drivers/net/wireless/atmel.c:3183:6: warning: symbol 'atmel_join_bss' was not declared. Should it be static?
>   drivers/net/wireless/ray_cs.c:831:5: warning: symbol 'ray_dev_init' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
