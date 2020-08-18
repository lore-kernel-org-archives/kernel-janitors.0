From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 18 Aug 2020 12:52:28 +0000
Subject: Re: [PATCH] mwifiex: Do not use GFP_KERNEL in atomic context
Message-Id: <20200818125228.4CFD3C433AF@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200809092906.744621-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200809092906.744621-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: amitkarwar@gmail.com, ganapathi.bhat@nxp.com, huxinming820@gmail.com, davem@davemloft.net, kuba@kernel.org, yogeshp@marvell.com, bzhao@marvell.com, linville@tuxdriver.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> A possible call chain is as follow:
>   mwifiex_sdio_interrupt                            (sdio.c)
>     --> mwifiex_main_process                        (main.c)
>       --> mwifiex_process_cmdresp                   (cmdevt.c)
>         --> mwifiex_process_sta_cmdresp             (sta_cmdresp.c)
>           --> mwifiex_ret_802_11_scan               (scan.c)
>             --> mwifiex_parse_single_response_buf   (scan.c)
> 
> 'mwifiex_sdio_interrupt()' is an interrupt function.
> 
> Also note that 'mwifiex_ret_802_11_scan()' already uses GFP_ATOMIC.
> 
> So use GFP_ATOMIC instead of GFP_KERNEL when memory is allocated in
> 'mwifiex_parse_single_response_buf()'.
> 
> Fixes: 7c6fa2a843c5 ("mwifiex: use cfg80211 dynamic scan table and cfg80211_get_bss API")
> or
> Fixes: 601216e12c65e ("mwifiex: process RX packets in SDIO IRQ thread directly")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied to wireless-drivers-next.git, thanks.

d2ab7f00f432 mwifiex: Do not use GFP_KERNEL in atomic context

-- 
https://patchwork.kernel.org/patch/11706587/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
