From: David Miller <davem@davemloft.net>
Date: Sat, 13 Dec 2008 05:13:05 +0000
Subject: Re: [PATCH 1/9][v2] mISDN: use NULL pointer instead of plain
Message-Id: <20081212.211305.162952487.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49419a20.07a0660a.4c25.ffff8ce9@mx.google.com>
In-Reply-To: <49419a20.07a0660a.4c25.ffff8ce9@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kkeil@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 11 Dec 2008 22:36:00 +0100

> Fix more than 100 (all remaining in mISDN) sparse warnings:
> 
>   drivers/isdn/hardware/mISDN/hfcmulti.c:***:**: warning: Using plain integer as NULL pointer
>   drivers/isdn/mISDN/dsp_tones.c:***:**: warning: Using plain integer as NULL pointer
>   drivers/isdn/mISDN/dsp_pipeline.c:***:**: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: Karsten Keil <kkeil@suse.de>

Applied.
