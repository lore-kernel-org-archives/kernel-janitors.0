From: David Miller <davem@davemloft.net>
Date: Thu, 10 May 2018 21:47:46 +0000
Subject: Re: [PATCH v2] net/mlx4_en: Fix an error handling path in 'mlx4_en_init_netdev()'
Message-Id: <20180510.174746.56190527987284941.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510070604.19635-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180510070604.19635-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: tariqt@mellanox.com, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 10 May 2018 09:06:04 +0200

> If an error occurs, 'mlx4_en_destroy_netdev()' is called.
> It then calls 'mlx4_en_free_resources()' which does the needed resources
> cleanup.
> 
> So, doing some explicit kfree in the error handling path would lead to
> some double kfree.
> 
> Simplify code to avoid such a case.
> 
> Fixes: 67f8b1dcb9ee ("net/mlx4_en: Refactor the XDP forwarding rings scheme")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied and queued up for -stable, thanks.
