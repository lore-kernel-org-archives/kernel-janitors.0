From: David Miller <davem@davemloft.net>
Date: Tue, 06 Jul 2010 03:08:16 +0000
Subject: Re: [PATCH] net/ne: fix memory leak in ne_drv_probe()
Message-Id: <20100705.200816.57450933.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278170444-8170-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278170444-8170-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, joe@perches.com, anemo@mba.ocn.ne.jp, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat,  3 Jul 2010 19:20:42 +0400

> net_device allocated with alloc_eip_netdev() must be freed.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied, thanks.
