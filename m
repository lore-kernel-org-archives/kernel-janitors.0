From: David Miller <davem@davemloft.net>
Date: Tue, 15 Sep 2015 23:50:15 +0000
Subject: Re: [PATCH 10/39] atm: he: drop null test before destroy functions
Message-Id: <20150915.165015.1781505123781551288.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
	<1442146532-9100-11-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-11-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: 3chas3@gmail.com, sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 14:15:03 +0200

> Remove unneeded NULL test.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ expression x; @@
> -if (x != NULL)
>   \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
