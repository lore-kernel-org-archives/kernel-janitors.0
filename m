From: David Miller <davem@davemloft.net>
Date: Sat, 13 Dec 2008 05:20:12 +0000
Subject: Re: [PATCH 9/9][v2] mISDN: hfcmulti: use __iomem address space
Message-Id: <20081212.212012.212498095.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49419a44.09c5660a.39e6.65f7@mx.google.com>
In-Reply-To: <49419a44.09c5660a.39e6.65f7@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kkeil@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 11 Dec 2008 22:36:00 +0100

> Impact: make use of the __iomem address space modifier, and change u_char *,
> u_short * and u_int * to void *
> 
> Fix more than 30 sparse warnings of this or similar type:
> 
>   drivers/isdn/hardware/mISDN/hfcmulti.c:261:31: warning: incorrect type in argument 2 (different address spaces)
>   drivers/isdn/hardware/mISDN/hfcmulti.c:261:31:    got unsigned char [usertype] *
>   drivers/isdn/hardware/mISDN/hfcmulti.c:261:31:    expected void volatile [noderef] <asn:2>*addr
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: Karsten Keil <kkeil@suse.de>

Applied.
