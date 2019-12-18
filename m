From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 18 Dec 2019 17:54:11 +0000
Subject: Re: [PATCH] ath11k: fix missing free of skb on error return path
Message-Id: <20191218175411.CA98AC43383@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191212194251.108343-1-colin.king@canonical.com>
In-Reply-To: <20191212194251.108343-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, Ganesh Sesetti <gseset@codeaurora.org>, Karthikeyan Periyasamy <periyasa@codeaurora.org>, John Crispin <john@phrozen.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> The error handling when the call to ath11k_hal_srng_get_entrysize fails
> leaks skb, fix this by returning via the err_free return path that will
> ensure the skb is free'd.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4358bcb54bb9 ath11k: fix missing free of skb on error return path

-- 
https://patchwork.kernel.org/patch/11289341/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
