From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 28 Jan 2021 21:25:34 +0000
Subject: Re: [PATCH] mtd: parser_imagetag: fix error codes in bcm963xx_parse_imagetag_partitions()
Message-Id: <20210128212534.2242-1-miquel.raynal@bootlin.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <YBKFtNaFHGYBj+u4@mwanda>
References: <YBKFtNaFHGYBj+u4@mwanda>
In-Reply-To: <YBKFtNaFHGYBj+u4@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>

On Thu, 2021-01-28 at 09:36:52 UTC, Dan Carpenter wrote:
> If the kstrtouint() calls fail, then this should return a negative
> error code but it currently returns success.
> 
> Fixes: dd84cb022b31 ("mtd: bcm63xxpart: move imagetag parsing to its own parser")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
