From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 13 Dec 2018 15:04:35 +0000
Subject: Re: [PATCH] rtlwifi: rtl8821ae: remove set but not used variable 'type' in translate_rx_signal_stuff
Message-Id: <20181213150435.48CC2608CB@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1544097968-68563-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1544097968-68563-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Tzu-En Huang <tehuang@realtek.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/realtek/rtlwifi/rtl8821ae/trx.c: In function 'translate_rx_signal_stuff':
> drivers/net/wireless/realtek/rtlwifi/rtl8821ae/trx.c:309:6: warning:
>  variable 'type' set but not used [-Wunused-but-set-variable]
> 
> It never used since commit 21e4b0726dc6 ("rtlwifi: rtl8821ae: Move driver from
> staging to regular tree")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied to wireless-drivers-next.git, thanks.

e3e454b7047a rtlwifi: rtl8821ae: remove set but not used variable 'type' in translate_rx_signal_stuff

-- 
https://patchwork.kernel.org/patch/10715629/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
