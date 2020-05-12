From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 12 May 2020 07:34:25 +0000
Subject: Re: [PATCH][next] ath11k: remove redundant initialization of pointer info
Message-Id: <20200512073425.0C16DC433F2@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507164318.56570-1-colin.king@canonical.com>
In-Reply-To: <20200507164318.56570-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> Pointer info is being assigned twice, once at the start of the function
> and secondly when it is just about to be accessed. Remove the redundant
> initialization and keep the original assignment to info that is close
> to the memcpy that uses it.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

52b776fa5921 ath11k: remove redundant initialization of pointer info

-- 
https://patchwork.kernel.org/patch/11534415/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
