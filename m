From: David Miller <davem@davemloft.net>
Date: Sat, 15 Oct 2016 21:50:36 +0000
Subject: Re: [PATCH] ipvlan: constify l3mdev_ops structure
Message-Id: <20161015.175036.584156456725838147.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1476546030-14324-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1476546030-14324-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 15 Oct 2016 17:40:30 +0200

> This l3mdev_ops structure is only stored in the l3mdev_ops field of a
> net_device structure.  This field is declared const, so the l3mdev_ops
> structure can be declared as const also.  Additionally drop the
> __read_mostly annotation.
> 
> The semantic patch that adds const is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.
