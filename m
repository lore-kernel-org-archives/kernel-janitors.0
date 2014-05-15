From: David Miller <davem@davemloft.net>
Date: Thu, 15 May 2014 20:58:04 +0000
Subject: Re: [PATCH 1/4] drivers/net/wan: delete unneeded call to netdev_priv
Message-Id: <20140515.165804.1922893829087325806.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400125401-15512-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1400125401-15512-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 15 May 2014 05:43:18 +0200

> Netdev_priv is an accessor function, and has no purpose if its result is
> not used.
> 
> A simplified version of the semantic match that fixes this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ local idexpression x; @@
> -x = netdev_priv(...);
> ... when != x
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
