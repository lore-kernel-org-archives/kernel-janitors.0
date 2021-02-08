From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 08 Feb 2021 11:16:02 +0000
Subject: Re: [PATCH] libertas: remove redundant initialization of variable ret
Message-Id: <20210208111602.D6703C433ED@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128162202.642848-1-colin.king@canonical.com>
In-Reply-To: <20210128162202.642848-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

1d5248882d64 libertas: remove redundant initialization of variable ret

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210128162202.642848-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
