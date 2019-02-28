From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 28 Feb 2019 08:39:40 +0000
Subject: Re: [PATCH] rtlwifi: rtl8723be: Remove set but not used variable 'b_last_is_cur_rdlstate'
Message-Id: <20190228083941.24EC26133A@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190227022321.7623-1-yuehaibing@huawei.com>
In-Reply-To: <20190227022321.7623-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Larry Finger <Larry.Finger@lwfinger.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/realtek/rtlwifi/rtl8723be/dm.c: In function 'rtl8723be_dm_check_edca_turbo':
> drivers/net/wireless/realtek/rtlwifi/rtl8723be/dm.c:998:7: warning:
>  variable 'b_last_is_cur_rdlstate' set but not used [-Wunused-but-set-variable]
> 
> It's never used and can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied to wireless-drivers-next.git, thanks.

f32150565601 rtlwifi: rtl8723be: Remove set but not used variable 'b_last_is_cur_rdlstate'

-- 
https://patchwork.kernel.org/patch/10830999/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
