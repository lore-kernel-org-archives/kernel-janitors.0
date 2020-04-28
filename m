From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 28 Apr 2020 09:37:47 +0000
Subject: Re: [PATCH net-next] ath10k: fix possible memory leak in ath10k_bmi_lz_data_large()
Message-Id: <87ftcoeys4.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427104348.13570-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427104348.13570-1-weiyongjun1@huawei.com> (Wei Yongjun's
 message of "Mon, 27 Apr 2020 10:43:48 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Wei Yongjun <weiyongjun1@huawei.com> writes:

> 'cmd' is malloced in ath10k_bmi_lz_data_large() and should be freed
> before leaving from the error handling cases, otherwise it will cause
> memory leak.
>
> Fixes: d58f466a5dee ("ath10k: add large size for BMI download data for SDIO")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/wireless/ath/ath10k/bmi.c | 1 +
>  1 file changed, 1 insertion(+)

Please don't add "net-next" to wireless-driver patches (ath10k, ath11k
etc), because we use different trees. You can add "-next" or
"wireless-driver-next" if you want, but even that is not necessary as I
apply patches to -next by default.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
