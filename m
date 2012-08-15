From: David Miller <davem@davemloft.net>
Date: Wed, 15 Aug 2012 00:01:09 +0000
Subject: Re: [PATCH 3/5] drivers/net/ethernet/freescale/fs_enet: fix error return code
Message-Id: <20120814.170109.2145761320842984364.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344949115-13266-1-git-send-email-Julia.Lawall@lip6.fr>
 <1344949115-13266-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344949115-13266-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, vbordug@ru.mvista.com, linuxppc-dev@lists.ozlabs.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 14 Aug 2012 14:58:33 +0200

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Convert a 0 error return code to a negative one, as returned elsewhere in the
> function.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.

