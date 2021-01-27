From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 27 Jan 2021 12:48:22 +0000
Subject: Re: [PATCH] mtd: rawnand: Fix an error handling path in 'ebu_dma_start()'
Message-Id: <20210127124822.13987-1-miquel.raynal@bootlin.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20210124073955.728797-1-christophe.jaillet@wanadoo.fr>
References: <20210124073955.728797-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210124073955.728797-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, vadivel.muruganx.ramuthevar@linux.intel.com, martin.blumenstingl@googlemail.com
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2021-01-24 at 07:39:55 UTC, Christophe JAILLET wrote:
> If 'dmaengine_prep_slave_single()' fails, we must undo a previous
> 'dma_map_single()' call, as already done in all the other error handling
> paths of this function.
> 
> Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
