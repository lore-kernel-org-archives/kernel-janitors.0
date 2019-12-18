From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 18 Dec 2019 17:52:26 +0000
Subject: Re: [PATCH][next] ath11k: fix memory leak on reg_info
Message-Id: <20191218175226.8352CC433A2@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191212183228.105993-1-colin.king@canonical.com>
In-Reply-To: <20191212183228.105993-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, Ganesh Sesetti <gseset@codeaurora.org>, Karthikeyan Periyasamy <periyasa@codeaurora.org>, John Crispin <john@phrozen.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> Currently a return path is leaking the previously allocate reg_info. Fix
> this by exiting via the return path mem_free.  Since the return value ret
> is defaulted to 0, there is no need to re-assign ret to the 0 before
> the goto.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b5316db229d5 ath11k: fix memory leak on reg_info

-- 
https://patchwork.kernel.org/patch/11289073/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
