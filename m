From: David Miller <davem@davemloft.net>
Date: Thu, 15 May 2014 20:58:15 +0000
Subject: Re: [PATCH 3/4] ip_tunnel: delete unneeded call to netdev_priv
Message-Id: <20140515.165815.500119926518586830.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400125401-15512-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1400125401-15512-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 15 May 2014 05:43:20 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
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
