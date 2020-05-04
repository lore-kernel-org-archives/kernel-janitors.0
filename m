From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 04 May 2020 08:53:00 +0000
Subject: Re: [PATCH net-next] ath10k: fix possible memory leak in ath10k_bmi_lz_data_large()
Message-Id: <20200504085300.03736C433BA@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427104348.13570-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427104348.13570-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Wen Gong <wgong@codeaurora.org>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> 'cmd' is malloced in ath10k_bmi_lz_data_large() and should be freed
> before leaving from the error handling cases, otherwise it will cause
> memory leak.
> 
> Fixes: d58f466a5dee ("ath10k: add large size for BMI download data for SDIO")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

2326aa011967 ath10k: fix possible memory leak in ath10k_bmi_lz_data_large()

-- 
https://patchwork.kernel.org/patch/11511841/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
