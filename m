From: David Miller <davem@davemloft.net>
Date: Sat, 13 Dec 2008 05:16:21 +0000
Subject: Re: [PATCH 4/9][v2] mISDN: un-export symbol 'plx_lock'
Message-Id: <20081212.211621.232812118.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49419a2d.06a1660a.5c0a.ffff908c@mx.google.com>
In-Reply-To: <49419a2d.06a1660a.5c0a.ffff908c@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kkeil@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 11 Dec 2008 22:36:00 +0100

> 'plx_lock' is only used within hfcmulti.c.
> 
> Fix this warning:
> 
>   drivers/isdn/hardware/mISDN/hfcmulti.c:176:1: warning: symbol 'plx_lock' shadows an earlier one
>   drivers/isdn/hardware/mISDN/hfcmulti.c:175:19: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: Karsten Keil <kkeil@suse.de>

Applied.
