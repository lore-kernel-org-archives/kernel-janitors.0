From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 27 Dec 2017 10:03:31 +0000
Subject: Re: [next] ath10k: wmi: remove redundant integer fc
Message-Id: <9a6c9d36025e46fd9b22e985d3662d93@euamsexm01a.eu.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171218150245.9073-1-colin.king@canonical.com>
In-Reply-To: <20171218150245.9073-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Colin Ian King <colin.king@canonical.com> wrote:

> Variable fc is being assigned but never used, so remove it. Cleans
> up the clang warning:
> 
> warning: Value stored to 'fc' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

a0709dfd7ff8 ath10k: wmi: remove redundant integer fc

-- 
https://patchwork.kernel.org/patch/10119831/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

