From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 18 Dec 2019 17:53:14 +0000
Subject: Re: [PATCH][next] ath11k: fix uninitialized variable radioup
Message-Id: <20191218175314.21F8AC433CB@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191212191044.107544-1-colin.king@canonical.com>
In-Reply-To: <20191212191044.107544-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, Ganesh Sesetti <gseset@codeaurora.org>, Karthikeyan Periyasamy <periyasa@codeaurora.org>, John Crispin <john@phrozen.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> The variable radioup is not uninitalized so it may contain a garbage
> value and hence the detection of a radio that is not up is buggy.
> Fix this by initializing it to zero.
> 
> Addresses-Coverity: ("Uninitalized scalar variable")
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

08cc0f44f5ed ath11k: fix uninitialized variable radioup

-- 
https://patchwork.kernel.org/patch/11289309/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
