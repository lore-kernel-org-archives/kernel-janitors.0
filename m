From: David Miller <davem@davemloft.net>
Date: Tue, 25 Aug 2020 00:33:44 +0000
Subject: Re: [PATCH] starfire: switch from 'pci_' to 'dma_' API
Message-Id: <20200824.173344.243536176380574391.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200823062641.163283-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200823062641.163283-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: ionut@badula.org, kuba@kernel.org, snelson@pensando.io, leon@kernel.org, hkallweit1@gmail.com, vaibhavgupta40@gmail.com, mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 23 Aug 2020 08:26:41 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'netdev_open()', GFP_ATOMIC must be used
> because it can be called from a .ndo_tx_timeout function.
> So this function can be called with the 'netif_tx_lock' acquired.
> The call chain is:
>   --> tx_timeout                 (.ndo_tx_timeout function)
>     --> netdev_open
> 
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
