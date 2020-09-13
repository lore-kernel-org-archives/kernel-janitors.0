From: David Miller <davem@davemloft.net>
Date: Sun, 13 Sep 2020 21:19:31 +0000
Subject: Re: [PATCH] net: dl2k: switch from 'pci_' to 'dma_' API
Message-Id: <20200913.141931.1812276158225291193.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200913061417.347682-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200913061417.347682-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kuba@kernel.org, snelson@pensando.io, jeffrey.t.kirsher@intel.com, mhabets@solarflare.com, yuehaibing@huawei.com, mchehab+huawei@kernel.org, leon@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 13 Sep 2020 08:14:17 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'rio_probe1()' GFP_KERNEL can be used because
> it is a probe function and no lock is taken in the between.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
