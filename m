From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 20 Mar 2017 15:25:19 +0000
Subject: Re: ath10k: remove redundant check of len with buf_len
Message-Id: <a669166e00c5481e880f6cfbb28fea7f@euamsexm01a.eu.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170315163641.17052-1-colin.king@canonical.com>
In-Reply-To: <20170315163641.17052-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Colin Ian King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check of len > buf_len is redundant as len is initialized
> to 0 and buf_len to 4096, so this comparison is always false.
> Remove it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to ath-next branch of ath.git, thanks.

eed4721fb617 ath10k: remove redundant check of len with buf_len

-- 
https://patchwork.kernel.org/patch/9626131/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

