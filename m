From: Govind Singh <govinds@codeaurora.org>
Date: Mon, 04 Jun 2018 13:53:54 +0000
Subject: Re: [PATCH net-next] ath10k: make some functions static
Message-Id: <c985c3eb7e845de729a34e094c1e3d35@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527733994-149212-1-git-send-email-weiyongjun1@huawei.com>
 <87a7sazw0w.fsf@kamboji.qca.qualcomm.com>
 <20180604120400.GA6240@centauri.lan>
In-Reply-To: <20180604120400.GA6240@centauri.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, Wei Yongjun <weiyongjun1@huawei.com>, Kalle Valo <kvalo@codeaurora.org>

On 2018-06-04 17:34, Niklas Cassel wrote:
> On Mon, Jun 04, 2018 at 01:27:43PM +0300, Kalle Valo wrote:
>> Wei Yongjun <weiyongjun1@huawei.com> writes:
>> 
>> > Fixes the following sparse warnings:
>> >
>> > drivers/net/wireless/ath/ath10k/snoc.c:823:5: warning:
>> >  symbol 'ath10k_snoc_get_ce_id_from_irq' was not declared. Should it be static?
>> > drivers/net/wireless/ath/ath10k/snoc.c:871:6: warning:
>> >  symbol 'ath10k_snoc_init_napi' was not declared. Should it be static?
>> >
>> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> 
>> BTW this goes to my ath.git tree, not to net-next.
>> 
>> I had missed these as I can't enable ATH10K_SNOC on x86 and hence I
>> don't test compile snoc.c at all. Bjorn&Govind, is there a way to 
>> solve
>> that? IIRC we had a similar problem with wcn36xx but I don't remember
>> anymore how it was fixed.
>> 

I tested compilation in x86 by removing ARCH_QCOM dependency last time.

> 
> Perhaps something like:
> 
> --- a/drivers/net/wireless/ath/ath10k/Kconfig
> +++ b/drivers/net/wireless/ath/ath10k/Kconfig
> @@ -42,7 +42,8 @@ config ATH10K_USB
> 
>  config ATH10K_SNOC
>          tristate "Qualcomm ath10k SNOC support (EXPERIMENTAL)"
> -        depends on ATH10K && ARCH_QCOM
> +        depends on ATH10K
> +        depends on ARCH_QCOM || COMPILE_TEST
>          ---help---
>            This module adds support for integrated WCN3990 chip 
> connected
>            to system NOC(SNOC). Currently work in progress and will not
> 
> 
> Regards,
> Niklas
> 

Yes, This looks more appropriate and works well.


BR,
Govind


