From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 17 Aug 2020 10:22:21 +0000
Subject: Re: [PATCH] ath6kl: prevent potential array overflow in ath6kl_add_new_sta()
Message-Id: <20200817102221.66AFAC433C6@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200813141315.GB457408@mwanda>
In-Reply-To: <20200813141315.GB457408@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Jouni Malinen <jouni@qca.qualcomm.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The value for "aid" comes from skb->data so Smatch marks it as
> untrusted.  If it's invalid then it can result in an out of bounds array
> access in ath6kl_add_new_sta().
> 
> Fixes: 572e27c00c9d ("ath6kl: Fix AP mode connect event parsing and TIM updates")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

54f9ab7b8709 ath6kl: prevent potential array overflow in ath6kl_add_new_sta()

-- 
https://patchwork.kernel.org/patch/11712551/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
