From: David Miller <davem@davemloft.net>
Date: Fri, 17 Jul 2020 19:57:05 +0000
Subject: Re: [PATCH] net: sungem: switch from 'pci_' to 'dma_' API
Message-Id: <20200717.125705.1415014926641759296.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200716192821.321233-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200716192821.321233-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, hkallweit1@gmail.com, mst@redhat.com, vaibhavgupta40@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 16 Jul 2020 21:28:21 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'gem_init_one()', GFP_KERNEL can be used
> because it is a probe function and no lock is acquired.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
