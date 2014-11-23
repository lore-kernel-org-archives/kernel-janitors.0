From: David Miller <davem@davemloft.net>
Date: Sun, 23 Nov 2014 19:30:16 +0000
Subject: Re: [PATCH 4/6] solos-pci: fix error return code
Message-Id: <20141123.143016.2013887575160072697.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1416667159-9808-1-git-send-email-Julia.Lawall@lip6.fr>
	<1416667159-9808-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1416667159-9808-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: chas@cmf.nrl.navy.mil, kernel-janitors@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 22 Nov 2014 15:39:17 +0100

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Return a negative error code on failure.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks Julia.
