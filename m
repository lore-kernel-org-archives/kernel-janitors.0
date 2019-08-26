From: David Miller <davem@davemloft.net>
Date: Mon, 26 Aug 2019 02:06:43 +0000
Subject: Re: [PATCH v2 -next] net: mediatek: remove set but not used variable 'status'
Message-Id: <20190825.190643.573913079872386152.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190824.142158.1506174328495468705.davem@davemloft.net>
 <20190826013118.22720-1-maowenan@huawei.com>
In-Reply-To: <20190826013118.22720-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: nbd@openwrt.org, nelson.chang@mediatek.com, netdev@vger.kernel.org, sean.wang@mediatek.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org

From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 26 Aug 2019 09:31:18 +0800

> Fixes gcc '-Wunused-but-set-variable' warning:
> drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function mtk_handle_irq:
> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1951:6: warning: variable status set but not used [-Wunused-but-set-variable]
> 
> Fixes: 296c9120752b ("net: ethernet: mediatek: Add MT7628/88 SoC support")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Are you sure the register isn't being read in order to make some
hardware side effect happen?

Have you tested this on effected hardware?

I'm not applying this without definitive answers to these questions.
