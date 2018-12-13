From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 13 Dec 2018 15:02:39 +0000
Subject: Re: [PATCH] b43: remove set but not used variables 'tx_pwr_state, tmp2'
Message-Id: <20181213150239.BE5E8607BA@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543994766-7057-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543994766-7057-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Priit Laes <plaes@plaes.org>, Kees Cook <keescook@chromium.org>, Jia-Ju Bai <baijiaju1990@gmail.com>, linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/broadcom/b43/phy_n.c: In function 'b43_nphy_op_recalc_txpower':
> drivers/net/wireless/broadcom/b43/phy_n.c:5898:7: warning:
>  variable 'tx_pwr_state' set but not used [-Wunused-but-set-variable]
> 
> drivers/net/wireless/broadcom/b43/phy_n.c:6047:20: warning:
>  variable 'tmp2' set but not used [-Wunused-but-set-variable]
> 
> 'tx_pwr_state' never used since introduction in commit
> 8615eb2870f1 ("b43: N-PHY: support setting custom TX power")
> 
> 'tmp2' not used any more since commit c002831a07dd ("b43: N-PHY: use helper
> for checking IPA")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied to wireless-drivers-next.git, thanks.

662a7b078cff b43: remove set but not used variables 'tx_pwr_state,tmp2'

-- 
https://patchwork.kernel.org/patch/10713095/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
