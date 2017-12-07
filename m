From: Arend van Spriel <arend.vanspriel@broadcom.com>
Date: Thu, 07 Dec 2017 10:30:15 +0000
Subject: Re: [PATCH] brcmsmac: use ARRAY_SIZE on rfseq_updategainu_events
Message-Id: <5A291837.1020901@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171207102047.21635-1-colin.king@canonical.com>
In-Reply-To: <20171207102047.21635-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/7/2017 11:20 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Use the ARRAY_SIZE macro on rfseq_updategainu_events to determine
> size of the array. Improvement suggested by coccinelle.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

