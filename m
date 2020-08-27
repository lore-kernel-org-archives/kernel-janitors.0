From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 27 Aug 2020 11:32:53 +0000
Subject: Re: [PATCH][next] ath11k: fix error check on return from call to ath11k_core_firmware_request
Message-Id: <20200827113253.9794EC433A0@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200819105712.51886-1-colin.king@canonical.com>
In-Reply-To: <20200819105712.51886-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to ath11k_core_firmware_request is returning a pointer that
> can be set to an error code, however, this is not being checked.
> Instead ret is being incorrecly checked for the error return. Fix the
> error checking.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: 7b57b2ddec21 ("ath11k: create a common function to request all firmware files")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

A similar patch has been already applied.

error: patch failed: drivers/net/wireless/ath/ath11k/qmi.c:1886
error: drivers/net/wireless/ath/ath11k/qmi.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Rejected.

-- 
https://patchwork.kernel.org/patch/11723519/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
