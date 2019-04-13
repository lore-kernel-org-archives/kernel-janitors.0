From: Kalle Valo <kvalo@codeaurora.org>
Date: Sat, 13 Apr 2019 11:08:03 +0000
Subject: Re: [PATCH][V2] brcmfmac: fix leak of mypkt on error return path
Message-Id: <20190413110803.CC98C60779@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190409114333.24342-1-colin.king@canonical.com>
In-Reply-To: <20190409114333.24342-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if the call to brcmf_sdiod_set_backplane_window fails then
> error return path leaks mypkt. Fix this by returning by a new
> error path labelled 'out' that calls brcmu_pkt_buf_free_skb to free
> mypkt.  Also remove redundant check on err before calling
> brcmf_sdiod_skbuff_write.
> 
> Addresses-Coverity: ("Resource Leak")
> Fixes: a7c3aa1509e2 ("brcmfmac: Remove brcmf_sdiod_addrprep()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Patch applied to wireless-drivers-next.git, thanks.

a927e8d8ab57 brcmfmac: fix leak of mypkt on error return path

-- 
https://patchwork.kernel.org/patch/10891135/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
