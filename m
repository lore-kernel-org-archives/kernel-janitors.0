From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 25 Jun 2019 05:02:29 +0000
Subject: Re: [PATCH] rtlwifi: rtl8188ee: remove redundant assignment to rtstatus
Message-Id: <20190625050229.244DE606DC@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190608105800.26571-1-colin.king@canonical.com>
In-Reply-To: <20190608105800.26571-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable rtstatus is being initialized with a value that is never read
> as rtstatus is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

25a986e426b0 rtlwifi: rtl8188ee: remove redundant assignment to rtstatus

-- 
https://patchwork.kernel.org/patch/10983111/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
