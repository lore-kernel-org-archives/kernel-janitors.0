From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 21 Jul 2015 14:59:55 +0000
Subject: Re: [v2] brcmsmac: Use kstrdup to simplify code
Message-Id: <20150721145955.0E500141A8D@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1436386966-16148-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Cc: brudley@broadcom.com, arend@broadcom.com, frankyl@broadcom.com, meuleman@broadcom.com, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


> Replace a kmalloc+strcpy by an equivalent kstrdup in order to improve
> readability.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Acked-by: Arend van Spriel <arend@broadcom.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
