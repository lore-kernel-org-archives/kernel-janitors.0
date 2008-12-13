From: David Miller <davem@davemloft.net>
Date: Sat, 13 Dec 2008 05:19:26 +0000
Subject: Re: [PATCH 8/9][v2] mISDN: timerdev: use __user for mISDN_read's
Message-Id: <20081212.211926.239388789.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49419a3f.0710660a.4800.7087@mx.google.com>
In-Reply-To: <49419a3f.0710660a.4800.7087@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kkeil@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 11 Dec 2008 22:36:00 +0100

> Fix this warning:
> 
>   drivers/isdn/mISDN/timerdev.c:264:11: warning: incorrect type in initializer (incompatible argument 2 (different address spaces))
>   drivers/isdn/mISDN/timerdev.c:264:11:    expected int ( *read )( ... )
>   drivers/isdn/mISDN/timerdev.c:264:11:    got int ( static [toplevel] *<noident> )( ... )
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: Karsten Keil <kkeil@suse.de>

Applied.
