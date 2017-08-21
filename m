From: Jakub Kicinski <kubakici@wp.pl>
Date: Mon, 21 Aug 2017 22:25:15 +0000
Subject: Re: [PATCH v2] mt7601u: check memory allocation failure
Message-Id: <20170821152515.717a4681@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170821220617.21513-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170821220617.21513-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Tue, 22 Aug 2017 00:06:17 +0200, Christophe JAILLET wrote:
> Check memory allocation failure and return -ENOMEM in such a case, as
> already done a few lines below.
> 
> As 'dev->tx_q' can be NULL, we also need to check for that in
> 'mt7601u_free_tx()', and return early.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Jakub Kicinski <kubakici@wp.pl>
