From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 24 Oct 2018 08:38:41 +0000
Subject: Re: [PATCH net-next] ath10k: fix copy-paste error in ath10k_qmi_setup_msa_resources()
Message-Id: <871s8fu4by.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539657316-35629-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1539657316-35629-1-git-send-email-weiyongjun1@huawei.com> (Wei
 Yongjun's message of "Tue, 16 Oct 2018 02:35:16 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wei Yongjun <weiyongjun1@huawei.com> writes:

> The return value from devm_memremap() is not checked correctly.
> The test is done against a wrong variable. This patch fix it.
>
> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Please don't mark wireless patches for net-next, by default ath10k
patches go to ath-next branch of my ath.git tree. But no need to resend
because of this.

-- 
Kalle Valo
