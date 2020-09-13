From: David Miller <davem@davemloft.net>
Date: Sun, 13 Sep 2020 21:44:27 +0000
Subject: Re: [PATCH] tulip: de2104x: switch from 'pci_' to 'dma_' API
Message-Id: <20200913.144427.302590505192650163.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200913124453.355542-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200913124453.355542-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, mhabets@solarflare.com, arnd@arndb.de, hkallweit1@gmail.com, mdf@kernel.org, mst@redhat.com, vaibhavgupta40@gmail.com, leon@kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 13 Sep 2020 14:44:53 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'de_alloc_rings()' GFP_KERNEL can be used
> because it is only called from 'de_open()' which is a '.ndo_open'
> function. Such functions are synchronized using the rtnl_lock() semaphore
> and no lock is taken in the between.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
