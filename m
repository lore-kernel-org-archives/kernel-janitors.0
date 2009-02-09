From: David Miller <davem@davemloft.net>
Date: Mon, 09 Feb 2009 01:00:20 +0000
Subject: Re: [PATCH 2/6] drivers/atm: introduce missing kfree
Message-Id: <20090208.170020.93114261.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0902082243200.25891@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0902082243200.25891@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, chas@cmf.nrl.navy.mil, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 8 Feb 2009 22:44:16 +0100 (CET)

> Error handling code following a kmalloc should free the allocated data.
...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks Julia.
