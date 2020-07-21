From: David Miller <davem@davemloft.net>
Date: Tue, 21 Jul 2020 00:50:39 +0000
Subject: Re: [PATCH] sis: switch from 'pci_' to 'dma_' API
Message-Id: <20200720.175039.1939570240770666966.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200720133609.370347-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200720133609.370347-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, romieu@fr.zoreil.com, venza@brownhat.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 20 Jul 2020 15:36:09 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> 
> When memory is allocated in 'epic_init_one()' (sis190.c), GFP_KERNEL can be
> used because this is a net_device_ops' 'ndo_open' function. This function
> is protected by the rtnl_lock() semaphore. So only a mutex is used and no
> spin_lock is acquired.
> 
> When memory is allocated in 'sis900_probe()' (sis900.c), GFP_KERNEL can be
> used because it is a probe function and no spin_lock is acquired.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
