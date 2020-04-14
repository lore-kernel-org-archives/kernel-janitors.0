From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 14 Apr 2020 15:05:24 +0000
Subject: Re: [PATCH] brcm80211: remove redundant pointer 'address'
Message-Id: <20200414150525.01C0AC44792@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200405133906.381358-1-colin.king@canonical.com>
In-Reply-To: <20200405133906.381358-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'address' is being assigned and updated in a few places
> by it is never read. Hence the assignments are redundant and can
> be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

09667ea7ce6d brcm80211: remove redundant pointer 'address'

-- 
https://patchwork.kernel.org/patch/11474705/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
