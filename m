From: David Miller <davem@davemloft.net>
Date: Fri, 17 Jul 2020 19:57:41 +0000
Subject: Re: [PATCH] net: alteon: switch from 'pci_' to 'dma_' API
Message-Id: <20200717.125741.1362531111425041030.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200716204802.326057-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200716204802.326057-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, jes@trained-monkey.org, linux-acenic@sunsite.dk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 16 Jul 2020 22:48:02 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'ace_allocate_descriptors()' and
> 'ace_init()' GFP_KERNEL can be used because both functions are called from
> the probe function and no lock is acquired.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
