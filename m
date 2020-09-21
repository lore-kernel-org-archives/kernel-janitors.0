From: David Miller <davem@davemloft.net>
Date: Mon, 21 Sep 2020 02:09:36 +0000
Subject: Re: [PATCH 07/14] RDS: drop double zeroing
Message-Id: <20200920.190936.692148593394247602.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
        <1600601186-7420-8-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-8-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@inria.fr
Cc: santosh.shilimkar@oracle.com, kernel-janitors@vger.kernel.org, kuba@kernel.org, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 20 Sep 2020 13:26:19 +0200

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
>   (n,sizeof(*x),flags)
> ...
> sg_init_table(x,n)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied.
