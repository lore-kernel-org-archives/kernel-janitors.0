From: David Miller <davem@davemloft.net>
Date: Thu, 01 Jan 2015 00:20:00 +0000
Subject: Re: [PATCH 5/8] net: sun4i-emac: fix error return code
Message-Id: <20141231.192000.244752729516752388.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1419872683-32709-1-git-send-email-Julia.Lawall@lip6.fr>
 <1419872683-32709-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1419872683-32709-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 29 Dec 2014 18:04:40 +0100

> Return a negative error code on failure.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
