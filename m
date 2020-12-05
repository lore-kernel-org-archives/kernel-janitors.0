From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Sat, 05 Dec 2020 08:31:04 +0000
Subject: Re: [PATCH] pcmcia/electra_cf: Fix some return values in 'electra_cf_probe()' in case of error
Message-Id: <X8tFSNBqbAY7caYN@light.dominikbrodowski.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200617195326.732863-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200617195326.732863-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: akpm@linux-foundation.org, peterz@infradead.org, olof@lixom.net, hch@lst.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Wed, Jun 17, 2020 at 09:53:26PM +0200 schrieb Christophe JAILLET:
> 'status' is known to be 0 at this point. It must be set to a meaningful
> value in order to return an error code if one of the 'of_get_property()'
> call fails.
> 
> Return -EINVAL in such a case.
> 
> Fixes: 2b571a066a2f("pcmcia: CompactFlash driver for PA Semi Electra boards")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to pcmcia-next. Thanks!

	Dominik
