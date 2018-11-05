From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 05 Nov 2018 11:13:27 +0000
Subject: Re: [PATCH] ath10k: remove set but not used variable 'tlv_len'
Message-Id: <20181105111327.C9786607CA@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539951626-185764-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539951626-185764-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/ath/ath10k/wmi-tlv.c: In function 'ath10k_wmi_tlv_op_gen_config_pno_start':
> drivers/net/wireless/ath/ath10k/wmi-tlv.c:3455:6: warning:
>  variable 'tlv_len' set but not used [-Wunused-but-set-variable]
> 
> It never used since inroduction in commit
> ce834e280f2f ("ath10k: support NET_DETECT WoWLAN feature")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3468404f78e1 ath10k: remove set but not used variable 'tlv_len'

-- 
https://patchwork.kernel.org/patch/10649069/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
