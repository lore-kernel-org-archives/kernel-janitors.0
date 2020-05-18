From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 18 May 2020 12:19:32 +0000
Subject: Re: [PATCH] rtlwifi: rtl8192ee: remove redundant for-loop
Message-Id: <20200518121932.CBE53C433D2@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200515102226.29819-1-colin.king@canonical.com>
In-Reply-To: <20200515102226.29819-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The for-loop seems to be redundant, the assignments for indexes
> 0..2 are being over-written by the last index 3 in the loop. Remove
> the loop and use index 3 instead.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

b0a4bb7693be rtlwifi: rtl8192ee: remove redundant for-loop

-- 
https://patchwork.kernel.org/patch/11551059/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
