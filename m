From: David Miller <davem@davemloft.net>
Date: Sun, 13 Sep 2020 01:27:13 +0000
Subject: Re: [PATCH] rocker: switch from 'pci_' to 'dma_' API
Message-Id: <20200912.182713.1372047210957486381.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200912114418.340728-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200912114418.340728-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, jiri@resnulli.us, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 12 Sep 2020 13:44:18 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'rocker_dma_ring_create()' GFP_KERNEL can be
> used because it is already used in the same function just a few lines
> above.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
