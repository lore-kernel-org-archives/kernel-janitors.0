From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 28 Feb 2019 08:40:57 +0000
Subject: Re: [PATCH] rtlwifi: rtl8192se: Remove set but not used variable 'seg_ptr'
Message-Id: <20190228084058.0B1AF60CF0@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190227022347.7927-1-yuehaibing@huawei.com>
In-Reply-To: <20190227022347.7927-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Larry Finger <Larry.Finger@lwfinger.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c: In function '_rtl92s_firmware_downloadcode':
> drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c:139:17: warning:
>  variable 'seg_ptr' set but not used [-Wunused-but-set-variable]
> 
> It's not used after commit 59ae1d127ac0 ("networking: introduce and use
> skb_put_data()")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied to wireless-drivers-next.git, thanks.

037e0c5df649 rtlwifi: rtl8192se: Remove set but not used variable 'seg_ptr'

-- 
https://patchwork.kernel.org/patch/10831003/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
