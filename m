From: David Miller <davem@davemloft.net>
Date: Mon, 14 Dec 2009 03:58:06 +0000
Subject: Re: [PATCH] drivers/net/usb: Correct code taking the size of a
Message-Id: <20091213.195806.179955530.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912131646400.27767@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912131646400.27767@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: petkan@users.sourceforge.net, gregkh@suse.de, linux-usb@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 13 Dec 2009 16:47:04 +0100 (CET)

> From: Julia Lawall <julia@diku.dk>
> 
> sizeof(dev->dev_addr) is the size of a pointer.  A few lines above, the
> size of this field is obtained using netdev->addr_len for a call to memcpy,
> so do the same here.
> 
> A simplified version of the semantic patch that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
