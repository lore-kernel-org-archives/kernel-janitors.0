From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 08 Nov 2017 12:54:30 +0000
Subject: Re: zd1201: remove unused variable framelen
Message-Id: <20171108125430.B983F60261@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171107185630.7791-1-colin.king@canonical.com>
In-Reply-To: <20171107185630.7791-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin Ian King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable framelen is assigned but never read, hence it is redundant
> and can be removed. Cleans up clang warning:
> 
> drivers/net/wireless/zydas/zd1201.c:234:3: warning: Value stored
> to 'framelen' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

03e40f1e7680 zd1201: remove unused variable framelen

-- 
https://patchwork.kernel.org/patch/10047145/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

