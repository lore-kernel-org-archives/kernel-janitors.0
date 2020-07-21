From: David Miller <davem@davemloft.net>
Date: Tue, 21 Jul 2020 01:33:08 +0000
Subject: Re: [PATCH] net/fealnx: switch from 'pci_' to 'dma_' API
Message-Id: <20200720.183308.286566153916254508.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200718110338.355408-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200718110338.355408-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, snelson@pensando.io, leon@kernel.org, mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 18 Jul 2020 13:03:38 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated, GFP_KERNEL can be used because it is called from
> the probe function (i.e. 'fealnx_init_one()') and no lock is taken.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.
