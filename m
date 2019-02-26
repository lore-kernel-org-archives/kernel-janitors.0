From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 26 Feb 2019 13:09:27 +0000
Subject: Re: [PATCH] ath9k: remove set but not used variable 'acq'
Message-Id: <20190226130928.447C361156@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190225033246.127410-1-yuehaibing@huawei.com>
In-Reply-To: <20190225033246.127410-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/ath/ath9k/recv.c: In function 'ath_rx_count_airtime':
> drivers/net/wireless/ath/ath9k/recv.c:1010:18: warning:
>  variable 'acq' set but not used [-Wunused-but-set-variable]
> 
> It's not used after 89cea7493a34 ("ath9k: Switch to mac80211 TXQ scheduling
> and airtime APIs"). Also remove related variables.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Toke Høiland-Jørgensen <toke@redhat.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

03af21d6ba35 ath9k: remove set but not used variable 'acq'

-- 
https://patchwork.kernel.org/patch/10828153/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
