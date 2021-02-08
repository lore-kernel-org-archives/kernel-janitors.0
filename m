From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 08 Feb 2021 10:39:32 +0000
Subject: Re: [PATCH] rtlwifi: rtl8192se: remove redundant initialization of variable rtstatus
Message-Id: <20210208103932.CF51AC43464@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128171048.644669-1-colin.king@canonical.com>
In-Reply-To: <20210128171048.644669-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rtstatu is being initialized with a value that is never
> read and it is being updated later with a new value.  The initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Willem de Bruijn <willemb@google.com>

Patch applied to wireless-drivers-next.git, thanks.

711fa16f1dfe rtlwifi: rtl8192se: remove redundant initialization of variable rtstatus

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210128171048.644669-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
