From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 26 Nov 2015 12:55:14 +0000
Subject: Re: brcmfmac: constify brcmf_bus_ops structures
Message-Id: <20151126125514.86D88140631@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1447518127-1994-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Brett Rudley <brudley@broadcom.com>, kernel-janitors@vger.kernel.org, Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


> The brcmf_bus_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> Acked-by: Arend van Spriel <arend@broadcom.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
