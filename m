From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 28 Feb 2019 08:40:31 +0000
Subject: Re: [PATCH] rtlwifi: rtl8723ae: Remove set but not used variable 'bt_retry_cnt'
Message-Id: <20190228084033.62C0260EA5@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190227022334.7750-1-yuehaibing@huawei.com>
In-Reply-To: <20190227022334.7750-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Larry Finger <Larry.Finger@lwfinger.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c: In function '_rtl8723e_dm_bt_coexist_2_ant':
> drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c:1408:5: warning:
>  variable 'bt_retry_cnt' set but not used [-Wunused-but-set-variable]
> 
> It's never used and can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied to wireless-drivers-next.git, thanks.

85c6ac33c87c rtlwifi: rtl8723ae: Remove set but not used variable 'bt_retry_cnt'

-- 
https://patchwork.kernel.org/patch/10831001/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
