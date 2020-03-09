From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 09 Mar 2020 14:03:41 +0000
Subject: Re: [PATCH] mtd: lpddr: Fix a double free in probe()
Message-Id: <20200309140341.22314-1-miquel.raynal@bootlin.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200228092554.o57igp3nqhyvf66t@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Alexey Korolev <akorolev@infradead.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, David Woodhouse <David.Woodhouse@intel.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Steve Winslow <swinslow@gmail.com>, Allison Randal <allison@lohutok.net>, Vignesh Raghavendra <vigneshr@ti.com>

On Fri, 2020-02-28 at 09:25:54 UTC, Dan Carpenter wrote:
> This function is only called from lpddr_probe().  We free "lpddr" both
> here and in the caller, so it's a double free.  The best place to free
> "lpddr" is in lpddr_probe() so let's delete this one.
> 
> Fixes: 8dc004395d5e ("[MTD] LPDDR qinfo probing.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
