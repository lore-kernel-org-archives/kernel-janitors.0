From: Kalle Valo <kvalo@codeaurora.org>
Date: Sun, 02 Aug 2020 14:54:02 +0000
Subject: Re: [PATCH] rtlwifi: btcoex: remove redundant initialization of variables
Message-Id: <20200802145402.1BAD0C433C6@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200723163214.995226-1-colin.king@canonical.com>
In-Reply-To: <20200723163214.995226-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variables ant_num and single_ant_path are being initialized with a
> value that is never read and are being updated later with a new value.
> The initializations are redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Patch applied to wireless-drivers-next.git, thanks.

56b06d4da812 rtlwifi: btcoex: remove redundant initialization of variables ant_num and single_ant_path

-- 
https://patchwork.kernel.org/patch/11681295/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
