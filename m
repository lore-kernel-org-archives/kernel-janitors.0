From: David Miller <davem@davemloft.net>
Date: Tue, 21 Jul 2020 00:48:46 +0000
Subject: Re: [PATCH] net: packetengines: switch from 'pci_' to 'dma_' API
Message-Id: <20200720.174846.100766669077197890.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200720122912.365571-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200720122912.365571-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, mhabets@solarflare.com, hkallweit1@gmail.com, snelson@pensando.io, mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 20 Jul 2020 14:29:12 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'hamachi_init_one()' (hamachi.c), GFP_KERNEL
> can be used because it is a probe function and no lock is acquired.
> 
> When memory is allocated in 'yellowfin_init_one()' (yellowfin.c),
> GFP_KERNEL can be used because it is a probe function and no lock is
> acquired.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.
