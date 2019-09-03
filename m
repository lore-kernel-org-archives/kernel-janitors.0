From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 03 Sep 2019 13:38:42 +0000
Subject: Re: [PATCH] brcmfmac: remove redundant assignment to pointer hash
Message-Id: <20190903133842.8B9BD6025A@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190809172217.1809-1-colin.king@canonical.com>
In-Reply-To: <20190809172217.1809-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer hash is being initialized with a value that is never read
> and is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

73c742bb9c9b brcmfmac: remove redundant assignment to pointer hash

-- 
https://patchwork.kernel.org/patch/11087385/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
