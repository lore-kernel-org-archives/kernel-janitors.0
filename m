From: David Miller <davem@davemloft.net>
Date: Sun, 13 Sep 2020 01:27:00 +0000
Subject: Re: [PATCH] sc92031: switch from 'pci_' to 'dma_' API
Message-Id: <20200912.182700.120125082750514250.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200912112858.339548-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200912112858.339548-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, hkallweit1@gmail.com, mst@redhat.com, mhabets@solarflare.com, vaibhavgupta40@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 12 Sep 2020 13:28:58 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'sc92031_open()' GFP_KERNEL can be used
> because it is a '.ndo_open' function and no lock is taken in the between.
> '.ndo_open' functions are synchronized with the rtnl_lock() semaphore.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
