From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 05 Nov 2018 10:12:40 +0000
Subject: Re: [PATCH net-next] ath10k: fix copy-paste error in ath10k_qmi_setup_msa_resources()
Message-Id: <20181105101240.C358F607F7@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539657316-35629-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1539657316-35629-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Govind Singh <govinds@codeaurora.org>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> The return value from devm_memremap() is not checked correctly.
> The test is done against a wrong variable. This patch fix it.
> 
> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4ab7fd955e47 ath10k: fix copy-paste error in ath10k_qmi_setup_msa_resources()

-- 
https://patchwork.kernel.org/patch/10642589/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
