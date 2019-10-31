From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 31 Oct 2019 08:05:16 +0000
Subject: Re: [PATCH][next] rtw88: remove redundant null pointer check on arrays
Message-Id: <20191031080516.BFC5360907@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191025113056.19167-1-colin.king@canonical.com>
In-Reply-To: <20191025113056.19167-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Yan-Hsuan Chuang <yhchuang@realtek.com>, "David S . Miller" <davem@davemloft.net>, Chris Chiu <chiu@endlessm.com>, Tzu-En Huang <tehuang@realtek.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The checks to see if swing_table->n or swing_table->p are null are
> redundant since n and p are arrays and can never be null if
> swing_table is non-null.  I believe these are redundant checks
> and can be safely removed, especially the checks implies that these
> are not arrays which can lead to confusion.
> 
> Addresses-Coverity: ("Array compared against 0")
> Fixes: c97ee3e0bea2 ("rtw88: add power tracking support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

baff8da6e163 rtw88: remove redundant null pointer check on arrays

-- 
https://patchwork.kernel.org/patch/11212093/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
