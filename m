From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 28 Apr 2020 09:28:01 +0000
Subject: Re: [PATCH net-next] ath11k: remove redundant dev_err call in ath11k_ahb_probe()
Message-Id: <20200428092801.224E1C433F2@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427104403.14598-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427104403.14598-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

I don't see harm having two error messages and having an error message
within ath11k makes it easier to find the exact location, so I'm
dropping this.

-- 
https://patchwork.kernel.org/patch/11511845/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
