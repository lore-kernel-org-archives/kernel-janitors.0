From: Kalle Valo <kvalo@codeaurora.org>
Date: Sun, 26 Jan 2020 15:45:32 +0000
Subject: Re: [PATCH] rtlwifi: rtl8188ee: remove redundant assignment to variable cond
Message-Id: <20200126154532.C28D2C447A2@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200114165601.374597-1-colin.king@canonical.com>
In-Reply-To: <20200114165601.374597-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable cond is being assigned with a value that is never
> read, it is assigned a new value later on. The assignment is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Patch applied to wireless-drivers-next.git, thanks.

c3a913357c3e rtlwifi: rtl8188ee: remove redundant assignment to variable cond

-- 
https://patchwork.kernel.org/patch/11332689/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
