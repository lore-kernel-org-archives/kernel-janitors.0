From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 May 2018 14:18:36 +0000
Subject: Re: [PATCH] net/mlx4_en: Fix an error handling path in 'mlx4_en_init_netdev()'
Message-Id: <20180510141836.2qlm676j4675buti@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510070226.19575-1-christophe.jaillet@wanadoo.fr>
 <20180510133808.GA10943@lap1>
In-Reply-To: <20180510133808.GA10943@lap1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuval Shaia <yuval.shaia@oracle.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, davem@davemloft.net, tariqt@mellanox.com, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 10, 2018 at 04:38:08PM +0300, Yuval Shaia wrote:
> On Thu, May 10, 2018 at 09:02:26AM +0200, Christophe JAILLET wrote:
> > If an error occurs, 'mlx4_en_destroy_netdev()' is called.
> > It then calls 'mlx4_en_free_resources()' which does the needed resources
> > cleanup.
> > 
> > So, doing some explicit kfree in the error handling path would lead to
> > some double kfree.
> 
> Patch make sense but what's bothering me is that mlx4_en_free_resources
> loops on the entire array, assuming !priv->tx_ring[t] means entry is
> allocated but the existing code does not assume that, see [1]. So i looked
> to see where tx_ring array is zeroed and didn't find it.
> 
> Am i missing something here.
> 

It's zeroed twice.  alloc_etherdev_mqs() allocates zeroed memory and
then we do a memset(priv, 0, sizeof(struct mlx4_en_priv));

regards,
dan carpenter

