From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Wed, 10 Apr 2019 09:17:46 +0000
Subject: Re: [PATCH][V2] brcmfmac: fix leak of mypkt on error return path
Message-Id: <1cf38a7d-ddc8-bfe2-3c6b-8298facc6d1d@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190409114333.24342-1-colin.king@canonical.com>
In-Reply-To: <20190409114333.24342-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 09.04.2019 14:43, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if the call to brcmf_sdiod_set_backplane_window fails then
> then error return path leaks mypkt. Fix this by returning by a new

    One "then" is enough. :-)

> error path labelled 'out' that calls brcmu_pkt_buf_free_skb to free
> mypkt.  Also remove redundant check on err before calling
> brcmf_sdiod_skbuff_write.
> 
> Addresses-Coverity: ("Resource Leak")
> Fixes: a7c3aa1509e2 ("brcmfmac: Remove brcmf_sdiod_addrprep()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
[...]

MBR, Sergei
