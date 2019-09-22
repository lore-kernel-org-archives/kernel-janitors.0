From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Sun, 22 Sep 2019 03:18:43 +0000
Subject: Re: [PATCH] qede: qede_fp: simplify a bit 'qede_rx_build_skb()'
Message-Id: <20190921201843.12d21abf@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190920045656.3725-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190920045656.3725-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: aelior@marvell.com, GR-everest-linux-l2@marvell.com, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 20 Sep 2019 06:56:56 +0200, Christophe JAILLET wrote:
> Use 'skb_put_data()' instead of rewritting it.
> This improves readability.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.
