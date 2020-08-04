From: David Miller <davem@davemloft.net>
Date: Tue, 04 Aug 2020 23:18:02 +0000
Subject: Re: [PATCH] farsync: switch from 'pci_' to 'dma_' API
Message-Id: <20200804.161802.960912344938071704.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200804201924.717142-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200804201924.717142-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kevin.curtis@farsite.co.uk, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue,  4 Aug 2020 22:19:24 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'fst_add_one()', GFP_KERNEL can be used
> because it is a probe function and no lock is acquired.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
