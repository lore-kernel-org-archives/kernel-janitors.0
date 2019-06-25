From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 25 Jun 2019 05:00:31 +0000
Subject: Re: [PATCH] rtlwifi: remove redundant assignment to variable k
Message-Id: <20190625050031.781D36019D@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190531141412.18632-1-colin.king@canonical.com>
In-Reply-To: <20190531141412.18632-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment of 0 to variable k is never read once we break out of
> the loop, so the assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

f0822dfc5887 rtlwifi: remove redundant assignment to variable k

-- 
https://patchwork.kernel.org/patch/10970261/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
