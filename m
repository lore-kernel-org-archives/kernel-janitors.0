From: Niklas Cassel <niklas.cassel@linaro.org>
Date: Mon, 04 Jun 2018 12:04:00 +0000
Subject: Re: [PATCH net-next] ath10k: make some functions static
Message-Id: <20180604120400.GA6240@centauri.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527733994-149212-1-git-send-email-weiyongjun1@huawei.com>
 <87a7sazw0w.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87a7sazw0w.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, Wei Yongjun <weiyongjun1@huawei.com>

On Mon, Jun 04, 2018 at 01:27:43PM +0300, Kalle Valo wrote:
> Wei Yongjun <weiyongjun1@huawei.com> writes:
> 
> > Fixes the following sparse warnings:
> >
> > drivers/net/wireless/ath/ath10k/snoc.c:823:5: warning:
> >  symbol 'ath10k_snoc_get_ce_id_from_irq' was not declared. Should it be static?
> > drivers/net/wireless/ath/ath10k/snoc.c:871:6: warning:
> >  symbol 'ath10k_snoc_init_napi' was not declared. Should it be static?
> >
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> BTW this goes to my ath.git tree, not to net-next.
> 
> I had missed these as I can't enable ATH10K_SNOC on x86 and hence I
> don't test compile snoc.c at all. Bjorn&Govind, is there a way to solve
> that? IIRC we had a similar problem with wcn36xx but I don't remember
> anymore how it was fixed.
> 

Perhaps something like:

--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -42,7 +42,8 @@ config ATH10K_USB
 
 config ATH10K_SNOC
         tristate "Qualcomm ath10k SNOC support (EXPERIMENTAL)"
-        depends on ATH10K && ARCH_QCOM
+        depends on ATH10K
+        depends on ARCH_QCOM || COMPILE_TEST
         ---help---
           This module adds support for integrated WCN3990 chip connected
           to system NOC(SNOC). Currently work in progress and will not


Regards,
Niklas


> -- 
> Kalle Valo
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
