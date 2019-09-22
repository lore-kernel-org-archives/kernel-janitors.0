From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Sun, 22 Sep 2019 21:08:00 +0000
Subject: Re: [PATCH v2 net] net: ena: Select DIMLIB for ENA_ETHERNET
Message-Id: <20190922140800.6b1ed695@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190921200741.1c3289e8@cakuba.netronome.com>
        <20190922053808.117965-1-maowenan@huawei.com>
In-Reply-To: <20190922053808.117965-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: netanel@amazon.com, saeedb@amazon.com, zorik@amazon.com, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 22 Sep 2019 13:38:08 +0800, Mao Wenan wrote:
> If CONFIG_ENA_ETHERNET=y and CONFIG_DIMLIB=n,
> below erros can be found:
> drivers/net/ethernet/amazon/ena/ena_netdev.o: In function `ena_dim_work':
> ena_netdev.c:(.text+0x21cc): undefined reference to `net_dim_get_rx_moderation'
> ena_netdev.c:(.text+0x21cc): relocation truncated to
> fit: R_AARCH64_CALL26 against undefined symbol `net_dim_get_rx_moderation'
> drivers/net/ethernet/amazon/ena/ena_netdev.o: In function `ena_io_poll':
> ena_netdev.c:(.text+0x7bd4): undefined reference to `net_dim'
> ena_netdev.c:(.text+0x7bd4): relocation truncated to fit:
> R_AARCH64_CALL26 against undefined symbol `net_dim'
> 
> After commit 282faf61a053 ("net: ena: switch to dim algorithm for rx adaptive
> interrupt moderation"), it introduces dim algorithm, which configured by CONFIG_DIMLIB.
> So, this patch is to select DIMLIB for ENA_ETHERNET.
> 
> Fixes: 282faf61a053 ("net: ena: switch to dim algorithm for rx adaptive interrupt moderation")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied, thank you!
