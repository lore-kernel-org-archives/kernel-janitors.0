From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 05 Oct 2019 14:04:03 +0000
Subject: Re: [PATCH v2] mtd: onenand: prevent memory leak in onenand_scan
Message-Id: <d136f119-d408-0c20-c554-818d13dc48df@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004171909.6378-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191004171909.6378-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

> In onenand_scan if scan_bbt fails the allocated buffers for oob_buf,
> verify_buf, and page_buf should be released.

Can a wording like the following be nicer for the change description?

  Release the memory for the buffers “oob_buf”, “verify_buf” and “page_buf”
  after a call of the function “scan_bbt” failed in the implementation
  of the function “onenand_scan”.


> Fixes: 5988af231978 ("mtd: Flex-OneNAND support")
…
> ---
> Changes in v2:
…
> for the hint).

Did you take another review comment into account for this patch change log?


> ---

Please replace the delimiter at this place by a blank line in subsequent messages.


>  drivers/mtd/nand/onenand/onenand_base.c | 8 +++++++-
…


Regards,
Markus
