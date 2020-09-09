From: David Miller <davem@davemloft.net>
Date: Wed, 09 Sep 2020 03:17:29 +0000
Subject: Re: [PATCH] net: tc35815: switch from 'pci_' to 'dma_' API
Message-Id: <20200908.201729.542237023404934204.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200908202747.330007-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200908202747.330007-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: hkallweit1@gmail.com, kuba@kernel.org, mhabets@solarflare.com, tony.felice@timesys.com, mst@redhat.com, gustavo@embeddedor.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue,  8 Sep 2020 22:27:47 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'tc35815_init_queues()' GFP_ATOMIC must be used
> because it can be called from 'tc35815_restart()' where some spinlock are
> taken.
> The call chain is:
>   tc35815_restart
>     --> tc35815_clear_queues
>       --> tc35815_init_queues
> 
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
