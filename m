From: David Miller <davem@davemloft.net>
Date: Tue, 21 Jul 2020 00:50:26 +0000
Subject: Re: [PATCH] r6040: switch from 'pci_' to 'dma_' API
Message-Id: <20200720.175026.817982249324339144.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200720130242.366855-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200720130242.366855-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 20 Jul 2020 15:02:42 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'r6040_open()', GFP_KERNEL can be used because
> this is a net_device_ops' 'ndo_open' function. This function is protected
> by the rtnl_lock() semaphore. So only a mutex is used and no spin_lock is
> acquired.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
