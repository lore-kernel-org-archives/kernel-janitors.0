From: David Miller <davem@davemloft.net>
Date: Tue, 18 May 2010 05:55:44 +0000
Subject: Re: [PATCH 14/20] drivers/net/vmxnet3: Use kzalloc
Message-Id: <20100517.225544.85428189.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005132204040.6282@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005132204040.6282@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: sbhatewara@vmware.com, pv-drivers@vmware.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Thu, 13 May 2010 22:05:40 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> Use kzalloc rather than the combination of kmalloc and memset.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,size,flags;
> statement S;
> @@
> 
> -x = kmalloc(size,flags);
> +x = kzalloc(size,flags);
>  if (x = NULL) S
> -memset(x, 0, size);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
