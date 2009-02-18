From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 03:35:13 +0000
Subject: Re: [PATCH 34/43] drivers/net/usb: fix sparse warnings: Should it
Message-Id: <20090217.193513.253367372.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214214738.24377.82100.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214214738.24377.82100.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:47:47 +0100

> Impact: Make symbols static.
> 
> Fix this sparse warnings:
>   drivers/net/usb/hso.c:1249:6: warning: symbol 'hso_unthrottle_tasklet' was not declared. Should it be static?
>   drivers/net/usb/hso.c:1268:6: warning: symbol 'hso_unthrottle_workfunc' was not declared. Should it be static?
>   drivers/net/usb/hso.c:1466:5: warning: symbol 'tiocmget_submit_urb' was not declared. Should it be static?
>   drivers/net/usb/smsc95xx.c:62:5: warning: symbol 'turbo_mode' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
