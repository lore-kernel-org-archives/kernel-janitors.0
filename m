From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 27 Feb 2018 16:25:52 +0000
Subject: Re: brcmsmac: remove duplicated bit-wise or of IEEE80211_CHAN_NO_IR
Message-Id: <20180227162552.B676C607E5@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180223133622.25700-1-colin.king@canonical.com>
In-Reply-To: <20180223133622.25700-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin Ian King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Bit pattern IEEE80211_CHAN_NO_IR is being bit-wise or'd twice;
> remove the redundant 2nd IEEE80211_CHAN_NO_IR
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

47c8a3956a60 brcmsmac: remove duplicated bit-wise or of IEEE80211_CHAN_NO_IR

-- 
https://patchwork.kernel.org/patch/10237695/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

