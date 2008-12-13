From: David Miller <davem@davemloft.net>
Date: Sat, 13 Dec 2008 05:18:41 +0000
Subject: Re: [PATCH 7/9][v2] mISDN: comment out unused symbols
Message-Id: <20081212.211841.94747482.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49419a3b.0aec660a.2b49.7900@mx.google.com>
In-Reply-To: <49419a3b.0aec660a.2b49.7900@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kkeil@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 11 Dec 2008 22:36:00 +0100

> Fix this sparse warnings:
> 
>   drivers/isdn/hardware/mISDN/hfcmulti.c:794: warning: 'vpm_check' defined but not used
>   drivers/isdn/mISDN/dsp_cmx.c:1546: warning: 'dsp_start_jiffies' defined but not used
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: Karsten Keil <kkeil@suse.de>

Applied.
