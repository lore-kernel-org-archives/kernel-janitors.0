From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 18 Dec 2019 18:59:08 +0000
Subject: Re: [PATCH] rt2x00usb: Fix a warning message in 'rt2x00usb_watchdog_tx_dma()'
Message-Id: <20191218185908.49115C4479C@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204054355.11729-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191204054355.11729-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: sgruszka@redhat.com, helmut.schaa@googlemail.com, davem@davemloft.net, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> 'forced' is duplicated in the message, axe one of them.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied to wireless-drivers-next.git, thanks.

ffc7b2826a3c rt2x00usb: Fix a warning message in 'rt2x00usb_watchdog_tx_dma()'

-- 
https://patchwork.kernel.org/patch/11272155/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
