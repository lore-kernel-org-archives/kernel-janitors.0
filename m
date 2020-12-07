From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 07 Dec 2020 16:35:02 +0000
Subject: Re: [PATCH][next] rtw88: coex: fix missing unitialization of variable 'interval'
Message-Id: <20201207163502.ABA94C43461@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201203175142.1071738-1-colin.king@canonical.com>
In-Reply-To: <20201203175142.1071738-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Yan-Hsuan Chuang <tony0620emma@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Ping-Ke Shih <pkshih@realtek.com>, Ching-Te Ku <ku920601@realtek.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the variable 'interval' is not initialized and is only set
> to 1 when oex_stat->bt_418_hid_existi is true.  Fix this by inintializing
> variable interval to 0 (which I'm assuming is the intended default).
> 
> Addresses-Coverity: ("Uninitalized scalar variable")
> Fixes: 5b2e9a35e456 ("rtw88: coex: add feature to enhance HID coexistence performance")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Patch applied to wireless-drivers-next.git, thanks.

88c15a6fbd94 rtw88: coex: fix missing unitialization of variable 'interval'

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201203175142.1071738-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
