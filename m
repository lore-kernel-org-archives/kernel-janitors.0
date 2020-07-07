From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 07 Jul 2020 18:56:46 +0000
Subject: Re: [PATCH] mtd: rawnand: ingenic: cleanup ARRAY_SIZE() vs sizeof() use
Message-Id: <20200707185646.24105-1-miquel.raynal@bootlin.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200624132640.GC9972@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Paul Cercueil <paul@crapouillou.net>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>

On Wed, 2020-06-24 at 13:26:40 UTC, Dan Carpenter wrote:
> The ARRAY_SIZE() is the number of elements but we want to use sizeof()
> here for the number of bytes.  Fortunately, they are the same thing
> because it's an array of u8 so this has no effect on runtime.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
