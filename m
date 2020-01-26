From: Kalle Valo <kvalo@codeaurora.org>
Date: Sun, 26 Jan 2020 10:45:45 +0000
Subject: Re: [PATCH] ath11k: ensure ts.flags is initialized before bit-wise or'ing in values
Message-Id: <20200126104545.83226C447A2@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191221004046.15859-1-colin.king@canonical.com>
In-Reply-To: <20191221004046.15859-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Anilkumar Kolli <akolli@codeaurora.org>, Manikanta Pubbisetty <mpubbise@codeaurora.org>, Sven Eckelmann <seckelmann@datto.com>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> Currently the structure ts is not inititalized and ts.flags contains
> garbage values from the stack.  This is being passed into function
> ath11k_dp_tx_status_parse that bit-wise or'ing in settings into the
> ts.flags field.  To avoid flags (and other fields) from containing
> garbage, initialize the structure to zero before use.
> 
> Addresses-Coverity: ("Uninitialized scalar variable)"
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

eefca584140b ath11k: ensure ts.flags is initialized before bit-wise or'ing in values

-- 
https://patchwork.kernel.org/patch/11306545/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
