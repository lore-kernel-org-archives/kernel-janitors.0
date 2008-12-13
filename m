From: David Miller <davem@davemloft.net>
Date: Sat, 13 Dec 2008 05:17:08 +0000
Subject: Re: [PATCH 5/9][v2] mISDN: fix sparse warning: symbol 'nskb'
Message-Id: <20081212.211708.144435933.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49419a31.0aa1660a.486c.07b8@mx.google.com>
In-Reply-To: <49419a31.0aa1660a.486c.07b8@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kkeil@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 11 Dec 2008 22:36:00 +0100

> Impact: define first occurence of variable 'nskb' in inner most possible scope
> 
> Fix this sparse warning:
> 
>   drivers/isdn/mISDN/dsp_core.c:746:20: warning: symbol 'nskb' shadows an earlier one
>   drivers/isdn/mISDN/dsp_core.c:634:19: originally declared here
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: Karsten Keil <kkeil@suse.de>

Applied.
