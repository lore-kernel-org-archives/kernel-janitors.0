From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 29 Sep 2020 08:24:04 +0000
Subject: Re: [PATCH] qtnfmac: fix resource leaks on unsupported iftype error return path
Message-Id: <20200929082404.94490C433CA@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200925132224.21638-1-colin.king@canonical.com>
In-Reply-To: <20200925132224.21638-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Igor Mitsyanko <imitsyanko@quantenna.com>, Sergey Matyukevich <geomatsi@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Avinash Patil <avinashp@quantenna.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if an unsupported iftype is detected the error return path
> does not free the cmd_skb leading to a resource leak. Fix this by
> free'ing cmd_skb.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 805b28c05c8e ("qtnfmac: prepare for AP_VLAN interface type support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

63f6982075d8 qtnfmac: fix resource leaks on unsupported iftype error return path

-- 
https://patchwork.kernel.org/patch/11799775/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
