From: David Miller <davem@davemloft.net>
Date: Tue, 14 Jul 2020 22:13:23 +0000
Subject: Re: [PATCH] ksz884x: switch from 'pci_' to 'dma_' API
Message-Id: <20200714.151323.2054538067730186094.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714183501.310949-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200714183501.310949-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: kernel-janitors@vger.kernel.org, vaibhavgupta40@gmail.com, netdev@vger.kernel.org, mhabets@solarflare.com, jwi@linux.ibm.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org, weiyongjun1@huawei.com, kuba@kernel.org, zhongjiang@huawei.com, linux-media@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 14 Jul 2020 20:35:01 +0200

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'ksz_alloc_desc()', GFP_KERNEL can be used
> because a few lines below, GFP_KERNEL is also used in the
> 'ksz_alloc_soft_desc()' calls.
 ...
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.
