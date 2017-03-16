From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 16 Mar 2017 08:57:51 +0000
Subject: Re: ath10k: remove redundant error check
Message-Id: <f9f879b23b604117bf434e122146882e@euamsexm01a.eu.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170228111439.19546-1-colin.king@canonical.com>
In-Reply-To: <20170228111439.19546-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Colin Ian King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check on ret for an error is redundant because it is already been
> checked for non-zero earlier on and ret is never non-zero at this point.
> Fix this by removing the redundant check and error message.
> 
> Detected by CoverityScan, CID#1357170 ("Logically Dead Code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to ath-next branch of ath.git, thanks.

51f60b8b6979 ath10k: remove redundant error check

-- 
https://patchwork.kernel.org/patch/9595221/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

