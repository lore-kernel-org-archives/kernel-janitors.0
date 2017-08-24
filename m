From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 24 Aug 2017 09:55:46 +0000
Subject: Re: [v2] mt7601u: check memory allocation failure
Message-Id: <20170824095546.CBCFC606DD@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170821220617.21513-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170821220617.21513-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: kubakici@wp.pl, matthias.bgg@gmail.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Christophe Jaillet <christophe.jaillet@wanadoo.fr> wrote:

> Check memory allocation failure and return -ENOMEM in such a case, as
> already done a few lines below.
> 
> As 'dev->tx_q' can be NULL, we also need to check for that in
> 'mt7601u_free_tx()', and return early.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Acked-by: Jakub Kicinski <kubakici@wp.pl>

Patch applied to wireless-drivers-next.git, thanks.

b3b2f62c6238 mt7601u: check memory allocation failure

-- 
https://patchwork.kernel.org/patch/9913855/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

