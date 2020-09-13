From: David Miller <davem@davemloft.net>
Date: Sun, 13 Sep 2020 21:44:38 +0000
Subject: Re: [PATCH] tulip: switch from 'pci_' to 'dma_' API
Message-Id: <20200913.144438.1074505157386785971.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200913125546.355946-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200913125546.355946-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, yanaijie@huawei.com, snelson@pensando.io, mst@redhat.com, vaibhavgupta40@gmail.com, leon@kernel.org, gustavoars@kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 13 Sep 2020 14:55:46 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'tulip_init_one()' GFP_KERNEL can be used
> because it is a probe function and no lock is taken in the between.
  ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
