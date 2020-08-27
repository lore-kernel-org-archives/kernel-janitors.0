From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 27 Aug 2020 10:19:59 +0000
Subject: Re: [PATCH net-next] ath11k: return -ENOMEM on allocation failure
Message-Id: <20200827101959.C95A3C433C6@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200826113417.GE393664@mwanda>
In-Reply-To: <20200826113417.GE393664@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Govind Singh <govinds@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Returning PTR_ERR(NULL) means success, but we should return -ENOMEM.
> 
> Fixes: 1399fb87ea3e ("ath11k: register MHI controller device for QCA6390")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

fd0a09097233 ath11k: return -ENOMEM on allocation failure

-- 
https://patchwork.kernel.org/patch/11738005/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
