From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 03 Sep 2019 13:36:25 +0000
Subject: Re: [PATCH] rtw88: remove redundant assignment to pointer debugfs_topdir
Message-Id: <20190903133625.DD0A3605A2@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822113728.25494-1-colin.king@canonical.com>
In-Reply-To: <20190822113728.25494-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Yan-Hsuan Chuang <yhchuang@realtek.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer debugfs_topdir is initialized to a value that is never read
> and it is re-assigned later. The initialization is redundant and can
> be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

9f7d65fb3935 rtw88: remove redundant assignment to pointer debugfs_topdir

-- 
https://patchwork.kernel.org/patch/11109159/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
