From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 06 May 2020 08:32:09 +0000
Subject: Re: [PATCH v2] ipw2x00: Remove a memory allocation failure log message
Message-Id: <20200506083209.4272FC433BA@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200424154527.27309-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200424154527.27309-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: stas.yakovlev@gmail.com, davem@davemloft.net, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Axe a memory allocation failure log message. This message is useless and
> incorrect (vmalloc is not used here for the memory allocation)
> 
> This has been like that since the very beginning of this driver in
> commit 43f66a6ce8da ("Add ipw2200 wireless driver.")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied to wireless-drivers-next.git, thanks.

c03e3fe91c19 ipw2x00: Remove a memory allocation failure log message

-- 
https://patchwork.kernel.org/patch/11508307/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
