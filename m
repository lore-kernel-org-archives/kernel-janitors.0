From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 07 Dec 2020 16:36:30 +0000
Subject: Re: brcmfmac: remove redundant assignment to pointer 'entry'
Message-Id: <20201207163630.A8692C43465@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201204180459.1148257-1-colin.king@canonical.com>
In-Reply-To: <20201204180459.1148257-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-hsien Lin <chi-hsien.lin@infineon.com>, Wright Feng <wright.feng@infineon.com>, Chung-hsien Hsu <chung-hsien.hsu@infineon.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, SHA-cyfmac-dev-list@infineon.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer 'entry' is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

871a825c3902 brcmfmac: remove redundant assignment to pointer 'entry'

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201204180459.1148257-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
