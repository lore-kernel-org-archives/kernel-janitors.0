From: David Miller <davem@davemloft.net>
Date: Sun, 13 Sep 2020 21:21:22 +0000
Subject: Re: [PATCH] tulip: windbond-840: switch from 'pci_' to 'dma_' API
Message-Id: <20200913.142122.633959947177815577.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200913065711.351802-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200913065711.351802-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, hkallweit1@gmail.com, gustavoars@kernel.org, vaibhavgupta40@gmail.com, mst@redhat.com, leon@kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 13 Sep 2020 08:57:11 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'alloc_ringdesc()' GFP_KERNEL can be used
> because it is only called from 'netdev_open()' which is a '.ndo_open'
> function. Such functions are synchronized using the rtnl_lock() semaphore
> and no lock is taken in the between.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
