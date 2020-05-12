From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 12 May 2020 07:34:53 +0000
Subject: Re: [PATCH next] ath11k: convert to devm_platform_get_and_ioremap_resource
Message-Id: <20200512073453.82903C4478F@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508075323.81128-1-weiyongjun1@huawei.com>
In-Reply-To: <20200508075323.81128-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Use the helper function that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c8ffcd122760 ath11k: convert to devm_platform_get_and_ioremap_resource

-- 
https://patchwork.kernel.org/patch/11535829/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
