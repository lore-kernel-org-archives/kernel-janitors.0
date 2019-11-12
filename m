From: David Miller <davem@davemloft.net>
Date: Tue, 12 Nov 2019 18:51:24 +0000
Subject: Re: [PATCH -next] net: ethernet: ti: Add dependency for TI_DAVINCI_EMAC
Message-Id: <20191112.105124.1905938227505046893.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191112063358.73800-1-maowenan@huawei.com>
In-Reply-To: <20191112063358.73800-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: andrew@lunn.ch, grygorii.strashko@ti.com, tony@atomide.com, brouer@redhat.com, jakub.kicinski@netronome.com, ivan.khoronzhuk@linaro.org, tglx@linutronix.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 12 Nov 2019 14:33:58 +0800

> If TI_DAVINCI_EMAC=y and GENERIC_ALLOCATOR is not set,
> below erros can be seen:
> drivers/net/ethernet/ti/davinci_cpdma.o: In function `cpdma_desc_pool_destroy.isra.14':
> davinci_cpdma.c:(.text+0x359): undefined reference to `gen_pool_size'
> davinci_cpdma.c:(.text+0x365): undefined reference to `gen_pool_avail'
> davinci_cpdma.c:(.text+0x373): undefined reference to `gen_pool_avail'
> davinci_cpdma.c:(.text+0x37f): undefined reference to `gen_pool_size'
> drivers/net/ethernet/ti/davinci_cpdma.o: In function `__cpdma_chan_free':
> davinci_cpdma.c:(.text+0x4a2): undefined reference to `gen_pool_free_owner'
> drivers/net/ethernet/ti/davinci_cpdma.o: In function `cpdma_chan_submit_si':
> davinci_cpdma.c:(.text+0x66c): undefined reference to `gen_pool_alloc_algo_owner'
> davinci_cpdma.c:(.text+0x805): undefined reference to `gen_pool_free_owner'
> drivers/net/ethernet/ti/davinci_cpdma.o: In function `cpdma_ctlr_create':
> davinci_cpdma.c:(.text+0xabd): undefined reference to `devm_gen_pool_create'
> davinci_cpdma.c:(.text+0xb79): undefined reference to `gen_pool_add_owner'
> drivers/net/ethernet/ti/davinci_cpdma.o: In function `cpdma_check_free_tx_desc':
> davinci_cpdma.c:(.text+0x16c6): undefined reference to `gen_pool_avail'
> 
> This patch mades TI_DAVINCI_EMAC select GENERIC_ALLOCATOR.
> 
> Fixes: 99f629718272 ("net: ethernet: ti: cpsw: drop TI_DAVINCI_CPDMA config option")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied.
