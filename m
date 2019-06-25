From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 25 Jun 2019 04:59:54 +0000
Subject: Re: [PATCH] rtlwifi: remove redundant assignment to variable badworden
Message-Id: <20190625045954.29EE4607CA@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190530184044.8479-1-colin.king@canonical.com>
In-Reply-To: <20190530184044.8479-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable badworden is assigned with a value that is never read and
> it is re-assigned a new value immediately afterwards.  The assignment is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Patch applied to wireless-drivers-next.git, thanks.

5315f9d40191 rtlwifi: remove redundant assignment to variable badworden

-- 
https://patchwork.kernel.org/patch/10969175/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
