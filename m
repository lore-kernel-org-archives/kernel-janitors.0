From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 09 Dec 2020 07:04:20 +0000
Subject: Re: [PATCH] ath11k: unlock on error path in ath11k_mac_op_add_interface()
Message-Id: <20201209070420.4F4C5C433ED@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X85sVGVP/0XvlrEJ@mwanda>
In-Reply-To: <X85sVGVP/0XvlrEJ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ritesh Singh <ritesi@codeaurora.org>, Maharaja Kennadyrajan <mkenna@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> These error paths need to drop the &ar->conf_mutex before returning.
> 
> Fixes: 690ace20ff79 ("ath11k: peer delete synchronization with firmware")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

59ec8e2fa5aa ath11k: unlock on error path in ath11k_mac_op_add_interface()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/X85sVGVP/0XvlrEJ@mwanda/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
