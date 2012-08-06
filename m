From: David Miller <davem@davemloft.net>
Date: Mon, 06 Aug 2012 20:28:35 +0000
Subject: Re: [PATCH 6/6] drivers/net/phy/mdio-mux-gpio.c: drop devm_kfree of devm_kzalloc'd data
Message-Id: <20120806.132835.1454407216893349784.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344099049-15212-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344099049-15212-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat,  4 Aug 2012 18:50:49 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> devm_kfree should not have to be explicitly used.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,d;
> @@
> 
> x = devm_kzalloc(...)
> ...
> ?-devm_kfree(d,x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
