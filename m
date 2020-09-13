From: David Miller <davem@davemloft.net>
Date: Sun, 13 Sep 2020 21:15:53 +0000
Subject: Re: [PATCH V2] natsemi: switch from 'pci_' to 'dma_' API
Message-Id: <20200913.141553.1778331693564031642.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200912194625.345319-1-christophe.jaillet@wanadoo.fr>
        <christophe.jaillet@wanadoo.fr>
        <20200913054628.346243-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200913054628.346243-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, mst@redhat.com, vaibhavgupta40@gmail.com, gustavoars@kernel.org, arnd@arndb.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 13 Sep 2020 07:46:28 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'alloc_ring()' (natsemi.c) GFP_KERNEL can be
> used because it is only called from 'netdev_open()', which is a '.ndo_open'
> function. Such function are synchronized with the rtnl_lock() semaphore.
> 
> When memory is allocated in 'ns83820_init_one()' (ns83820.c) GFP_KERNEL can
> be used because it is a probe function and no lock is taken in the between.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>    https://marc.info/?l=kernel-janitors&m8745678307186&w=4
> 
> V2: fix description (duplicated comment and wrong file name)

Applied, thank you.
