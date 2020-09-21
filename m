From: David Miller <davem@davemloft.net>
Date: Mon, 21 Sep 2020 02:09:29 +0000
Subject: Re: [PATCH 03/14] dpaa2-eth: drop double zeroing
Message-Id: <20200920.190929.1753681394804258381.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
        <1600601186-7420-4-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-4-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@inria.fr
Cc: ioana.ciornei@nxp.com, kernel-janitors@vger.kernel.org, ruxandra.radulescu@nxp.com, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 20 Sep 2020 13:26:15 +0200

> sg_init_table zeroes its first argument, so the allocation of that argument
> doesn't have to.
> 
> the semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,n,flags;
> @@
> 
> x = 
> - kcalloc
> + kmalloc_array
>   (n,sizeof(struct scatterlist),flags)
> ...
> sg_init_table(x,n)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied.
