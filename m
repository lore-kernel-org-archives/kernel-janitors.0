From: David Miller <davem@davemloft.net>
Date: Sat, 24 Aug 2019 21:21:58 +0000
Subject: Re: [PATCH -next] net: mediatek: remove set but not used variable 'status'
Message-Id: <20190824.142158.1506174328495468705.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822063026.70044-1-maowenan@huawei.com>
In-Reply-To: <20190822063026.70044-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: nbd@openwrt.org, john@phrozen.org, sean.wang@mediatek.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Thu, 22 Aug 2019 14:30:26 +0800

> Fixes gcc '-Wunused-but-set-variable' warning:
> drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function mtk_handle_irq:
> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1951:6: warning: variable status set but not used [-Wunused-but-set-variable]
> 
> It is not used since commit 296c9120752b ("net: ethernet: mediatek: Add MT7628/88 SoC support")

This is not a standard commit tag, please use Fixes: or similar.
