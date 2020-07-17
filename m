From: David Miller <davem@davemloft.net>
Date: Fri, 17 Jul 2020 19:58:13 +0000
Subject: Re: [PATCH] net: alteon: Avoid some useless memset
Message-Id: <20200717.125813.340020422201202187.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200716205242.326486-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200716205242.326486-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, jes@trained-monkey.org, linux-acenic@sunsite.dk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 16 Jul 2020 22:52:42 +0200

> Avoid a memset after a call to 'dma_alloc_coherent()'.
> This is useless since
> commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")
> 
> Replace a kmalloc+memset with a corresponding kzalloc.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
