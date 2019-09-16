From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Date: Mon, 16 Sep 2019 08:32:29 +0000
Subject: Re: [PATCH] brcmsmac: remove a useless test
Message-Id: <fc7f0338-c1f6-0659-3767-57c09b45fbbb@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190915193210.27357-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190915193210.27357-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, franky.lin@broadcom.com, hante.meuleman@broadcom.com, chi-hsien.lin@cypress.com, wright.feng@cypress.com, kvalo@codeaurora.org, davem@davemloft.net
Cc: linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 9/15/2019 9:32 PM, Christophe JAILLET wrote:
> 'pih' is known to be non-NULL at this point, so the test can be removed.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
