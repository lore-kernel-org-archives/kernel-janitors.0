From: David Miller <davem@davemloft.net>
Date: Tue, 25 Aug 2020 00:33:55 +0000
Subject: Re: [PATCH] net: atheros: switch from 'pci_' to 'dma_' API
Message-Id: <20200824.173355.1151795672938918588.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200823080353.169306-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200823080353.169306-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: jcliburn@gmail.com, chris.snook@gmail.com, kuba@kernel.org, yanaijie@huawei.com, hkallweit1@gmail.com, mhabets@solarflare.com, mst@redhat.com, leon@kernel.org, colin.king@canonical.com, yuehaibing@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 23 Aug 2020 10:03:53 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'atl1e_setup_ring_resources()' (atl1e_main.c),
> 'atl1_setup_ring_resources()' (atl1.c) and 'atl2_setup_ring_resources()'
> (atl2.c) GFP_KERNEL can be used because it can be called from a .ndo_open.
> 
> 'atl1_setup_ring_resources()' (atl1.c) can also be called from a
> '.set_ringparam' (see struct ethtool_ops) where sleep is also allowed.
> 
> Both cases are protected by 'rtnl_lock()' which is a mutex. So these
> function can sleep.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
