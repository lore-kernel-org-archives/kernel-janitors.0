From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 18 Jun 2018 08:55:35 +0000
Subject: Re: qtnfmac: fix NULL pointer dereference
Message-Id: <20180618085535.6A8F160B13@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180601132408.GA2572@embeddedor.com>
In-Reply-To: <20180601132408.GA2572@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Igor Mitsyanko <imitsyanko@quantenna.com>, Avinash Patil <avinashp@quantenna.com>, Sergey Matyukevich <smatyukevich@quantenna.com>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:

> In case *vif* is NULL at 655: if (!vif), the execution path jumps to
> label out, where *vif* is dereferenced at 679:
> 
> if (vif->sta_state = QTNF_STA_CONNECTING)
> 
> Fix this by immediately returning when *vif* is NULL instead of
> jumping to label out.
> 
> Addresses-Coverity-ID: 1469567 ("Dereference after null check")
> Fixes: 480daa9cb62c ("qtnfmac: fix invalid STA state on EAPOL failure")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Reviewed-by: Sergey Matyukevich <sergey.matyukevich.os@quanenna.com>

Patch applied to wireless-drivers.git, thanks.

c1e3f64f8738 qtnfmac: fix NULL pointer dereference

-- 
https://patchwork.kernel.org/patch/10443507/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

