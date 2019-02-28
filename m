From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 28 Feb 2019 08:29:33 +0000
Subject: Re: [PATCH][next] rsi: fix missing null pointer check from a failed ieee80211_probereq_get call
Message-Id: <20190228082933.3763B60E5C@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190221123549.7294-1-colin.king@canonical.com>
In-Reply-To: <20190221123549.7294-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>, Siva Rebbagondla <siva8118@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to ieee80211_probereq_get can return NULL if a skb allocation
> fails, so add a null pointer check and free an earlier skb on the error
> exit return path.
> 
> Fixes: 7fdcb8e12660 ("rsi: add support for hardware scan offload")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

74ee436f9581 rsi: fix missing null pointer check from a failed ieee80211_probereq_get call

-- 
https://patchwork.kernel.org/patch/10824023/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
