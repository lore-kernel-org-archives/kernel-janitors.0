From: David Miller <davem@davemloft.net>
Date: Mon, 06 Aug 2012 20:30:25 +0000
Subject: Re: [PATCH 6/6] drivers/atm/iphase.c: fix error return code
Message-Id: <20120806.133025.266545188392092861.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344160356-387-1-git-send-email-Julia.Lawall@lip6.fr>
	<1344160356-387-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344160356-387-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: chas@cmf.nrl.navy.mil, kernel-janitors@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, julia@diku.dk

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun,  5 Aug 2012 11:52:36 +0200

> From: Julia Lawall <julia@diku.dk>
> 
> Convert a 0 error return code to a negative one, as returned elsewhere in the
> function.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
