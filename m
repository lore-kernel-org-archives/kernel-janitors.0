From: David Miller <davem@davemloft.net>
Date: Tue, 14 Jul 2020 21:09:37 +0000
Subject: Re: [PATCH] net: neterion: vxge: switch from 'pci_' to 'dma_' API
Message-Id: <20200714.140937.912145621621201941.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714091412.300211-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200714091412.300211-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: jdmason@kudzu.us, kuba@kernel.org, mhabets@solarflare.com, snelson@pensando.io, mst@redhat.com, vaibhavgupta40@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 14 Jul 2020 11:14:12 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below. No GFP_
> flag needs to be corrected.
> It has been compile tested.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
